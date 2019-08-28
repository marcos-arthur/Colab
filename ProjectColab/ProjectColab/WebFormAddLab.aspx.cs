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

            alaboratorios = new Modelo.Laboratorios("1", nome.Text);

            aDALLaboratorio = new DAL.DALLaboratorio();

            aDALLaboratorio.Insert(alaboratorios);

            Response.Redirect("~\\WebFormAddLab.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Modelo.Equipamento aEquipamento;
            DAL.DALEquipamento aDALEquipamento;
            aEquipamento = new Modelo.Equipamento("1",idlab.Text,modelo.Text,Convert.ToDecimal(quant.Text));

            aDALEquipamento = new DAL.DALEquipamento();

            aDALEquipamento.Insert(aEquipamento);

            Response.Redirect("~\\WebFormCRUDLabs.aspx");

        }
    }
}