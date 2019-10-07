using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALConsulta
    {
        string connectionString = "";

        public DALConsulta()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }
        public DataSet SelectPublishers()
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "  SELECT lab.id AS 'CODIGO',lab.nome AS 'NOME DO LABORATÓRIO',eq.id AS 'CODIGO DO EQUIPAMENTO',eq.modelo 'AS MODELO DOS EQUIPAMENTOS',eq.quantidade 'A QUANTIDADE DE EQUIPAMENTO'  FROM Laboratorios lab INNER JOIN Equipamento eq ON eq.laboratorio_id = lab.id";

            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataSet SelectChamados(int id)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT count(case when usuario_atribuido_id LIKE @id then 1 end) as myCount, count(*) as count, count(case when usuario_atribuido_id IS NULL then 1 end) as noCount FROM Chamado ";
            cmd.Parameters.AddWithValue("@id", id);

            // Cria objeto DataAdapter para execução do comando e 
            // geração de dados para o Dataset
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            // Cria o objeto Dataset para armazernar o resultada da 
            // consulta SQL a ser executada
            DataSet ds = new DataSet();

            // Executa o comando SQL e tranfere o resultado para o DataSet
            da.Fill(ds);

            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Equipamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Equipamento Set nome = @nome, laboratorio_nome = @laboratorio_nome , modelo = @modelo , quantidade = @quantidade   Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@laboratorio_nome", obj.laboratorio_nome);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@quantidade", obj.quantidade);

            cmd.ExecuteNonQuery();
        }
    }
}