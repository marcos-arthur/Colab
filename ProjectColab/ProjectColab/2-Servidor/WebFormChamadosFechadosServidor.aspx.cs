using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormChamadosFechadosServidor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                Response.Redirect("~//2-Servidor/WebFormChamadosFechadosEditServidor.aspx");
            }
        }
    }
}