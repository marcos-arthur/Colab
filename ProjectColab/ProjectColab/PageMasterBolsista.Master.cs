﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class PageMasterBolsista : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idusuario"] == null) Response.Redirect("~/WebFormLogin.aspx");
            if (Session["tipo"].ToString() == "1") Response.Redirect("~/1-Admin/IndexAdmin.aspx");
            if (Session["idusuario"].ToString() == "2") Response.Redirect("~/2-Servidor/IndexServidor.aspx");
            //if (Session["tipo"].ToString() == "3") Response.Redirect("~/3-Bolsista/IndexBolsista");
            if (Session["tipo"].ToString() == "4") Response.Redirect("~/4-Professor/IndexProfessor.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "noCount";

            Response.Redirect("~/3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "myCount";

            Response.Redirect("~/3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
        }
    }
}