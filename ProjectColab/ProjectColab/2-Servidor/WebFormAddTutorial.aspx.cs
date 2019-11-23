using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // Apresenta mensagem de erro
            if ((Session["MsgErrotitulo"] != null) && (Session["MsgErrotitulo"].ToString() != ""))
            {                
                MsgErrotitulo.Text = Session["MsgErrotitulo"].ToString();
                Session["MsgErrotitulo"] = null;
            }
            if ((Session["MsgErroarquivo"] != null) && (Session["MsgErroarquivo"].ToString() != ""))
            {
                MsgErroarquivo.Text = Session["MsgErroarquivo"].ToString();
                Session["MsgErroarquivo"] = null;
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;

            
            byte[] bytes = arquivo.FileBytes;
            
            aTutorial = new Modelo.Tutorial("1", Session["idusuario"].ToString(), titulo.Text, 3, bytes);

            aDALTutorial = new DAL.DALTutorial();

            bool ok = true;
            //validação dos outros dados
            try
            {
                aDALTutorial.Insert(aTutorial, dropAssuntos.SelectedValue);
            }
            catch (SqlException error)

            {
                ok = false;
                if (error.Message.Contains("O titulo do tutorial nao deve ser vazio")) Session["MsgErrotitulo"] = "O titulo do tutorial nao deve ser vazio";

                if (error.Message.Contains("voce deve adiconar um arquivo ao novo tutorial")) Session["MsgErroarquivo"] = "voce deve adiconar um arquivo ao novo tutorial";

            }

            if (ok) Response.Redirect("~\\2-Servidor\\WebFormCRUDTutorial.aspx");
            else Response.Redirect("~\\2-Servidor\\WebFormAddTutorial.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "noCount";

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "myCount";

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
        }
    }
}