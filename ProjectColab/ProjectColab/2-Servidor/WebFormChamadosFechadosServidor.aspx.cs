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
            if (e.CommandName == "Reabrir")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALChamado arquivo = new DAL.DALChamado();

                Modelo.Chamado mchamado;

                mchamado = arquivo.Select(id);

                mchamado.status = 4;

                arquivo.Update(mchamado);

                Response.Redirect("~//2-Servidor/WebFormChamadosFechadosServidor.aspx");
            }
        }
    }
}