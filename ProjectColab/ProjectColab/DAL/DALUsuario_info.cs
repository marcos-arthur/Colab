using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALUsuario_info
    {
        private string connectionString = "";

        public DALUsuario_info()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }
       /* [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Usuario_info> Select(string usuario_id)
        {
            // Variavel para armazenar um livro
            Modelo.Usuario_info aUsuario_info;
            // Cria Lista Vazia
            List<Modelo.Usuario_info> aListTutorial_info = new List<Modelo.Usuario_info>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "Select * from Usuario_info Where usuario_id = @usuario_id";
            cmd.Parameters.AddWithValue("@usuario_id", usuario_id);
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aUsuario_info = new Modelo.Usuario_info(
                        dr["usuario_id"].ToString(),
                        (byte[])dr["foto"],
                        dr["us_info"].ToString(),
                        dr["arquivo"].ToString()
                        );
                    // Adiciona o livro lido à lista
                    aListTutorial_info.Add(aUsuario_info);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

           // return aListUsuario_info; ------------importante
        }*/
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Usuario_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("DELETE FROM Pub_info WHERE usuario_id = @usuario_id", conn);
            cmd.Parameters.AddWithValue("@pub_id", obj.usuario_id);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Usuario_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Pub_info (usuario_id, foto, us_info, arquivo) VALUES(@usuario_id, @foto, @pr_info, @arquivo)", conn);
            cmd.Parameters.AddWithValue("@tutorial_id", obj.usuario_id);
            cmd.Parameters.AddWithValue("@logo", obj.foto);
            cmd.Parameters.AddWithValue("@pr_info", obj.us_info);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            // Executa Comando
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Usuario_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("UPDATE Pub_info SET foto = @foto, us_info = @us_info, arquivo = @arquivo WHERE usuario_id = @usuario_id", conn);
            cmd.Parameters.AddWithValue("@tutorial_id", obj.usuario_id);
            cmd.Parameters.AddWithValue("@logo", obj.foto);
            cmd.Parameters.AddWithValue("@us_info", obj.us_info);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            // Executa Comando
            cmd.ExecuteNonQuery();
        }
    }
}