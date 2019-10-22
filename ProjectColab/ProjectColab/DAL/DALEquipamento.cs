using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALEquipamento
    {
        string connectionString = "";

        public DALEquipamento()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Equipamento obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            try
            {
                // Cria comando SQL
                SqlCommand com = conn.CreateCommand();

                DALSalas sala = new DALSalas();

                //Chama método para procurar a sala e devolver ID
                //int idLab = lab.SelectID(obj.laboratorio_nome);

                // Define comando de exclusão
                SqlCommand cmd = new SqlCommand("INSERT INTO Equipamento(sala_id,sala_nome,modelo,quantidade) VALUES(@sala_id,@sala_nome,@modelo,@quantidade)", conn);
                cmd.Parameters.AddWithValue("@sala_id", obj.sala_id);
                cmd.Parameters.AddWithValue("@sala_nome", obj.sala_nome);
                cmd.Parameters.AddWithValue("@modelo", obj.modelo);
                cmd.Parameters.AddWithValue("@quantidade", obj.quantidade);
                // Executa Comando
                cmd.ExecuteNonQuery();
            }
            finally
            {
                conn.Close();
            }                       
        }        

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Equipamento> SelectAll()
        {
            // Variavel para armazenar um livro
            Modelo.Equipamento aEquipamento;
            // Cria Lista Vazia
            List<Modelo.Equipamento> aListEquipamento = new List<Modelo.Equipamento>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Equipamento";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["sala_nome"].ToString(), dr["sala_id"].ToString(), dr["modelo"].ToString(), Convert.ToInt32(dr["quantidade"].ToString()));
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_nome"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListEquipamento.Add(aEquipamento);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListEquipamento;
        }

        //Busca
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Equipamento> SelectSearch(string modelo)
        {
            // Variavel para armazenar um livro
            Modelo.Equipamento aEquipamento;
            // Cria Lista Vazia
            List<Modelo.Equipamento> aListEquipamento = new List<Modelo.Equipamento>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Equipamento where modelo like '%" + modelo + "%'";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["sala_nome"].ToString(), dr["sala_id"].ToString(), dr["modelo"].ToString(), Convert.ToInt32(dr["quantidade"].ToString()));
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_nome"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListEquipamento.Add(aEquipamento);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListEquipamento;
        }

        //EDITAR//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Equipamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Equipamento Set modelo= @modelo, quantidade = @quantidade  Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@modelo", obj.modelo);
            cmd.Parameters.AddWithValue("@quantidade", obj.quantidade);

            cmd.ExecuteNonQuery();
        }

        //DELETAR

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Equipamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Delete From Equipamento Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Equipamento> SelectFromSala(string idsala)
        {
            Modelo.Equipamento aEquipamento;

            List<Modelo.Equipamento> aListEquipamento = new List<Modelo.Equipamento>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * From Equipamento Where sala_id = @id";
            cmd.Parameters.AddWithValue("@id", idsala);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["sala_nome"].ToString(), dr["sala_id"].ToString(), dr["modelo"].ToString(), Convert.ToInt32(dr["quantidade"].ToString()));

                    aListEquipamento.Add(aEquipamento);
                }
            }

            dr.Close();

            conn.Close();

            return aListEquipamento;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Equipamento> Select(string id)
        {
            Modelo.Equipamento aEquipamento;

            List<Modelo.Equipamento> aListEquipamento = new List<Modelo.Equipamento>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * From Equipamento Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["sala_nome"].ToString(), dr["sala_id"].ToString(), dr["modelo"].ToString(), Convert.ToInt32(dr["quantidade"].ToString()));

                    aListEquipamento.Add(aEquipamento);
                }
            }

            dr.Close();

            conn.Close();

            return aListEquipamento;
        }
    }
}
