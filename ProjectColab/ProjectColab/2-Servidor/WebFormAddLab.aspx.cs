using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            // Apresenta mensagem de erro
            if ((Session["msgErro"] != null) && (Session["msgErro"].ToString() != ""))
            {
                MsgErro.Text = Session["msgErro"].ToString();
                Session["msgErro"] = null;
            }
            
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Modelo.Laboratorios alaboratorios;
            DAL.DALLaboratorio aDALLaboratorio;

            alaboratorios = new Modelo.Laboratorios("1", nome.Text);

            aDALLaboratorio = new DAL.DALLaboratorio();            
           
            try
            {
                aDALLaboratorio.Insert(alaboratorios);
            }
            //UM ERRO PODE SER CAUSADO CASO O SERVIDOR EM QUE O COMPILADOR DO C# ESTEJA INSTALADO ESTEJA EM OUTRA LINGUA
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nO novo laboratorio deve possuir um nome") 
            {
                Session["msgErro"] = "O novo laboratorio deve possuir um nome";
                Response.Redirect("~\\WebFormAddLab.aspx");
            }
            finally
            {                
                Response.Redirect("~//2-Servidor/WebFormCRUDLabs.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//2-Servidor/WebFormCRUDLabs.aspx");
        }

        
    }
}