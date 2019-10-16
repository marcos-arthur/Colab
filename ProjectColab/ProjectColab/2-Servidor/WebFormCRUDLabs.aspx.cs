using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDLabs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["labValue"].ToString() == "search")
            {
                ObjectDataSource1.SelectMethod = "selectSearch";

                //string a = Session["labb"].ToString();

                //Passar chamadoValue como parâmetro
                SessionParameter empid = new SessionParameter();
                empid.Name = "nome";
                empid.Type = TypeCode.String;
                empid.SessionField = "labb";


                ObjectDataSource1.SelectParameters.Add(empid);
                ObjectDataSource1.DataBind();
            }

            Session["labValue"] = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "noCount";

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "myCount";

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
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
                Session["idlab"] = id;

                // Chama a tela de edição
                Response.Redirect("~//2-Servidor/WebFormEditLab.aspx");
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            if (searchBox.Text.Trim() != "")
            {
                Session["labValue"] = "search";
                Session["labb"] = searchBox.Text;
                Response.Redirect("~//2-Servidor/WebFormCRUDLabs.aspx");
            }
        }
    }
}