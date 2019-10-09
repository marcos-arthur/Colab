using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDChamadoBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["chamadoValue"].ToString() == "") ObjectDataSource1.SelectMethod = "SelectOnly";
            else if (Session["chamadoValue"].ToString() == "noCount")
            {
                ObjectDataSource1.SelectMethod = "SelectNo";
            }
            else if (Session["chamadoValue"].ToString() == "myCount")
            {
                ObjectDataSource1.SelectMethod = "SelectMy";

                SessionParameter empid = new SessionParameter();
                empid.Name = "id";
                empid.Type = TypeCode.String;
                empid.SessionField = "idusuario";

                ObjectDataSource1.SelectParameters.Add(empid);
                ObjectDataSource1.DataBind();
            }

            Session["chamadoValue"] = "";
        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Verifica se o comando é "Editar"
            if (e.CommandName.ToString() == "ABRIR")
            {
                //string id;

                // Lê o número da linha selecionada
                int id = Convert.ToInt32(e.CommandArgument.ToString());

                // Grava código do Livro na sessão
                Session["idchamado"] = id;

                // Chama a tela de edição
                Response.Redirect("~//3-Bolsista/WebFormEditChamadoBolsista.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "noCount";

            Response.Redirect("~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "myCount";

            Response.Redirect("~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }
    }
}