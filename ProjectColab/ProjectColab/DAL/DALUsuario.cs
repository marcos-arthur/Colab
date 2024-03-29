﻿using System;
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
   
        //SELECIONAR//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Usuario Select(string id)
        {
            Modelo.Usuario aUsuario = new Modelo.Usuario();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * From Usuario Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {                   
                    aUsuario = new Modelo.Usuario(dr["id"].ToString(), 
                        dr["nome"].ToString(), dr["login"].ToString(),
                        dr["senha"].ToString(),
                        Convert.ToInt32(dr["tipo"].ToString()),                        
                        Convert.ToInt32(dr["status"].ToString()));
                }
            }
            dr.Close();
            conn.Close();
            return aUsuario;
        }

        //SELECIONAR//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Usuario SelectLogin(string login)
        {
            Modelo.Usuario aUsuario = new Modelo.Usuario();
            List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * From Usuario Where login = @login";
            cmd.Parameters.AddWithValue("@login", login);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aUsuario = new Modelo.Usuario(dr["id"].ToString(),
                       dr["nome"].ToString(), dr["login"].ToString(),
                       dr["senha"].ToString(),
                       Convert.ToInt32(dr["tipo"].ToString()),                      
                       Convert.ToInt32(dr["status"].ToString()));
                    //aListUsuario.Add(aUsuario);
                }
            }

            dr.Close();
            conn.Close();

            return aUsuario;
        }

        //SELECTALL()//
        [DataObjectMethod(DataObjectMethodType.Select)]
         public List<Modelo.Usuario> SelectAll()
         {
             // Variavel para armazenar um livro
             Modelo.Usuario aUsuario;
             // Cria Lista Vazia
             List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
             // Cria Conexão com banco de dados
             SqlConnection conn = new SqlConnection(connectionString);
             // Abre conexão com o banco de dados
             conn.Open();
             // Cria comando SQL
             SqlCommand cmd = conn.CreateCommand();
             // define SQL do comando
             cmd.CommandText = "Select id, nome, login, senha, tipo, status, CASE WHEN " + "tipo = 2 THEN 'Servidor' WHEN tipo = 3 THEN 'Bolsista' WHEN tipo = 4 THEN 'Professor' END AS tipo, " +
                                "CASE WHEN status = 1 THEN 'Ativo' END AS status FROM Usuario where (status = 1) and (tipo = 2 or tipo = 3 or tipo = 4)";

                                
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
             // Le titulo do livro do resultado e apresenta no segundo rótulo
             if (dr.HasRows)
             {

                 while (dr.Read()) // Le o proximo registro
                 {
                    // Cria objeto com dados lidos do banco de dados
                    aUsuario = new Modelo.Usuario(dr["id"].ToString(),
                      dr["nome"].ToString(), 
                      dr["login"].ToString(),
                      dr["senha"].ToString(),
                      Convert.ToInt32(dr["tipo"].ToString()),                      
                      Convert.ToInt32(dr["status"].ToString()));
                    // Adiciona o livro lido à lista
                    aListUsuario.Add(aUsuario);
                 }
             }
             // Fecha DataReader
             dr.Close();
             // Fecha Conexão
             conn.Close();

             return aListUsuario;
         }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Usuario> SelectBolsistaServidor()
        {
            // Variavel para armazenar um livro
            Modelo.Usuario aUsuario;
            // Cria Lista Vazia
            List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "select * from usuario where tipo = 3 or tipo = 2";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aUsuario = new Modelo.Usuario(dr["id"].ToString(),
                       dr["nome"].ToString(), 
                       dr["login"].ToString(),
                       dr["senha"].ToString(),
                       Convert.ToInt32(dr["tipo"].ToString()),
                       Convert.ToInt32(dr["status"].ToString()));
                    // Adiciona o livro lido à lista
                    aListUsuario.Add(aUsuario);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListUsuario;
        }        

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Usuario> SelectAllStatus2()
        {
            DALUsuario usu = new DALUsuario();           

            // Variavel para armazenar um livro
            Modelo.Usuario aUsuario;
            // Cria Lista Vazia
            List<Modelo.Usuario> aListUsuario = new List<Modelo.Usuario>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "Select id, nome, login, senha, tipo, status, CASE WHEN " + "tipo = 2 THEN 'Servidor' WHEN tipo = 3 THEN 'Bolsista' WHEN tipo = 4 THEN 'Professor' END AS tipo, " +
                                "CASE WHEN status = 2 THEN 'Inativo' END AS status FROM Usuario where (status = 2) and (tipo = 2 or tipo = 3 or tipo = 4)";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    // Cria objeto com dados lidos do banco de dados
                    aUsuario = new Modelo.Usuario(dr["id"].ToString(),
                       dr["nome"].ToString(), dr["login"].ToString(),
                       dr["senha"].ToString(),
                       Convert.ToInt32(dr["tipo"].ToString()),
                       Convert.ToInt32(dr["status"].ToString()));
                    // Adiciona o livro lido à lista
                    aListUsuario.Add(aUsuario);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListUsuario;
        }

        //INSERIR//
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Usuario obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Usuario(nome,login,senha,tipo,status) VALUES(@nome,@login,@senha,@tipo, @status)", conn);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@login", obj.login);
            cmd.Parameters.AddWithValue("@senha", obj.senha);
            cmd.Parameters.AddWithValue("@tipo", obj.tipo);            
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }

        //EDITAR TODOS//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Usuario Set nome = @nome, login = @login, tipo = @tipo, status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@nome", obj.nome);
            cmd.Parameters.AddWithValue("@login", obj.login);          
            cmd.Parameters.AddWithValue("@tipo", obj.tipo);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }

        
        //EDITAR STATUS//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void UpdateStatus(Modelo.Usuario obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Usuario Set status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }


        
    }
}
