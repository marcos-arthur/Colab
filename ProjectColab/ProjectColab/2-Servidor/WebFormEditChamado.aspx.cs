using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormEditChamado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Fechar")
            {
                string id;
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALChamado arquivo = new DAL.DALChamado();

                Modelo.Chamado mchamado;

                mchamado = arquivo.Select(id);

                mchamado.status = 3;

                arquivo.Update(mchamado);

                Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
            }
        }

            protected void add_Click(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricao.Text), DateTime.Now, Convert.ToInt32(statuscomentario.Text));
            aDALComentario = new DAL.DALComentario();

            aDALComentario.Insert(aComentario);
            Response.Redirect("~\\2-Servidor\\WebFormEditChamado.aspx");
        }

        protected void atribuir_Click(object sender, EventArgs e)
        {
            DAL.DALChamado aDALChamado = new DAL.DALChamado();
            Modelo.Chamado aChamado = aDALChamado.Select(Session["idchamado"].ToString());

            DropDownList drop = (DropDownList)Repeater3.Items[0].FindControl("atribuidoID");
            aChamado.usuario_atribuido_id = drop.SelectedValue;
            aChamado.status = 2;

            aDALChamado.UpdateAtribuido(aChamado);

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
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

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}