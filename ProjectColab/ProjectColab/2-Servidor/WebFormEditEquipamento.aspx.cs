using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._2_Servidor
{
    public partial class WebFormEditEquipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Session["idequip"].ToString();

            Label errorModelo = null;
            Label errorQuant = null;

            if (LabEquips.Items.Count > 0)
            {
                errorModelo = (Label)LabEquips.Items[0].FindControl("MsgErroModelo");
                errorQuant = (Label)LabEquips.Items[0].FindControl("MsgErroQuant");

                errorModelo.Text = "";
                errorQuant.Text = "";
            }            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Label errorModelo = (Label)LabEquips.Items[0].FindControl("MsgErroModelo");
            Label errorQuant = (Label)LabEquips.Items[0].FindControl("MsgErroQuant");

            bool ok = true;

            DAL.DALEquipamento dalEquip = new DAL.DALEquipamento();
            Modelo.Equipamento equip = dalEquip.Select(Session["idequip"].ToString());

            TextBox quantidade = (TextBox)LabEquips.Items[0].FindControl("quant");

            if (int.TryParse(quantidade.Text, out int result)) equip.quantidade = Convert.ToInt32(quantidade.Text);
            else equip.quantidade = 0;

            TextBox modelo = (TextBox)LabEquips.Items[0].FindControl("modelo");

            equip.modelo = modelo.Text;

            try
            {
                dalEquip.Update(equip);
            }
            catch (SqlException error)
            {
                ok = false;

                if (error.Message.Contains("O equipamento inserido deve pertencer a alguma sala")) Session["MsgErroDropSalas"] = "O equipamento inserido deve pertencer a alguma sala";

                if (error.Message.Contains("A quantidade de equipamento deve ser um número maior que 0")) errorModelo.Text = "A quantidade de equipamento deve ser um número maior que 0";

                if (error.Message.Contains("O modelo do equipamento nao pode ser vazio")) errorQuant.Text = "O modelo do equipamento nao pode ser vazio";
            }

           /* if (ok) Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
            else Response.Redirect("~//2-Servidor/WebFormEditEquipamento.aspx");     */       
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            DAL.DALEquipamento dalEquip = new DAL.DALEquipamento();
            Modelo.Equipamento equip = dalEquip.Select(Session["idequip"].ToString());

            dalEquip.Delete(equip);

            Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
        }
    }
}