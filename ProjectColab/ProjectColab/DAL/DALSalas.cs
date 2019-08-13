using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALSalas
    {
        string connectionString = "";

        public DALSalas()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Salas> SelectAll() {
            Modelo.Salas aSalas;

            List<Modelo.Salas> aListSalas = new List<Modelo.Salas>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * from Salas";

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows) {
                while (dr.Read()) {
                    aSalas = new Modelo.Salas(dr["nome"].ToString());

                    aListSalas.Add(aSalas);
                }
            }

            dr.Close();

            conn.Close();

            return aListSalas;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Salas obj) {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Insert Salas into Salas(nome) Values(@nome)");
            cmd.Parameters.AddWithValue("@nome", obj.nome);

            cmd.ExecuteNonQuery();
        }


        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Salas obj) {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();                                   

            SqlCommand cmd = new SqlCommand("Update Salas Set nome = @nome", conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Salas> Select(string id) {
            Modelo.Salas aSalas;

            List<Modelo.Salas> aListSalas = new List<Modelo.Salas>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Selec * from Salas where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows) {
                while (dr.Read()) {
                    aSalas = new Modelo.Salas(dr["nome"].ToString());

                    aListSalas.Add(aSalas);
                }
            }

            dr.Close();

            conn.Close();

            return aListSalas;
        }
    }
}