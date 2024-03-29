﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormEditTutorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string idTut, idAssuntoAtual, idAssuntoNovo;

            idTut = Session["idtutorial"].ToString();
            idAssuntoAtual = Session["idAssunto"].ToString();

            DropDownList dropTuto = (DropDownList)Repeater1.Items[0].FindControl("dropAssuntos");
            idAssuntoNovo = dropTuto.SelectedValue;

            FileUpload arquivo = (FileUpload)Repeater1.Items[0].FindControl("arquivo");

            TextBox titulo = (TextBox)Repeater1.Items[0].FindControl("titulo");

            Modelo.Tutorial attTutorial = new Modelo.Tutorial(idTut, titulo.Text, arquivo.FileBytes);

            CheckBox manter = (CheckBox)Repeater1.Items[0].FindControl("manter");

            DAL.DALTutorial dALTutorial = new DAL.DALTutorial();
            if (manter.Checked) {                
                dALTutorial.Update(attTutorial, idAssuntoAtual, idAssuntoNovo);
            }
            else {
                dALTutorial.Update(attTutorial, idAssuntoAtual, idAssuntoAtual);
            }
            
        }
    }
}