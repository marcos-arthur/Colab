using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddUsuario : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Usuario aUsuario;
            DAL.DALUsuario aDALUsuario;

            aUsuario = new Modelo.Usuario("1", nomeusuario.Text, login.Text, senha.Text, int.Parse(tipo.Text),foto.FileBytes);

            aDALUsuario = new DAL.DALUsuario();

            aDALUsuario.Insert(aUsuario);

            Response.Redirect("~\\WebFormCRUDUsuario.aspx");

            // Valida senha
            if (Senha.Text != ConfirmarSenha.Text)
            {
                Session["msgErro"] = "Senha não confere";
                Response.Redirect("~\\WebFormLoginRegister.aspx");
            }
            Session["msgErro"] = "";
            // Instancia objeto DAL
            DAL.DALUsuario aDALUsuario = new DAL.DALUsuario();
            // Critografa senha
            string senhaMD5 = GerarHashMd5(Senha.Text);
            // Instancia objeto Modelo
            Modelo.Usuario aUsuario = new Modelo.Usuario("0", Nome.Text, Login.Text, senhaMD5, 0, Foto.FileBytes);
            // Insere usuário
            aDALUsuario.Insert(aUsuario);
            // Grava na sessão

            Response.Redirect("~\\WebFormLogin.aspx");

        }
    }
    }
}