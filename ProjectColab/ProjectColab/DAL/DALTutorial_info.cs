using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALTutorial_info
    {
        private string connectionString = "";

        public DALTutorial_info()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial_info> Select(string tutorial_id)
        {
            // Variavel para armazenar um livro
            Modelo.Tutorial_info aTutorial_info;
            // Cria Lista Vazia
            List<Modelo.Tutorial_info> aListTutorial_info = new List<Modelo.Tutorial_info>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "Select * from Tutorial_info Where tutorial_id = @tutorial_id";
            cmd.Parameters.AddWithValue("@pub_id", tutorial_id);
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aTutorial_info = new Modelo.Tutorial_info(
                        dr["tutorial_id"].ToString(),
                        (byte[])dr["logo"],
                        dr["pr_info"].ToString(),
                        dr["arquivo"].ToString()
                        );
                    // Adiciona o livro lido à lista
                    aListTutorial_info.Add(aTutorial_info);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial_info;
        }
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Tutorial_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("DELETE FROM Pub_info WHERE tutorial_id = @tutorial_id", conn);
            cmd.Parameters.AddWithValue("@pub_id", obj.tutorial_id);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Tutorial_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Pub_info (tutorial_id, logo, pr_info, arquivo) VALUES(@tutorial_id, @logo, @pr_info, @arquivo)", conn);
            cmd.Parameters.AddWithValue("@tutorial_id", obj.tutorial_id);
            cmd.Parameters.AddWithValue("@logo", obj.logo);
            cmd.Parameters.AddWithValue("@pr_info", obj.pr_info);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            // Executa Comando
            cmd.ExecuteNonQuery();
        }
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Tutorial_info obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("UPDATE Pub_info SET logo = @logo, pr_info = @pr_info, arquivo = @arquivo WHERE tutorial_id = @tutorial_id", conn);
            cmd.Parameters.AddWithValue("@tutorial_id", obj.tutorial_id);
            cmd.Parameters.AddWithValue("@logo", obj.logo);
            cmd.Parameters.AddWithValue("@pr_info", obj.pr_info);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            // Executa Comando
            cmd.ExecuteNonQuery();
        }
    }
}