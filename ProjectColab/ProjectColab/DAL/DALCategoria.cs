using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALCategoria
    {
        string connectionString = "";

        public DALCategoria()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        //Metódo para selecionar todas as categorias
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Categoria> SelectAll()
        {
            // Variavel para armazenar um livro
            Modelo.Categoria aCategoria;
            // Cria Lista Vazia
            List<Modelo.Categoria> aListCategoria = new List<Modelo.Categoria>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "SELECT * FROM Categoria";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aCategoria = new Modelo.Categoria(dr["id"].ToString(), dr["nome"].ToString());
                    // Adiciona o livro lido à lista /*, dr["eq.id"].ToString(), dr["eq.laboratorio_id"].ToString(), dr["eq.modelo"].ToString(), Convert.ToDecimal(dr["eq.quantidade"].ToString())*/
                    aListCategoria.Add(aCategoria);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListCategoria;
        }

        //Selecionar uma categoria específica
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Categoria Select(string id)
        {
            // Variavel para armazenar uma categoria
            Modelo.Categoria aCategoria = new Modelo.Categoria();            

            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);

            // Abre conexão com o banco de dados
            conn.Open();

            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();

            // define SQL do comando com parâmetros
            cmd.CommandText = "SELECT * FROM Categoria where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();

            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aCategoria = new Modelo.Categoria(dr["id"].ToString(), dr["nome"].ToString());                    
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aCategoria;
        }
    }
}