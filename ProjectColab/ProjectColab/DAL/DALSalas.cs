using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALSalas
    {
        string connectionString = "";

        public DALSalas()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        public int SelectID(string nomesala)
        {
            int id = 0;

            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("select id from Salas where nome = @nome", conn);
            cmd.Parameters.AddWithValue("@nome", nomesala);

            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    id = Convert.ToInt32(dr["id"]);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return id;
        }

        //Pesquisa somente por nome
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Salas> selectSearch(string nome)
        {
            // Variavel para armazenar um livro
            Modelo.Salas aSalas;
            // Cria Lista Vazia
            List<Modelo.Salas> aListSalas = new List<Modelo.Salas>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Salas where nome like '%" + nome + "%'";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aSalas = new Modelo.Salas(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_id"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListSalas.Add(aSalas);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListSalas;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Salas> SelectAll()
        {
            // Variavel para armazenar um livro
            Modelo.Salas aSalas;
            // Cria Lista Vazia
            List<Modelo.Salas> aListSalas = new List<Modelo.Salas>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Salas";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aSalas = new Modelo.Salas(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_id"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListSalas.Add(aSalas);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListSalas;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Salas obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Salas(nome,status) VALUES(@nome,1)", conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            // Executa Comando            
            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Salas obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Salas Set nome = @nome, status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Salas> SelectStatus1()
        {
            DALSalas usu = new DALSalas();

            // Variavel para armazenar um livro
            Modelo.Salas aSalas;
            // Cria Lista Vazia
            List<Modelo.Salas> aListSalas = new List<Modelo.Salas>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "Select * from Salas Where status = 1";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aSalas = new Modelo.Salas(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista
                    aListSalas.Add(aSalas);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListSalas;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Salas Select2(string id)
        {

            Modelo.Salas aSalas = new Modelo.Salas();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT id, nome, status, CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'FECHADO'END AS status FROM Salas where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aSalas = new Modelo.Salas(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                }
            }

            dr.Close();

            conn.Close();

            return aSalas;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public string SelectNome(string id)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * From Salas Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            string nome = "";
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    nome = dr["nome"].ToString();
                }
            }

            dr.Close();

            conn.Close();

            return nome;
        }


    }
}