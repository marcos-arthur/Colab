using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALLaboratorio
    {
        string connectionString = "";

        public DALLaboratorio()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        public int SelectID(string nomeLab)
        {
            int id = 0;

            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("select id from Laboratorios where nome = @nome", conn);
            cmd.Parameters.AddWithValue("@nome", nomeLab);

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
        public List<Modelo.Laboratorios> selectSearch(string nome)
        {
            // Variavel para armazenar um livro
            Modelo.Laboratorios aLaboratorios;
            // Cria Lista Vazia
            List<Modelo.Laboratorios> aListLaboratorios = new List<Modelo.Laboratorios>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Laboratorios where nome like '%" + nome + "%'";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aLaboratorios = new Modelo.Laboratorios(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_id"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListLaboratorios.Add(aLaboratorios);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListLaboratorios;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Laboratorios> SelectAll()
        {
            // Variavel para armazenar um livro
            Modelo.Laboratorios aLaboratorios;
            // Cria Lista Vazia
            List<Modelo.Laboratorios> aListLaboratorios = new List<Modelo.Laboratorios>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Laboratorios";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aLaboratorios = new Modelo.Laboratorios(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_id"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListLaboratorios.Add(aLaboratorios);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListLaboratorios;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Laboratorios obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Laboratorios(nome,status) VALUES(@nome,1)", conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            // Executa Comando            
            cmd.ExecuteNonQuery();                               
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Laboratorios obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Laboratorios Set nome = @nome, status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }
        
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Laboratorios> SelectStatus1()
        {
            DALLaboratorio usu = new DALLaboratorio();

            // Variavel para armazenar um livro
            Modelo.Laboratorios aLab;
            // Cria Lista Vazia
            List<Modelo.Laboratorios> aListLab = new List<Modelo.Laboratorios>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "Select * from Laboratorios Where status = 1";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aLab = new Modelo.Laboratorios(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                    // Adiciona o livro lido à lista
                    aListLab.Add(aLab);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListLab;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Laboratorios Select2(string id)
        {

            Modelo.Laboratorios aLaboratorios = new Modelo.Laboratorios();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT id, nome, status, CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'FECHADO'END AS status FROM Laboratorios where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aLaboratorios = new Modelo.Laboratorios(dr["id"].ToString(), dr["nome"].ToString(), dr["status"].ToString());
                }
            }

            dr.Close();

            conn.Close();

            return aLaboratorios;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public string SelectNome(string id)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * From Laboratorios Where id = @id";
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


        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Laboratorios obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Delete From Equipamento Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("Delete From Laboratorios Where id = @id", conn);
            cmd2.Parameters.AddWithValue("@id", obj.id);
            cmd2.ExecuteNonQuery();
        }

    }
}