using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._3_Bolsista
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

            aTutorial = new Modelo.Tutorial("1", Session["idusuario"].ToString(),titulo.Text, 3, bytes);

            aDALTutorial = new DAL.DALTutorial();

            bool ok = true;
            //validação dos outros dados
            try
            {
               /* aDALTutorial.Insert(aTutorial);*/
            }
            catch (SqlException error)

            {
                ok = false; 

                if (error.Message.Contains("O titulo do tutorial nao deve ser vazio")) Session["MsgErrotitulo"] = "O titulo do tutorial nao deve ser vazio";
                
                if (error.Message.Contains("voce deve adiconar um arquivo ao novo tutorial")) Session["MsgErroarquivo"] = "voce deve adiconar um arquivo ao novo tutorial";   
            }

            if(ok) Response.Redirect("~\\3-Bolsista\\WebFormCRUDTutorialBolsista.aspx");
            else Response.Redirect("~\\3-Bolsista\\WebFormAddTutorialBolsista.aspx"); 
        }

        protected void Button6_Click(object sender, EventArgs e)
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