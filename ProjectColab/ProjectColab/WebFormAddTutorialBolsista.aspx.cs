using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddTutorialBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["tipo"] == null) || (Session["tipo"].ToString() == ""))
            {
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            else if (Session["tipo"].ToString() != "3")
            {
                Session["msgErro"] = "Acesso não permitido à página WebSiteUser. " + "Faça Login e tente novamente";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
        }
       //É preciso terminar de criar a WebFormAddTutorialBolsista
       /* protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;

            aTutorial = new Modelo.Tutorial("1", titulo.Text, 3, arquivo.Text);

            aDALTutorial = new DAL.DALTutorial();

            aDALTutorial.Insert(aTutorial);

            Response.Redirect("~\\WebFormCRUDTutorial.aspx");
        }*/
    }
}