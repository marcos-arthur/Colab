using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab
{
    public partial class WebFormEditLab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            string id;
            Modelo.Laboratorios aLaboratorios;
            DAL.DALLaboratorio aDALLaboratorio;

            // Copia o conteúdo da primeira célula da linha -> Código do livro
            id = DetailsView1.Rows[0].Cells[1].Text;

            // Instancia um objeto do livro vazio
            aLaboratorios = new Modelo.Laboratorios();
            aLaboratorios.id = id; //atribui apenas o ID

            // Instancia objeto da camada de negócio
            aDALLaboratorio = new DAL.DALLaboratorio();

            // Chama método de delete passando o objeto apenas com o ID preenchido
            aDALLaboratorio.Delete(aLaboratorios);

            Response.Redirect("~\\WebFormCRUDLabs.aspx");
        }
    }
}