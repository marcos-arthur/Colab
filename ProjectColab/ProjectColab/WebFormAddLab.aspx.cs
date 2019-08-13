using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddLab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveButton(object sender, EventArgs e)
        {
            Modelo.Salas aSalas;
            DAL.DALSalas aDalSalas;

            aSalas = new Modelo.Salas(name.Text, 0);

            aDalSalas = new DAL.DALSalas();

            aDalSalas.Insert(aSalas);

            aSalaequip = aDalSalas.Select();            

            Response.Redirect("~\\WebFormCRUDLabs.aspx");
        }
    }
}