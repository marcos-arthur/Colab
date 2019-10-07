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
            }
            if ((Session["MsgErroarquivo"] != null) && (Session["MsgErroarquivo"].ToString() != ""))
            {
                MsgErroarquivo.Text = Session["MsgErroarquivo"].ToString();
            }
        }
        //Quase pronto
        protected void Button1_Click(object sender, EventArgs e)
        {
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;



            // loading bytes from a file is very easy in C#. The built in System.IO.File.ReadAll* methods take care of making sure every byte is read properly.
            // note that for Linux, you will not need the c: part
            // just swap out the example folder here with your actual full file path
            byte[] bytes = arquivo.FileBytes;
            //byte[] bytes = System.IO.File.ReadAllBytes(pdfFilePath);

            // munge bytes with whatever pdf software you want, i.e. http://sourceforge.net/projects/itextsharp/
            // bytes = MungePdfBytes(bytes); // MungePdfBytes is your custom method to change the PDF data
            // ...
            // make sure to cleanup after yourself

            // and save back - System.IO.File.WriteAll* makes sure all bytes are written properly.
            //System.IO.File.WriteAllBytes(pdfFilePath, bytes);



            //string idTeste = Session["idusuario"].ToString();

            aTutorial = new Modelo.Tutorial("1", Session["idusuario"].ToString(), titulo.Text, 3, bytes);

            aDALTutorial = new DAL.DALTutorial();

            //validação dos outros dados
            try
            {
                aDALTutorial.Insert(aTutorial);
            }
            catch (SqlException error)

            {
                if (error.Message.Contains("O titulo do tutorial nao deve ser vazio")) Session["MsgErrotitulo"] = "O titulo do tutorial nao deve ser vazio";

                if (error.Message.Contains("voce deve adiconar um arquivo ao novo tutorial")) Session["MsgErroarquivo"] = "voce deve adiconar um arquivo ao novo tutorial";

            }
            finally
            {
                Response.Redirect("~\\3-Bolsista\\WebFormAddTutorialBolsista.aspx");
            }

            Response.Redirect("~\\3-Bolsista\\WebFormCRUDTutorialBolsista.aspx");
        }
    }
}