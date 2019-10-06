﻿using System;
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

                DALLaboratorio lab = new DALLaboratorio();

                //Chama método para procurar laboratório e devolver ID
                int idLab = lab.SelectID(obj.laboratorio_nome);

                // Define comando de exclusão
                SqlCommand cmd = new SqlCommand("INSERT INTO Equipamento(laboratorio_nome,modelo,quantidade) VALUES(@laboratorio_nome,@modelo,@quantidade)", conn);
               // cmd.Parameters.AddWithValue("@laboratorio_id", idLab);
                cmd.Parameters.AddWithValue("@laboratorio_nome", obj.laboratorio_nome);
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
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["laboratorio_nome"].ToString(), dr["modelo"].ToString(), Convert.ToDecimal(dr["quantidade"].ToString()));
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
                    aEquipamento = new Modelo.Equipamento(dr["id"].ToString(), dr["laboratorio_nome"].ToString(), dr["modelo"].ToString(), Convert.ToDecimal(dr["quantidade"].ToString()));

                    aListEquipamento.Add(aEquipamento);
                }
            }

            dr.Close();

            conn.Close();

            return aListEquipamento;
        }
    }
}
