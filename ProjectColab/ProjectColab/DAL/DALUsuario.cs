using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALUsuario
    {
        string connectionString = "";

        public DALUsuario()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Usuario> SelectAll()
        {
            Modelo.Usuario aUsuario;

            List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select * from Usuario";

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aSalas = new Modelo.Usuario(dr["nome"].ToString());

                    aListUsuario.Add(aUsuario);
                }
            }

            dr.Close();

            conn.Close();

            return aListUsuario;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Insert Usuario into Usuario(nome, login, senha, tipo, foto_url) Values(@nome, @login, @senha, @tipo, @foto_url");
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@login", obj.nome);
            cmd.Parameters.AddWithValue("@senha", obj.nome);
            cmd.Parameters.AddWithValue("@tipo", obj.nome);
            cmd.Parameters.AddWithValue("@foto_url", obj.nome);

            cmd.ExecuteNonQuery();
        }


        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Usuario Set nome = @nome, @login, @senha, @tipo, @foto_url" ,conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@login", obj.nome);
            cmd.Parameters.AddWithValue("@senha", obj.nome);
            cmd.Parameters.AddWithValue("@tipo", obj.nome);
            cmd.Parameters.AddWithValue("@foto_url", obj.nome);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Usuario> Select(string id)
        {
            Modelo.Usuario aUsuario;

            List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Selec * from Usuario where id = @id, login = @login, senha = @senha, tipo = @tipo, foto_url = @foto_url";
            cmd.Parameters.AddWithValue("@id", id);


            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aUsuario= new Modelo.Usuario(dr["nome"].ToString());

                    aListUsuario.Add(aUsuario);
                }
            }

            dr.Close();

            conn.Close();

            return aListUsuario;
        }
    }
}