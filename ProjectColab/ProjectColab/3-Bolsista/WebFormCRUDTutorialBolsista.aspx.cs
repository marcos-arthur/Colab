using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._3_Bolsista
{
    public partial class WebFormCRUDTutorialBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = GridView1.Rows[index].Cells[0].Text;
                Session["id"] = id;
                Response.Redirect("~\\3-Bolsista\\WebFormEditTutorialBolsista.aspx");
            }
            if(e.CommandName == "Baixar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = GridView1.Rows[index].Cells[0].Text;
                string theFileName = GridView1.Rows[index].Cells[2].Text;

                DAL.DALTutorial arquivo = new DAL.DALTutorial();                

                byte[] data = arquivo.Select(id).arquivo;                
                byte[] buffer = null;
                using (Stream st = new MemoryStream(data))
                {
                    long dataLengthToRead = st.Length;
                    Response.ContentType = "application/pdf";  //Or other you need
                    Response.AddHeader("Content-Disposition", "attachment; filename=\"" + theFileName + "\"");
                    while (dataLengthToRead > 0 && Response.IsClientConnected)
                    {
                        Int32 lengthRead = st.Read(buffer, 0, data.Length);
                        Response.OutputStream.Write(buffer, 0, lengthRead);
                        Response.Flush();
                        dataLengthToRead = dataLengthToRead - lengthRead;
                    }
                    Response.Flush();
                    Response.Close();
                }
                Response.End();
            }
        }
    }
}