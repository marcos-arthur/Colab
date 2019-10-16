using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormAddEquipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            if ((Session["MsgErroDropLab"] != null) && (Session["MsgErroDropLab"].ToString() != ""))
            {
                MsgErroDropLab.Text = Session["MsgErroDropLab"].ToString();
                Session["MsgErroDropLab"] = null;
            }
            if ((Session["MsgErroModelo"] != null) && (Session["MsgErroModelo"].ToString() != ""))
            {
                MsgErroModelo.Text = Session["MsgErroModelo"].ToString();
                Session["MsgErroModelo"] = null;
            }
            if ((Session["MsgErroQuant"] != null) && (Session["MsgErroQuant"].ToString() != ""))
            {
                MsgErroQuant.Text = Session["MsgErroQuant"].ToString();
                Session["MsgErroQuant"] = null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Modelo.Equipamento aEquipamento = new Modelo.Equipamento();
            DAL.DALEquipamento aDALEquipamento;

            decimal quantidade;

            if (decimal.TryParse(quant.Text, out decimal result)) quantidade = Convert.ToDecimal(quant.Text);
            else quantidade = 0;

            aEquipamento = new Modelo.Equipamento("1", idnome.SelectedItem.ToString(), idnome.SelectedValue, modelo.Text, quantidade);

            aDALEquipamento = new DAL.DALEquipamento();

            bool ok = true;
            try
            {
                aDALEquipamento.Insert(aEquipamento);
            }
            catch (SqlException error)
            {
                ok = false;

                if (error.Message.Contains("O equipamento inserido deve pertencer a algum laboratorio")) Session["MsgErroDropLab"] = "O equipamento inserido deve pertencer a algum laboratório";

                if (error.Message.Contains("A quantidade de equipamento deve ser um número maior que 0")) Session["MsgErroQuant"] = "A quantidade de equipamento deve ser um número maior que 0";

                if (error.Message.Contains("O modelo do equipamento nao pode ser vazio")) Session["MsgErroModelo"] = "O modelo do equipamento nao pode ser vazio";
            }

            if (ok) Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
            else Response.Redirect("~//2-Servidor/WebFormAddEquipamento.aspx");

        }
    }
}