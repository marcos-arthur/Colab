using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class IndexAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "desativar")
            {
                string id;               
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                Session["id"] = id;
                DAL.DALUsuario status = new DAL.DALUsuario();

                Modelo.Usuario musuario;
                id = GridView1.Rows[Convert.ToInt32(id)].Cells[0].Text;

                musuario = status.Select(id);

                musuario.status = 2;

                status.UpdateStatus(musuario);

                Response.Redirect("~//1-Admin/IndexAdmin.aspx");
            }


        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "ativar")
            {
                string id;
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                Session["id"] = id;
                DAL.DALUsuario status = new DAL.DALUsuario();

                Modelo.Usuario musuario;
                id = GridView2.Rows[Convert.ToInt32(id)].Cells[0].Text;

                musuario = status.Select(id);

                musuario.status = 1;

                status.UpdateStatus(musuario);

                Response.Redirect("~//1-Admin/IndexAdmin.aspx");
            }


        }
    }
}