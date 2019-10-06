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

        protected void add_Click(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;
            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricao.Text), DateTime.Now);
            aDALComentario = new DAL.DALComentario();

            aDALComentario.Insert(aComentario);
            Response.Redirect("~\\2-Servidor\\WebFormEditChamado.aspx");
        }

        protected void atribuir_Click(object sender, EventArgs e)
        {
            DAL.DALChamado aDALChamado = new DAL.DALChamado();
            Modelo.Chamado aChamado = aDALChamado.Select(Session["idchamado"].ToString());

            aChamado.usuario_atribuido_id = atribuidoID.SelectedValue;

            aDALChamado.UpdateAtribuido(aChamado);

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
        }
    }
}