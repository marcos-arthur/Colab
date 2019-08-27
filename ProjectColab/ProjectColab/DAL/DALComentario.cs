using System;
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
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Comentario> Select(string id)
        {
            Modelo.Comentario aComentario;

            List<Modelo.Comentario> aListComentario = new List<Modelo.Comentario>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT * FROM Comentario chamados_id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aComentario = new Modelo.Comentario(dr["id"].ToString(), dr["usuario_id"].ToString(), dr["chamados_id"].ToString(),  Convert.ToDecimal(dr["restricao"].ToString()),dr["descricao"].ToString(), Convert.ToDateTime(dr["data_hora"].ToString()));

                    aListComentario.Add(aComentario);
                }
            }   

            dr.Close();

            conn.Close();

            aListComentario;
        }
    }
}