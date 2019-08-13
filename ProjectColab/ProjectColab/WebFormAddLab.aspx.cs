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
        protected void Add_Click(object sender, EventArgs e)
        {
            Modelo.Laboratorios alaboratorios;
            DAL.DALLaboratorio aDALLaboratorio;

            alaboratorios = new Modelo.Laboratorios(id.Text, nome.Text, modelo.Text, Convert.ToDecimal(quantidade.Text));

            aDALLaboratorio = new DAL.DALLaboratorio();

            aDALLaboratorio.Insert(alaboratorios);

            Response.Redirect("~\\WebFormCRUDLabs.aspx");
        }
    }
}