using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   // Apresenta mensagem de erro
            if ((Session["MsgErronome"] != null) && (Session["MsgErronome"].ToString() != ""))
            {
                MsgErronome.Text = Session["MsgErronome"].ToString();
            }
            if ((Session["MsgErrologin"] != null) && (Session["MsgErrologin"].ToString() != ""))
            {
                MsgErrologin.Text = Session["MsgErrologin"].ToString();
            }
            if ((Session["MsgErrosenha"] != null) && (Session["MsgErrosenha"].ToString() != ""))
            {
                MsgErrosenha.Text = Session["MsgErrosenha"].ToString();
            }
            if ((Session["MsgErrosenhacf"] != null) && (Session["MsgErrosenhacf"].ToString() != ""))
            {
                MsgErrosenhacf.Text = Session["MsgErrosenhacf"].ToString();
            }
            if ((Session["MsgErrotipo"] != null) && (Session["MsgErrotipo"].ToString() != ""))
            {
                MsgErrotipo.Text = Session["MsgErrotipo"].ToString();
            }
            if ((Session["MsgErrofoto"] != null) && (Session["MsgErrofoto"].ToString() != ""))
            {
                MsgErrofoto.Text = Session["MsgErrofoto"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validar senha
            if (senha.Text != confirmaSenha.Text)
            {
                Session["MsgErrosenhacf"] = "Senha não confere";
                Response.Redirect("~/1-Admin/WebFormAddUsuario.aspx");
            }
            Session["msgErro"] = "";
            // Instancia objeto DAL
            DAL.DALUsuario aDALUsuario = new DAL.DALUsuario();
            // Critografa senha
            string senhaMD5 = GerarHashMd5(senha.Text);
            // Instancia objeto Modelo
            Modelo.Usuario aUsuario = new Modelo.Usuario("1", nome.Text, login.Text, senhaMD5, int.Parse(tipo.Text), foto.FileBytes);
            
            /*
            // Insere usuário
            aDALUsuario.Insert(aUsuario);
            // Grava na sessão
            Session["Usuario"] = aUsuario.login;
            Response.Redirect("~/1-Admin/WebFormCRUDUsuario.aspx");
            */

            // Valida Usuario
            List<Modelo.Usuario> aListUsuario = aDALUsuario.Select(login.Text);
            if (aListUsuario.Count > 0)
            {
                Session["MsgErrologin"] = "Usuário já cadastrado";
                Response.Redirect("~/1-Admin/WebFormAddUsuario.aspx");
            }
            //validação dos outros dados
            try
            {
                aDALUsuario.Insert(aUsuario);
            }
            catch (SqlException error)

            {
                if (error.Message.Contains("O nome do usuario nao deve ser vazio")) Session["MsgErronome"] = "O nome do usuario nao deve ser vazio";

                if (error.Message.Contains("O login do usuario nao pode ser vazio")) Session["MsgErrologin"] = "O login do usuario nao pode ser vazio";

                if (error.Message.Contains("A senha deve ter menos que 20 caracteres e nao pode ser vazia")) Session["MsgErrosenha"] = "A senha deve ter menos que 20 caracteres e nao pode ser vazia";

                if (error.Message.Contains("tipo invalido(tipo 2 = servirdor, tipo 3 = bolsita, tipo 4 = professor")) Session["MsgErrotipo"] = "tipo invalido(tipo 2 = servirdor, tipo 3 = bolsita, tipo 4 = professor";

            }
            finally
            {
                Response.Redirect("~/1-Admin/WebFormAddUsuario.aspx");
            }
                       
        }
        public string GerarHashMd5(string input)
        {
            MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }

}