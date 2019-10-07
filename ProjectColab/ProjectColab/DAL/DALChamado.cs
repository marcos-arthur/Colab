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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectAll()
        {
            DALLaboratorio lab = new DALLaboratorio();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomeLab;

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
            SqlCommand cmdLab = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,laboratorios_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado; ";            
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {                
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome do laboratório
                    nomeLab = lab.SelectNome(dr["laboratorios_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(),dr["laboratorios_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomeLab, Convert.ToInt32(dr["status"].ToString()),dr["statuschamado"].ToString(),dr["resumo"].ToString(),Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()),Convert.ToDateTime( dr["data"].ToString()));
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectNo()
        {
            DALLaboratorio lab = new DALLaboratorio();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomeLab;

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
            SqlCommand cmdLab = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,laboratorios_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where usuario_atribuido_id is null";
            // Executa comando, gerando objeto DbDataReader
            SqlDataReader dr = cmd.ExecuteReader();
            // Le titulo do livro do resultado e apresenta no segundo rótulo
            if (dr.HasRows)
            {
                while (dr.Read()) // Le o proximo registro
                {
                    //Retorna o nome do usuário
                    nomeUsuarioAberto = usu.SelectNome(dr["usuario_aberto_id"].ToString());

                    //Retorna o nome do laboratório
                    nomeLab = lab.SelectNome(dr["laboratorios_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["laboratorios_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomeLab, Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Chamado> SelectMy(string id)
        {
            DALLaboratorio lab = new DALLaboratorio();
            DALUsuario usu = new DALUsuario();
            string nomeUsuarioAberto;
            string nomeUsuarioAtribuido;
            string nomeLab;

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
            SqlCommand cmdLab = conn.CreateCommand();

            // define SQL do comando
            cmd.CommandText = "SELECT id,usuario_aberto_id,laboratorios_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where usuario_atribuido_id = @id";
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

                    //Retorna o nome do laboratório
                    nomeLab = lab.SelectNome(dr["laboratorios_id"].ToString());

                    //Retorna o nome do usuario
                    nomeUsuarioAtribuido = usu.SelectNome(dr["usuario_atribuido_id"].ToString());

                    // Cria objeto com dados lidos do banco de dados
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["laboratorios_id"].ToString(), dr["usuario_atribuido_id"].ToString(), nomeUsuarioAberto, nomeUsuarioAtribuido, nomeLab, Convert.ToInt32(dr["status"].ToString()), dr["statuschamado"].ToString(), dr["resumo"].ToString(), Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
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
            SqlCommand cmd = new SqlCommand("INSERT INTO Chamado(usuario_aberto_id, status, laboratorios_id, resumo,quant_equipamentos_defeituosos,data) VALUES (@usuario_aberto_id, @laboratorios_id, @status,@resumo,@quant_equipamentos_defeituosos,@data)", conn);            
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@usuario_aberto_id", int.Parse(obj.usuario_aberto_id));
            cmd.Parameters.AddWithValue("@laboratorios_id", int.Parse(obj.laboratorios_id));
            cmd.Parameters.AddWithValue("@status", obj.status);
            cmd.Parameters.AddWithValue("@resumo", obj.resumo);
            cmd.Parameters.AddWithValue("@quant_equipamentos_defeituosos", obj.quantidadeeq);
            cmd.Parameters.AddWithValue("@data", obj.data);
            // Executa Comando
            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Chamado Select(string id)
        {
            Modelo.Chamado aChamado = new Modelo.Chamado();            

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT * FROM Chamado WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {

                while (dr.Read()) // Le o proximo registro
                {
                    aChamado = new Modelo.Chamado(dr["id"].ToString(), dr["usuario_aberto_id"].ToString(), dr["laboratorios_id"].ToString(), Convert.ToInt32(dr["status"].ToString()), "1", dr["resumo"].ToString(), Convert.ToDecimal(dr["quant_equipamentos_defeituosos"].ToString()), Convert.ToDateTime(dr["data"].ToString()));
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

            SqlCommand cmd = new SqlCommand("Update Chamado Set usuario_atribuido_id = @usuario_atribuido_id Where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.id);
            cmd.Parameters.AddWithValue("@usuario_atribuido_id", obj.usuario_atribuido_id);

            cmd.ExecuteNonQuery();
        }
    }
}