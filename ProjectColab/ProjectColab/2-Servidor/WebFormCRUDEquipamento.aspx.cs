using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDEquipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["equipValue"].ToString() == "search")
            {
                ObjectDataSource3.SelectMethod = "selectSearch";

               

                //Passar chamadoValue como parâmetro
                SessionParameter empid = new SessionParameter();
                empid.Name = "modelo";
                empid.Type = TypeCode.String;
                empid.SessionField = "equipb";


                ObjectDataSource3.SelectParameters.Add(empid);
                ObjectDataSource3.DataBind();
            }
        }
       
        protected void search_Click(object sender, EventArgs e)
        {
            if (searchBox.Text.Trim() != "")
            {
                Session["equipValue"] = "search";
                Session["equipb"] = searchBox.Text;
                Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
            }
        }
    }
}