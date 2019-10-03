using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
        
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i;
            string idu;
            FileUpload fup;

            i = e.RowIndex;
            fup = GridView1.Rows[i].FindControl("FileUpload1") as FileUpload;

            idu = GridView1.Rows[i].Cells[0].Text;

            Modelo.Usuario aUsuario;
            DAL.DALUsuario aDALUsuario;

            aUsuario = new Modelo.Usuario();
            aUsuario.id = idu;
            aUsuario.foto = fup.FileBytes;

            aDALUsuario = new DAL.DALUsuario();

            aDALUsuario.UpdateImagem(aUsuario);

        }

    }
}