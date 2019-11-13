using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALTutorial
    {
        string connectionString = "";

        public DALTutorial()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        //SELECTALL()//
        //Teste
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial> SelectAll()
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            // Variavel para armazenar um livro
            Modelo.Tutorial aTutorial;
            // Cria Lista Vazia
            List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText =   "select	tut.*, " +
                                "Assun.titulo as Assunto, " +
                                "Assun.id as idAssunto " +
                                "from Tutorial as tut " +
                                "inner join Tutorial_Assunto as TA on tut.id = TA.tutorial_id " +
                                "inner join Assunto as Assun on Assun.id = TA.assunto_id";

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    // Cria objeto com dados lidos do banco de dados
                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), dr["Assunto"].ToString());
                    // Adiciona o livro lido à lista
                    aListTutorial.Add(aTutorial);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial;
        }

        //Pesquisa somente por titulo
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial> selectSearch(string titulo, string idAssunto)
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            // Variavel para armazenar um livro
            Modelo.Tutorial aTutorial;
            Modelo.Assunto aAssunto;

            // Cria Lista Vazia
            List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();

            // define SQL do comando

            //cmd.CommandText = "Select * from Tutorial where tutorial_titulo like '%" + titulo + "%'";

            cmd.CommandText =   "select tut.*, " +
                                "Assun.titulo as Assunto, " +
                                "Assun.id as idAssunto " +
                                "from Tutorial as tut " +
                                "inner join Tutorial_Assunto as TA on tut.id = TA.tutorial_id " +
                                "inner join Assunto as Assun on Assun.id = TA.assunto_id " +
                                "where tut.tutorial_titulo like '%" + titulo + "%' and Assun.id = " + idAssunto;            

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    // Cria objeto com dados lidos do banco de dados
                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), dr["Assunto"].ToString());
                    //aAssunto = new Modelo.Assunto(dr["idAssunto"].ToString(), dr["Assunto"].ToString());

                    // Adiciona o livro lido à lista
                    aListTutorial.Add(aTutorial);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial;            
        }


        //Tutoriais com status 1(submetido)
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial> SelectStatus1()
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            // Variavel para armazenar um livro
            Modelo.Tutorial aTutorial;
            // Cria Lista Vazia
            List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText = "select	tut.*, " +
                                "Assun.titulo as Assunto, " +
                                "Assun.id as idAssunto " +
                                "from Tutorial as tut " +
                                "inner join Tutorial_Assunto as TA on tut.id = TA.tutorial_id " +
                                "inner join Assunto as Assun on Assun.id = TA.assunto_id " +
                                "Where tut.status = 1";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    // Cria objeto com dados lidos do banco de dados
                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), dr["Assunto"].ToString());
                    // Adiciona o livro lido à lista
                    aListTutorial.Add(aTutorial);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial;
        }

        //Select para adição
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial> SelectStatus1toAdd()
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            // Variavel para armazenar um livro
            Modelo.Tutorial aTutorial;
            // Cria Lista Vazia
            List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText =   "select * from tutorial " +
                                "where status = 1";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    // Cria objeto com dados lidos do banco de dados
                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), "");
                    // Adiciona o livro lido à lista
                    aListTutorial.Add(aTutorial);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial;
        }


        //Tutoriais com status 2(aprovado)
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Tutorial> SelectAllStatus2()
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            // Variavel para armazenar um livro
            Modelo.Tutorial aTutorial;
            // Cria Lista Vazia
            List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            // define SQL do comando
            cmd.CommandText =   "select	tut.*, " +
                                "Assun.titulo as Assunto, " +
                                "Assun.id as idAssunto " +
                                "from Tutorial as tut " +
                                "inner join Tutorial_Assunto as TA on tut.id = TA.tutorial_id " +
                                "inner join Assunto as Assun on Assun.id = TA.assunto_id " +
                                "Where tut.status = 2";

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    // Cria objeto com dados lidos do banco de dados
                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), dr["Assunto"].ToString());
                    // Adiciona o livro lido à lista
                    aListTutorial.Add(aTutorial);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListTutorial;
        }

        //INSERIR//

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Tutorial obj, string idAssunto)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Tutorial(usuario_id, tutorial_titulo, status, arquivo) VALUES(@usuario_id, @tutorial_titulo, 1, @arquivo)", conn);
            cmd.Parameters.AddWithValue("@usuario_id", obj.idUsuario); 
            cmd.Parameters.AddWithValue("@tutorial_titulo", obj.tutorial_titulo);
            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);
            // Executa Comando
            cmd.ExecuteNonQuery();

            //Pegar id do tutorial com select            

            Modelo.Tutorial newTutorial = SelectStatus1toAdd().Last();


            cmd = new SqlCommand("insert into Tutorial_Assunto(tutorial_id, assunto_id) values (@idTut, @idAssun)", conn);
            cmd.Parameters.AddWithValue("@idTut", newTutorial.id);
            cmd.Parameters.AddWithValue("@idAssun", idAssunto); //id vem como parâmetro

            cmd.ExecuteNonQuery();
        }

        //EDITAR//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Tutorial obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Tutorial Set tutorial_titulo = @tutorial_titulo, status = @status, arquivo = @arquivo Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@tutorial_titulo", obj.tutorial_titulo);
            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            cmd.ExecuteNonQuery();
        }

        /*
         //EDITAR - EM TESTE PARA TERMINAR//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Tutorial obj, string idAssunAtual, string idAssunNovo)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Tutorial Set tutorial_titulo = @tutorial_titulo, status = @status, arquivo = @arquivo Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@tutorial_titulo", obj.tutorial_titulo);
            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@arquivo", obj.arquivo);

            cmd.ExecuteNonQuery();            

            //cmd = new SqlCommand("insert into Tutorial_Assunto(tutorial_id, assunto_id) values (@idTut, @idAssun)", conn);
            cmd = new SqlCommand("Update Tutorial_Assunto set assunto_id = @idassun where tutorial_id = @idTut and assunto_id = @idassunAtual", conn);
            cmd.Parameters.AddWithValue("@idTut", obj.id);
            cmd.Parameters.AddWithValue("@idAssunAtual", idAssunAtual);
            cmd.Parameters.AddWithValue("@idAssunNovo", idAssunNovo); //id vem como parâmetro

            cmd.ExecuteNonQuery();
        }
        */

        //EDITAR//
        [DataObjectMethod(DataObjectMethodType.Update)]
        public void UpdateStatus(Modelo.Tutorial obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Tutorial Set status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@status", obj.status);
            

            cmd.ExecuteNonQuery();
        }


        //SELECIONAR//
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Tutorial Select(string id)
        {
            DALUsuario usu = new DALUsuario();
            string nomeUsuario;

            Modelo.Tutorial aTutorial = new Modelo.Tutorial();

            //List<Modelo.Tutorial> aListTutorial = new List<Modelo.Tutorial>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select id, usuario_id, tutorial_titulo, status From Tutorial Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //Retorna o nome do usuário
                    nomeUsuario = usu.Select(dr["usuario_id"].ToString()).nome;

                    aTutorial = new Modelo.Tutorial(dr["id"].ToString(), dr["usuario_id"].ToString(), nomeUsuario, dr["tutorial_titulo"].ToString(), Convert.ToInt32(dr["status"].ToString()), "");
                    
                }
            }

            dr.Close();

            conn.Close();

            return aTutorial;
        }

        // Download do arquivo
        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Tutorial SelectDownload(string id)
        {
            Modelo.Tutorial aTutorial = new Modelo.Tutorial();
            
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "Select arquivo From Tutorial Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aTutorial = new Modelo.Tutorial((byte[])dr["arquivo"]);
                    
                }
            }

            dr.Close();

            conn.Close();

            return aTutorial;
        }


        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Tutorial obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Delete From Tutorial Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);

            cmd.ExecuteNonQuery();
        }



    }
}
