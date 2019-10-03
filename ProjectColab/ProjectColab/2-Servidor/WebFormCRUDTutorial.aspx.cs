using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["tipo"] == null) || (Session["tipo"].ToString() == ""))
            {
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            else if ((Session["tipo"].ToString() != "2") && (Session["tipo"].ToString() != "3"))
            {
                Session["msgErro"] = "Acesso não permitido à página WebSiteUser. " + "Faça Login e tente novamente";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = GridView1.Rows[index].Cells[0].Text;
                Session["id"] = id;
                Response.Redirect("~\\WebFormEditTutorial.aspx");
            }
        }
    }
}