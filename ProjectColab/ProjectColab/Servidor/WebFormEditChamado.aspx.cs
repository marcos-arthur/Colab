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
            aComentario = new Modelo.Comentario("1","1",Convert.ToInt32(Session["id"]), 1,descricao.Text, DateTime.Now);
            aDALComentario = new DAL.DALComentario();

            aDALComentario.Insert(aComentario);
            Response.Redirect("~\\WebFormEditChamado.aspx");
        }
    }
}