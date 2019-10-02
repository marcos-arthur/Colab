using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALChamado
    {
        string connectionString = "";

        public DALChamado()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectAll()
        {
            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT id,status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado; ";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(),Convert.ToInt32(dr["status"].ToString()),dr["statuschamado"].ToString(),dr["resumo"].ToString(),Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()),Convert.ToDateTime( dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Chamado obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Chamado(status,resumo,quant_equipamentos_defeituosos,data) VALUES (@status,@resumo,@quant_equipamentos_defeituosos,@data)", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@resumo", obj.resumo);
            cmd.Parameters.AddWithValue("@quant_equipamentos_defeituosos", obj.quantidadeeq);
            cmd.Parameters.AddWithValue("@data", obj.data);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> Select(string id)
        {
            Modelo.Chamado aChamado;

            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();

SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT * FROM Chamado WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), Convert.ToInt32(dr["status"].ToString()), "1", dr["resumo"].ToString(), Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));

                    aListChamado.Add(aChamado);
                }
            }

            dr.Close();

            conn.Close();

            return aListChamado;
        }

    }
}