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

            aUsuario = new Modelo.Usuario("1", nomeusuario.Text, login.Text, senha.Text, int.Parse(tipo.Text), fotodousuario.FileBytes);

            aDALUsuario = new DAL.DALUsuario();

            aDALUsuario.Insert(aUsuario);

            Response.Redirect("~\\WebFormCRUDUsuario.aspx");
        }
    }
}