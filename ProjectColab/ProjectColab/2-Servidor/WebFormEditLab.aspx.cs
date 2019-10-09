using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormEditLab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Session["nomelab"] = DetailsView1.Rows[1].Cells[1].Text;

            Response.Redirect("~//2-Servidor/WebFormAddEquipamento.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Modelo.Laboratorios alaboratorios;
            DAL.DALLaboratorio aDALLaboratorio;

            alaboratorios = new Modelo.Laboratorios("1", nome.Text);

            aDALLaboratorio = new DAL.DALLaboratorio();

            try
            {
                //aDALLaboratorio.Insert(alaboratorios); Mudar para UPDATE
            }
            //UM ERRO PODE SER CAUSADO CASO O SERVIDOR EM QUE O COMPILADOR DO C# ESTEJA INSTALADO ESTEJA EM OUTRA LINGUA
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nO novo laboratorio deve possuir um nome")
            {
                Session["msgErro"] = "O novo laboratorio deve possuir um nome";
                Response.Redirect("~\\WebFormAddLab.aspx");
            }
            finally
            {
                Response.Redirect("~//2-Servidor/WebFormAddLab.aspx");
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//2-Servidor/WebFormCRUDLabs.aspx");
        }
    }
}