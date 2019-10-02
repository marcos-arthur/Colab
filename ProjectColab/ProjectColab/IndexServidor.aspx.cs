using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class Index2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["tipo"] == null) || (Session["tipo"].ToString() == ""))
            {
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            else if ((Session["tipo"].ToString() != "2") && (Session["tipo"].ToString() != "3") && (Session["tipo"].ToString() != "4"))
            {
                Response.Redirect("~\\WebFormCRUDUsuario.aspx");
            }

        }
    }
}