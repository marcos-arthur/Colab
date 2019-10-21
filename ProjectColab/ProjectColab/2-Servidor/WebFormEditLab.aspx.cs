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
            //Session["nomelab"] = .Rows[1].Cells[1].Text;
            Response.Redirect("~//2-Servidor/WebFormAddEquipamento.aspx");
        }
        
        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Fechar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALLaboratorio arquivo = new DAL.DALLaboratorio();

                Modelo.Laboratorios mchamado;

                mchamado = arquivo.Select2(id);

                mchamado.status = "2";

                arquivo.Update(mchamado);

                Response.Redirect("~//2-Servidor/WebFormCRUDLabs.aspx");
            }
        }
    }
}