

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;

            aTutorial = new Modelo.Tutorial("1", titulo.Text, 3, arquivo_url.FileBytes);

            aDALTutorial = new DAL.DALTutorial();

            aDALTutorial.Insert(aTutorial);


            string filename = Request.PhysicalApplicationPath + "imagens\\" + arquivo_url.FileName;

            arquivo_url.SaveAs(filename);


            Response.Redirect("~\\WebFormCRUDTutorial.aspx");

        }
    }
}