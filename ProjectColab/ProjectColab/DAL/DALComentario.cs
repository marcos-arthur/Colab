﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALComentario
    {

        string connectionString = "";

        public DALComentario()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Comentario obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Comentario(usuario_id,chamados_id,restricao,descricao,data_hora) VALUES (@usuario_id,@chamados_id,@restricao,@descricao,@data_hora)", conn);
            cmd.Parameters.AddWithValue("@usuario_id", obj.usuario_id);
            cmd.Parameters.AddWithValue("@chamados_id", obj.chamados_id);
            cmd.Parameters.AddWithValue("@restricao", obj.restricao);
            cmd.Parameters.AddWithValue("@descricao", obj.descricao);
            cmd.Parameters.AddWithValue("@data_hora", obj.data_hora);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Comentario> Select(string id)
        {
            Modelo.Comentario aComentario;

            List<Modelo.Comentario> aListcomentario  = new List<Modelo.Comentario>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT * FROM Comentario  WHERE chamados_id = @id ORDER BY data_hora DESC";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aComentario = new Modelo.Comentario(dr["id"].ToString(), dr["usuario_id"].ToString(),Convert.ToInt32( dr["chamados_id"].ToString()), Convert.ToDecimal(dr["restricao"].ToString()), dr["descricao"].ToString(), Convert.ToDateTime(dr["data_hora"].ToString()));

                    aListcomentario.Add(aComentario);
                }
            }

            dr.Close();

            conn.Close();

            return aListcomentario;
        }

    }
}