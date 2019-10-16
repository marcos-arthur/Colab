﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (Session["tutorialValue"].ToString() == "search")
            {
                ObjectDataSource1.SelectMethod = "selectSearch";

                string a = Session["tutorialb"].ToString();

                //Passar chamadoValue como parâmetro
                SessionParameter empid = new SessionParameter();
                empid.Name = "titulo";
                empid.Type = TypeCode.String;
                empid.SessionField = "tutorialb";


                ObjectDataSource1.SelectParameters.Add(empid);
                ObjectDataSource1.DataBind();
            }

            Session["tutorialValue"] = "";
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

                byte[] data = arquivo.Select(id).arquivo;
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
            if (e.CommandName == "Deletar")
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

                Response.Redirect("~//2-Servidor/WebFormCRUDTutorial.aspx");
            }

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

        protected void search_Click(object sender, EventArgs e)
        {
            if (searchBox.Text.Trim() != "")
            {
                Session["tutorialValue"] = "search";
                Session["tutorialb"] = searchBox.Text;
                Response.Redirect("~//2-Servidor/WebFormCRUDTutorial.aspx");
            }
        }
    }
}