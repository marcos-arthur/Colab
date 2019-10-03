using System;
using System.Collections.Generic;
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
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Validar senha
            if (senha.Text != confirmaSenha.Text)
            {
                Session["msgErro"] = "Senha não confere";
                Response.Redirect("~\\WebFormAddUsuario.aspx");
            }
            Session["msgErro"] = "";
            // Instancia objeto DAL
            DAL.DALUsuario aDALUsuario = new DAL.DALUsuario();
            // Critografa senha
            string senhaMD5 = GerarHashMd5(senha.Text);
            // Instancia objeto Modelo
            Modelo.Usuario aUsuario = new Modelo.Usuario("1", nomeusuario.Text, login.Text, senhaMD5, int.Parse(tipo.Text), foto.FileBytes);
            // Insere usuário
            aDALUsuario.Insert(aUsuario);
            // Grava na sessão
            Session["Usuario"] = aUsuario.login;
            Response.Redirect("~/1-Admin/WebFormCRUDUsuario.aspx");
            // Valida Usuario
            List<Modelo.Usuario> aListUsuario = aDALUsuario.Select(login.Text);
            if (aListUsuario.Count > 0)
            {
                Session["msgErro"] = "Usuário já cadastrado";
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