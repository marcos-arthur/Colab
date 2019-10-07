using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class IndexBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "noCount";

            Response.Redirect("~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "myCount";

            Response.Redirect("~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }
    }
}