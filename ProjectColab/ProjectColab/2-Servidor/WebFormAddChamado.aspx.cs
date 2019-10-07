using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormAddChamado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Apresenta mensagem de erro
            if ((Session["MsgErroresumop"] != null) && (Session["MsgErroresumop"].ToString() != ""))
            {
                MsgErroresumop.Text = Session["MsgErroresumop"].ToString();
                Session["MsgErroresumop"] = null;
            }
            if ((Session["MsgErromaqdef"] != null) && (Session["MsgErromaqdef"].ToString() != ""))
            {
                MsgErromaqdef.Text = Session["MsgErromaqdef"].ToString();
                Session["MsgErromaqdef"] = null;
            }
            if ((Session["MsgErrolab"] != null) && (Session["MsgErrolab"].ToString() != ""))
            {
                MsgErrolab.Text = Session["MsgErrolab"].ToString();
                Session["MsgErrolab"] = null;
            }
        }
        protected void add_Click1(object sender, EventArgs e)
        {
            Modelo.Chamado aChamado;
            DAL.DALChamado aDALChamado;
            decimal quantidade;

            if (decimal.TryParse(quantidadeeq.Text, out decimal result)) quantidade = Convert.ToDecimal(quantidadeeq.Text);
            else quantidade = 0;

            aChamado = new Modelo.Chamado("1", Session["idusuario"].ToString(), labDrop.Text, 1,"" ,Convert.ToString(resumo.Text), Convert.ToDecimal(quantidadeeq.Text), DateTime.Now);
            aDALChamado = new DAL.DALChamado();
            
            try
            {
                aDALChamado.Insert(aChamado);
            }
            //UM ERRO PODE SER CAUSADO CASO O SERVIDOR EM QUE O COMPILADOR DO C# ESTEJA INSTALADO ESTEJA EM OUTRA LINGUA
            catch (SqlException error)
            {
                if (error.Message.Contains("Para abrir um chamado você deve indicar o problema")) Session["MsgErroresumop"] = "Para abrir um chamado você deve indicar o problema";

                if (error.Message.Contains("A quantidade de equipamentos deve ser um número maior que 0")) Session["MsgErromaqdef"] = "A quantidade de equipamentos deve ser um número maior que 0";

                if (error.Message.Contains("Número máximo de máquinas excedido")) Session["MsgErromaqdef"] = "Número máximo de equipamentos excedido";
                
                if (error.Message.Contains("Voce deve selecionar o laboratório que possui equipamentos com defeito")) Session["MsgErrolab"] = "Voce deve selecionar o laboratório que possui equipamentos com defeito";

            }
            finally
            {
                Response.Redirect("~//2-Servidor/WebFormCRUDChamado.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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
    }
}