using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormEditChamado : System.Web.UI.Page
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
            Session["tipocomentario"] = null;
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
                id = e.CommandArgument.ToString();
                Session["id"] = id;
                DAL.DALChamado arquivo = new DAL.DALChamado();

                Modelo.Chamado mchamado;

                mchamado = arquivo.Select(id);

                mchamado.status = 3;

                arquivo.Update(mchamado);

                Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
            }
        }

            protected void add_ClickEx(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricaoEx.Text), DateTime.Now,1);
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
            Response.Redirect("~\\2-Servidor\\WebFormEditChamado.aspx");
        }


        protected void add_ClickIn(object sender, EventArgs e)
        {
            Modelo.Comentario aComentario;
            DAL.DALComentario aDALComentario;

            aComentario = new Modelo.Comentario("1", Convert.ToString(Session["idusuario"]), Convert.ToString(Session["idchamado"]), 1, Convert.ToString(descricaoIn.Text), DateTime.Now,2);
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
            Response.Redirect("~\\2-Servidor\\WebFormEditChamado.aspx");
        }


        protected void atribuir_Click(object sender, EventArgs e)
        {
            DAL.DALChamado aDALChamado = new DAL.DALChamado();
            Modelo.Chamado aChamado = aDALChamado.Select(Session["idchamado"].ToString());

            DropDownList drop = (DropDownList)Repeater3.Items[0].FindControl("atribuidoID");
            aChamado.usuario_atribuido_id = drop.SelectedValue;
            aChamado.status = 2;

            aDALChamado.UpdateAtribuido(aChamado);

            Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
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

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void ButtonIn_Click(object sender, EventArgs e)
        {
            Session["tipocomentario"] = "Interno";
            Response.Redirect("~//2-Servidor/WebFormEditChamado.aspx");
        }

        protected void ButtonEx_Click(object sender, EventArgs e)
        {
            Session["tipocomentario"] = "Externo";
            Response.Redirect("~//2-Servidor/WebFormEditChamado.aspx");
        }
    }
}