﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormTutorialSubmetido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Negar")
            {
                string id;
                //int index = Convert.ToInt32(e.CommandArgument);
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                Session["id"] = id;
                DAL.DALTutorial arquivo = new DAL.DALTutorial();

                Modelo.Tutorial mtutorial;

                mtutorial = arquivo.Select(id);

                arquivo.Delete(mtutorial);

                Response.Redirect("~//2-Servidor/WebFormTutorialSubmetido.aspx");
            }
            if (e.CommandName == "Autorizar")
            {
                string id;
                //int index = Convert.ToInt32(e.CommandArgument);
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                Session["id"] = id;
                DAL.DALTutorial arquivo = new DAL.DALTutorial();

                Modelo.Tutorial mtutorial;

                mtutorial = arquivo.Select(id);

                mtutorial.status = 2;

                arquivo.UpdateStatus(mtutorial);

                Response.Redirect("~//2-Servidor/WebFormTutorialSubmetido.aspx");

            }
            if (e.CommandName == "Baixar")
            {
                string id;
                //int index = Convert.ToInt32(e.CommandArgument);
                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                string theFileName = arg[1];
                DAL.DALTutorial arquivo = new DAL.DALTutorial();

                byte[] data = arquivo.SelectDownload(id).arquivo;
                byte[] buffer = null;
                using (Stream st = new MemoryStream(data))
                {
                    buffer = new byte[st.Length];
                    long dataLengthToRead = st.Length;
                    Response.ContentType = "application/pdf";  //Or other you need
                    Response.AddHeader("Content-Disposition", "attachment; filename=\"" + theFileName + ".pdf\"");
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