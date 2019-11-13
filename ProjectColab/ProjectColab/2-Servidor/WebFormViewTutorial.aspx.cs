using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormEditTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string idTut, idAssuntoAtual, idAssuntoNovo;

            idTut = Session["idtutorial"].ToString();
            idAssuntoAtual = Session["idAssunto"].ToString();

            DropDownList dropTuto = (DropDownList)Repeater1.Items[0].FindControl("dropAssuntos");

            idAssuntoNovo = dropTuto.SelectedValue;

            FileUpload arquivo = (FileUpload)Repeater1.Items[0].FindControl("arquivo");

            if (arquivo.FileBytes.Length == 0) {

            }
        }
    }
}