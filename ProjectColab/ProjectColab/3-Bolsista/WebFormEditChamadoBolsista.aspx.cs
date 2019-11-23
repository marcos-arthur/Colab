using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._3_Bolsista
{
    public partial class WebFormEditChamadoBolsista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tipocomentario"] == null)
            {
                PanelEx.Visible = false;
                PanelIn.Visible = false;
            }
            else if (Session["tipocomentario"] == "Externo")
            {
                PanelEx.Visible = true;
                PanelIn.Visible = false;
            }
            else if (Session["tipocomentario"] == "Interno")
            {
                PanelEx.Visible = false;
                PanelIn.Visible = true;
            }
            // Apresenta mensagem de erro
            if ((Session["MsgErrocoment"] != null) && (Session["MsgErrocoment"].ToString() != ""))
            {
                MsgErrocoment.Text = Session["MsgErrocoment"].ToString();
                Session["MsgErrocoment"] = null;
            }
        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Fechar")
            {
                string id;
                int index = Convert.ToInt32(e.CommandArgument);
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALChamado arquivo = new DAL.DALChamado();

                Modelo.Chamado mchamado;

                mchamado = arquivo.Select(id);

                mchamado.status = 3;

                arquivo.Update(mchamado);

                Response.Redirect("~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx");
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
        protected void add_ClickEx(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricaoEx.Text), DateTime.Now, 1);
            aDALComentario = new DAL.DALComentario();

            //validação dos outros dados
            try
            {
                aDALComentario.Insert(aComentario);
            }
            catch (SqlException error)
            {

                if (error.Message.Contains("Insira um comentário")) Session["MsgErrocoment"] = "Por favor, Insira um comentário";

            }

            Session["tipocomentario"] = "Externo";
            Response.Redirect("~\\3-Bolsista\\WebFormEditChamadoBolsista.aspx");
        }


        protected void add_ClickIn(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricaoIn.Text), DateTime.Now, 2);
            aDALComentario = new DAL.DALComentario();

            //validação dos outros dados
            try
            {
                aDALComentario.Insert(aComentario);
            }
            catch (SqlException error)
            {

                if (error.Message.Contains("Insira um comentário")) Session["MsgErrocoment"] = "Por favor, Insira um comentário";

            }

            Session["tipocomentario"] = "Interno";
            Response.Redirect("~\\3-Bolsista\\WebFormEditChamadoBolsista.aspx");
        }
        protected void ButtonIn_Click(object sender, EventArgs e)
        {
            Session["tipocomentario"] = "Interno";
            Response.Redirect("~\\3-Bolsista\\WebFormEditChamadoBolsista.aspx");
        }

        protected void ButtonEx_Click(object sender, EventArgs e)
        {
            Session["tipocomentario"] = "Externo";
            Response.Redirect("~\\3-Bolsista\\WebFormEditChamadoBolsista.aspx");
        }

    }
}