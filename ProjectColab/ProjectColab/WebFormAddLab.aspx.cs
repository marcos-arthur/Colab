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
            }
            if ((Session["MsgErroDropLab"] != null) && (Session["MsgErroDropLab"].ToString() != ""))
            {
                MsgErro.Text = Session["MsgErroDropLab"].ToString();
            }
            if ((Session["MsgErroModelo"] != null) && (Session["MsgErroModelo"].ToString() != ""))
            {
                MsgErro.Text = Session["MsgErroModelo"].ToString();
            }
            if ((Session["MsgErroQuant"] != null) && (Session["MsgErroQuant"].ToString() != ""))
            {
                MsgErro.Text = Session["MsgErroQuant"].ToString();
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
                Response.Redirect("~\\WebFormAddLab.aspx");
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Modelo.Equipamento aEquipamento = new Modelo.Equipamento();
            DAL.DALEquipamento aDALEquipamento;

            decimal quantidade;

            if (decimal.TryParse(quant.Text, out decimal result)) quantidade = Convert.ToDecimal(quant.Text);
            else quantidade = 0;

            aEquipamento = new Modelo.Equipamento("1", idnome.Text, modelo.Text, quantidade);

            aDALEquipamento = new DAL.DALEquipamento();
            
            try
            {
                aDALEquipamento.Insert(aEquipamento);
            }
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nO equipamento inserido deve pertencer a algum laboratorio")
            {
                Session["MsgErroDropLab"] = "O equipamento inserido deve pertencer a algum laboratório";              
            }
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nO modelo do equipamento nao pode ser vazio")
            {
                Session["MsgErroModelo"] = "O modelo do equipamento nao pode ser vazio";                
            }
            catch (SqlException error) when (error.Message == "A transação foi encerrada no gatilho. O lote foi anulado.\r\nA quantidade de equipamento deve ser um número maior que 0")
            {
                Session["MsgErroQuant"] = "A quantidade de equipamento deve ser um número maior que 0";                                
            }

            Response.Redirect("~\\WebFormAddLab.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\WebFormCRUDLabs.aspx");
        }
    }
}