using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._4_Professor
{
    public partial class WebFormEditChamadoProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricao.Text), DateTime.Now,1);
            aDALComentario = new DAL.DALComentario();

            aDALComentario.Insert(aComentario);
            Response.Redirect("~\\4-Professor\\WebFormEditChamadoProfessor.aspx");
        }
    }
}