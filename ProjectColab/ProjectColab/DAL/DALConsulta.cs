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
            cmd.CommandText = "  SELECT lab.*,eq.* FROM Laboratorios lab INNER JOIN Equipamento eq ON eq.laboratorio_id = lab.id";

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
    }

}
}