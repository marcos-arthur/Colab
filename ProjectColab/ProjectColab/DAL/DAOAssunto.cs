using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DAOAssunto
    {
        string connectionString = "";

        public DAOAssunto()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        //Select id
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Assunto Select(string id)
        {
            Modelo.Assunto aAssunto = new Modelo.Assunto();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * From Assunto Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aAssunto = new Modelo.Assunto(dr["id"].ToString(), dr["titulo"].ToString());
                }
            }

            dr.Close();
            conn.Close();
            return aAssunto;
        }

        //Select All
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Assunto> SelectAll()
        {
            Modelo.Assunto aAssunto = new Modelo.Assunto();
            List<Modelo.Assunto> listAssunto = new List<Modelo.Assunto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * From Assunto";
            
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aAssunto = new Modelo.Assunto(dr["id"].ToString(), dr["titulo"].ToString());
                    listAssunto.Add(aAssunto);
                }
            }

            dr.Close();
            conn.Close();
            return listAssunto;
        }
    }
}