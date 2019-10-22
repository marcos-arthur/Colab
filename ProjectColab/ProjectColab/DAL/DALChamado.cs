using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProjectColab.DAL
{
    public class DALChamado
    {
        string connectionString = "";

        public DALChamado()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ColabConnectionString"].ConnectionString;
        }

        
        //Método para selecionar chamados ainda não atribuidos
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectNo()
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status,statusEI, resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'" +
                              "WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where (usuario_atribuido_id is null) and (status = 1 or status = 2 or status = 4)";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["statusEI"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        //Métodos para selecioar chamados em Aberto(1), Em Andamento(2) e Reaberto(4), e Chamados Externos
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectOnlyProf()
        {
            DALSalas sala= new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status, statusEI, resumo,quant_equipamentos_defeituosos,data,CASE WHEN" +
                              " status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO' WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado" +
                              " FROM Chamado where (status = 1 or status = 2 or status = 4) and (statusEI = 1)";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala= sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());


                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["statusEI"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        //Métodos para selecioar chamados em Aberto(1), Em Andamento(2) e Reaberto(4), e Chamados Externos e Internos
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectOnly()
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;            

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status, statusEI, resumo,quant_equipamentos_defeituosos,data,CASE " +
                              "WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'" +
                              "WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where (status = 1 or status = 2 or status = 4)";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                   
                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["statusEI"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        //Metódo para selecionar chamados atribuido ao usuário logado
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectMy(string id)
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status, statusEI, resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'" +
                              "WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where status in (1,2,4) and usuario_atribuido_id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome das salas
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["statusEI"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        //Método para selecionar chamados fechados
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectClose()
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'" +
                              "WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where status = 3";

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala= sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }
        //Método para selecionar chamados fechados pelo professor
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectCloseProf(string id)
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            // Variavel para armazenar um livro
            Modelo.Chamado aChamado;
            // Cria Lista Vazia
            List<Modelo.Chamado> aListChamado = new List<Modelo.Chamado>();
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand cmd = conn.CreateCommand();
            SqlCommand cmdUsu = conn.CreateCommand();
            SqlCommand cmdsala = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,Sala_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'" +
                              "WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where status in (3) and usuario_aberto_id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista
                    aListChamado.Add(aChamado);
                }
            }
            // Fecha DataReader
            dr.Close();
            // Fecha Conexão
            conn.Close();

            return aListChamado;
        }

        //Método para inserir um chamado
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Chamado obj)
        {
            // Cria Conexão com banco de dados
            SqlConnection conn = new SqlConnection(connectionString);
            // Abre conexão com o banco de dados
            conn.Open();
            // Cria comando SQL
            SqlCommand com = conn.CreateCommand();
            // Define comando de exclusão
            SqlCommand cmd = new SqlCommand("INSERT INTO Chamado(usuario_aberto_id, sala_id, categoria_id, status, statusEI, resumo,quant_equipamentos_defeituosos,data) VALUES (@usuario_aberto_id, @sala_id,@categoria_id,@status, @statusEI,@resumo,@quant_equipamentos_defeituosos,@data)", conn);            
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@usuario_aberto_id", int.Parse(obj.usuario_aberto_id));

            //TryCatch para conversão
            try
            {
                cmd.Parameters.AddWithValue("@sala_id", int.Parse(obj.sala_id));
            }
            catch (FormatException error)
            {
                cmd.Parameters.AddWithValue("@sala_id", 0);
            }
            //TryCatch para conversão
            try
            {
                cmd.Parameters.AddWithValue("@categoria_id", int.Parse(obj.categoria_id));
            }
            catch (FormatException error)
            {
                cmd.Parameters.AddWithValue("@categoria_id", 0);
            }

            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@statusEI", obj.statusEI);
            cmd.Parameters.AddWithValue("@resumo", obj.resumo);
            cmd.Parameters.AddWithValue("@quant_equipamentos_defeituosos", obj.quantidadeeq);
            cmd.Parameters.AddWithValue("@data", obj.data);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }

        //Método para pesquisas feitas somente por resumo
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> selectSearch(string resumo)
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            Modelo.Chamado aChamado = new Modelo.Chamado();
            List<Modelo.Chamado> listChamado = new List<Modelo.Chamado>();

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'" +
                              "WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where (resumo like '%" + resumo + "%')";            

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
                    // Adiciona o livro lido à lista                    

                    listChamado.Add(aChamado);
                }
            }

            dr.Close();

            conn.Close();

            return listChamado;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Chamado Select(string id)
        {
            DALSalas sala = new DALSalas();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomesala;

            Modelo.Chamado aChamado = new Modelo.Chamado();            

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT id,usuario_aberto_id,sala_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'SEM ATRIBUIÇÃO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome da sala
                    nomesala = sala.SelectNome(dr["sala_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["sala_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomesala, Convert.ToInt32(dr["status"].ToString()), Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToInt32(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));

                }
            }

            dr.Close();

            conn.Close();

            return aChamado;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void UpdateAtribuido(Modelo.Chamado obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand com = conn.CreateCommand();

            SqlCommand cmd = new SqlCommand("Update Chamado Set usuario_atribuido_id = @usuario_atribuido_id,status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@usuario_atribuido_id", obj.usuario_atribuido_id);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Chamado obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("Update Chamado Set status = @status Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@status", obj.status);

            cmd.ExecuteNonQuery();
        }


    }
}