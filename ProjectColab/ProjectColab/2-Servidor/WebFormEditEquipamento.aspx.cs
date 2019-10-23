using System;
using System.Collections.Generic;
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
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DAL.DALEquipamento dalEquip = new DAL.DALEquipamento();
            Modelo.Equipamento equip = dalEquip.Select(Session["idequip"].ToString());

            TextBox quantidade = (TextBox)LabEquips.Items[0].FindControl("quant");

            equip.quantidade = Convert.ToInt32(quantidade.Text);

            dalEquip.Update(equip);

            Response.Redirect("~//2-Servidor/WebFormCRUDEquipamento.aspx");
        }
    }
}