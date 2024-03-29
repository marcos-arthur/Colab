﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormCRUDChamadoProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["chamadoValue"] = "";
            if ((Session["chamadoValue"].ToString() == "")) ObjectDataSource1.SelectMethod = "SelectOnly";
            else if (Session["chamadoValue"].ToString() == "noCount")
            {
                ObjectDataSource1.SelectMethod = "SelectNo";
            }
            else if (Session["chamadoValue"].ToString() == "myCount")
            {
                ObjectDataSource1.SelectMethod = "SelectMy";

                SessionParameter empid = new SessionParameter();
                empid.Name = "id";
                empid.Type = TypeCode.String;
                empid.SessionField = "idusuario";

                ObjectDataSource1.SelectParameters.Add(empid);
                ObjectDataSource1.DataBind();
            }   
            else if (Session["chamadoValue"].ToString() == "search")
            {
                ObjectDataSource1.SelectMethod = "selectSearch";

                string a = Session["chamadob"].ToString();

                //Passar chamadoValue como parâmetro
                SessionParameter empid = new SessionParameter();
                empid.Name = "resumo";
                empid.Type = TypeCode.String;
                empid.SessionField = "chamadob";


                ObjectDataSource1.SelectParameters.Add(empid);
                ObjectDataSource1.DataBind();

            }

            //Session["chamadobusca"] = "";
            Session["chamadoValue"] = "";

        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Verifica se o comando é "Editar"
            if (e.CommandName.ToString() == "ABRIR")
            {
                //string id;

                // Lê o número da linha selecionada
                int id = Convert.ToInt32(e.CommandArgument.ToString());

                // Grava código do Livro na sessão
                Session["idchamado"] = id;

                // Chama a tela de edição
                Response.Redirect("~//4-Professor/WebFormEditChamadoProfessor.aspx");
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
            if (TextBox1.Text.Trim() != "")
            {
                Session["chamadoValue"] = "search";
                Session["chamadob"] = TextBox1.Text;
                Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
            }

        }

    }
}