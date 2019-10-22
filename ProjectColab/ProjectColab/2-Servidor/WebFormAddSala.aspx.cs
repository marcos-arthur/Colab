using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddSala : System.Web.UI.Page
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

            Modelo.Salas aSalas;
            DAL.DALSalas aDALSalas;

            aSalas = new Modelo.Salas("1", nome.Text, "1");

            aDALSalas = new DAL.DALSalas();

            // Valida sala repetida         
            int idsala = aDALSalas.SelectID(nome.Text);
            if (idsala != 0)
            {

                Session["msgErro"] = "Sala já cadastrado";
                Response.Redirect("~//2-Servidor/WebFormAddSala.aspx");
            }

            try
            {
                aDALSalas.Insert(aSalas);
            }
            //UM ERRO PODE SER CAUSADO CASO O SERVIDOR EM QUE O COMPILADOR DO C# ESTEJA INSTALADO ESTEJA EM OUTRA LINGUA
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nO nova sala deve possuir um nome")
            {
                Session["msgErro"] = "O nova sala deve possuir um nome";
                Response.Redirect("~//2-Servidor/WebFormAddSala.aspx");
            }
            finally
            {
                Response.Redirect("~//2-Servidor/WebFormCRUDSalas.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//2-Servidor/WebFormCRUDSalas.aspx");
        }


    }
}