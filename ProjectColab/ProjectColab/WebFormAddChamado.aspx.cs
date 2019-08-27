using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddChamado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void add_Click1(object sender, EventArgs e)
        {
            Modelo.Chamado aChamado;
            DAL.DALChamado aDALChamado;

            aChamado = new Modelo.Chamado("1",1, Convert.ToString(resumo.Text), Convert.ToDecimal(quantidadeeq.Text), DateTime.Now);
            aDALChamado = new DAL.DALChamado();

            aDALChamado.Insert(aChamado);

            Response.Redirect("~\\WebFormCRUDChamado.aspx");
        }
    }
}