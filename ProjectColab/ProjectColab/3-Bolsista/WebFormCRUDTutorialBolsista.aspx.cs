﻿using System;
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

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Verifica se o comando é "Editar"
            if (e.CommandName.ToString() == "Baixar")
            {
                string id;
                //int index = Convert.ToInt32(e.CommandArgument);

                string[] arg = new string[2];
                arg = e.CommandArgument.ToString().Split(';');

                id = arg[0];
                string theFileName = arg[1];
                //string theFileName = GridView1.Rows[index].Cells[2].Text;

                DAL.DALTutorial arquivo = new DAL.DALTutorial();

                byte[] data = arquivo.SelectDownload(id).arquivo;
                byte[] buffer = null;
                using (Stream st = new MemoryStream(data))
                {
                    buffer = new byte[st.Length];
                    long dataLengthToRead = st.Length;
                    Response.ContentType = "application/pdf";
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

        protected void Button2_Click(object sender, EventArgs e)
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