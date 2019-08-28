

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
        //Quase pronto
        protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;
            Modelo.Tutorial_info aTutorial_info;
            DAL.DALTutorial_info aDALTutorial_info;

            aTutorial = new Modelo.Tutorial("1", tutorial_titulo.Text, 3);

            aDALTutorial = new DAL.DALTutorial();

            aDALTutorial.Insert(aTutorial);

            aTutorial_info = new Modelo.Tutorial_info("1", arquivo_url.FileBytes, arquivo_url.FileName);

            aDALTutorial_info = new DAL.DALTutorial_info();

            aDALTutorial_info.Insert(aTutorial_info);

            Response.Redirect("~\\WebFormCRUDTutorial.aspx");
        }
    }
}