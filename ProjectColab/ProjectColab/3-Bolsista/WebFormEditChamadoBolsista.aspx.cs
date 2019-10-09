using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._3_Bolsista
{
    public partial class WebFormEditChamadoBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Fechar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALChamado arquivo = new DAL.DALChamado();

                Modelo.Chamado mchamado;

                mchamado = arquivo.Select(id);

                mchamado.status = 3;

                arquivo.Update(mchamado);

                Response.Redirect("~//3-Bolsista/WebFormEditChamadoBolsista.aspx");
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricao.Text), DateTime.Now);
            aDALComentario = new DAL.DALComentario();

            aDALComentario.Insert(aComentario);
            Response.Redirect("~//3-Bolsista/WebFormEditChamadoBolsista.aspx");
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