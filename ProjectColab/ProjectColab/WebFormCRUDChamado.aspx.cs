using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDChamado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Verifica se o comando é "Editar"
            if (e.CommandName == "ABRIR")
            {
                string id;

                // Lê o número da linha selecionada
                int index = Convert.ToInt32(e.CommandArgument);

                // Copia o conteúdo da primeira célula da linha -> Código do livro
                id = GridView1.Rows[index].Cells[0].Text;

                // Grava código do Livro na sessão
                Session["id"] = id;

                // Chama a tela de edição
                Response.Redirect("~\\WebFormEditChamado.aspx");
            }
        }
    }
}