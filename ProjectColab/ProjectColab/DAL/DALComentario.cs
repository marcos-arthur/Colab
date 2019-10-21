using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALComentario
    {

        string connectionString = "";

        public DALComentario()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        //metódo de inserir um comentário
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Comentario obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de inserir 
            SqlCommand cmd = new SqlCommand("INSERT INTO Comentario(usuario_id,chamados_id,restricao,descricao,data_hora,status) VALUES (@usuario_id,@chamados_id,@restricao,@descricao,@data_hora, @status)", conn);
            cmd.Parameters.AddWithValue("@usuario_id", obj.usuario_id);
            cmd.Parameters.AddWithValue("@chamados_id", obj.chamados_id);
            cmd.Parameters.AddWithValue("@restricao", obj.restricao);
            cmd.Parameters.AddWithValue("@descricao", obj.descricao);
            cmd.Parameters.AddWithValue("@data_hora", obj.data_hora);
            cmd.Parameters.AddWithValue("@status", obj.status);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }

        //Metódo para selecionar apenas comentários externos (statuts = 1)
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Comentario> Select(string id)
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            Modelo.Comentario aComentario;

            List<Modelo.Comentario> aListcomentario  = new List<Modelo.Comentario>();
            if (id != null)
            {
                SqlConnection conn = new SqlConnection(connectionString);

                conn.Open();

                SqlCommand cmd = conn.CreateCommand();

                cmd.CommandText = "SELECT * FROM Comentario  WHERE chamados_id = @id and status = 1 ORDER BY data_hora DESC";
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Retorna o nome do usuário
                        nomeUsuario = usu.SelectNome(dr["usuario_id"].ToString());
                        // Cria objeto com dados lidos do banco de dados
                        aComentario = new Modelo.Comentario(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["chamados_id"].ToString(), Convert.ToInt32(dr["restricao"].ToString()), dr["descricao"].ToString(), Convert.ToDateTime(dr["data_hora"].ToString()));

                        aListcomentario.Add(aComentario);
                    }
                }

                dr.Close();

                conn.Close();
            }

            return aListcomentario;
        }

        //Metódo para selecionar apenas comentários internos (statuts = 2)
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Comentario> SelectInterno(string id)
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            Modelo.Comentario aComentario;

            List<Modelo.Comentario> aListcomentario = new List<Modelo.Comentario>();
            if (id != null)
            {
                SqlConnection conn = new SqlConnection(connectionString);

                conn.Open();

                SqlCommand cmd = conn.CreateCommand();

                cmd.CommandText = "SELECT * FROM Comentario  WHERE chamados_id = @id and status = 2 ORDER BY data_hora DESC";
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //Retorna o nome do usuário
                        nomeUsuario = usu.SelectNome(dr["usuario_id"].ToString());
                        // Cria objeto com dados lidos do banco de dados
                        aComentario = new Modelo.Comentario(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["chamados_id"].ToString(), Convert.ToInt32(dr["restricao"].ToString()), dr["descricao"].ToString(), Convert.ToDateTime(dr["data_hora"].ToString()));

                        aListcomentario.Add(aComentario);
                    }
                }

                dr.Close();

                conn.Close();
            }

            return aListcomentario;
        }

    }
}