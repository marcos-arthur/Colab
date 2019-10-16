using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


namespace ProjectColab
{
    public partial class WebFormLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Apresenta mensagem de erro
            if ((Session["msgErro"] != null) && (Session["msgErro"].ToString() != ""))
            {
                LabelMsgErro.Text = Session["msgErro"].ToString();
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Session["tutorialValue"] = "";
            Session["labValue"] = "";
            Session["equipValue"] = "";

            // Instancia objeto DAL
            DAL.DALUsuario aDALUsuario = new DAL.DALUsuario();

            // Valida Usuario
            //List<Modelo.Usuario> aListUsuario = aDALUsuario.SelectLogin(Login.Text);
                    

            // Critografa senha
            string senhaMD5 = GerarHashMd5(Senha.Text);
            // Le usuário da Lista
            Modelo.Usuario aUsuario = aDALUsuario.SelectLogin(Login.Text);
            // Valida Senha
            if (aUsuario.senha != senhaMD5)
            {
                Session["msgErro"] = "Senha Inválida";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
           
            if ((aUsuario == null) || (aUsuario.status != 1))
            {
                Session["msgErro"] = "Usuário não cadastrado ou indisponível";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            // Salva usuário na sessão
            Session["msgErro"] = "";            
            Session["idusuario"] = aUsuario.id;
            Session["usuario"] = aUsuario.login;

            Session["tipo"] = aUsuario.tipo;
            if (Session["tipo"].ToString() == "1")
            {
                Response.Redirect("~\\1-Admin\\IndexAdmin.aspx");
            }
            else if (Session["tipo"].ToString() == "2")
            {
                Response.Redirect("~\\2-Servidor\\IndexServidor.aspx");
            }
            else if (Session["tipo"].ToString() == "3")
            {
                Response.Redirect("~\\3-Bolsista\\IndexBolsista.aspx");
            }
            else if (Session["tipo"].ToString() == "4")
            {
                Response.Redirect("~\\4-Professor\\IndexProfessor.aspx");
            }
            else
            {
                Response.Redirect("~\\WebFormLogin.aspx");
            }
        }
        public string GerarHashMd5(string input)
        {
            MD5 md5Hash = MD5.Create();
            // Converter a String para array de bytes, que é como a biblioteca trabalha.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            // Cria-se um StringBuilder para recompôr a string.
            StringBuilder sBuilder = new StringBuilder();
            // Loop para formatar cada byte como uma String em hexadecimal
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
        
    }
    
}