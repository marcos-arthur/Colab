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
            cmd.CommandText = "Select * from Laboratorios";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aLaboratorios = new Modelo.Laboratorios(dr["id"].ToString(),dr["nome"].ToString(),dr["modelo"].ToString(), Convert.ToInt32(dr["quantidade"].ToString()));
                    // Adiciona o livro lido à lista
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
            SqlCommand cmd = new SqlCommand("INSERT INTO Laboratorios(id,nome,modelo,quantidade) VALUES(1,tudobom,you,2)", conn);
            cmd.Parameters.AddWithValue("id", obj.id);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@quantidade", obj.quantidade);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }
    }
}