using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


namespace ProjectColab
{
    public partial class WebFormLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {
            // Instancia objeto DAL
            DAL.DALUsuario aDALUsuario = new DAL.DALUsuario();

            // Valida Usuario
            List<Modelo.Usuario> aListUsuario = aDALUsuario.Select(Login.Text);
            if (aListUsuario.Count == 0)
            {
                Session["msgErro"] = "Usuário não cadastrado";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            // Critografa senha
            string senhaMD5 = GerarHashMd5(senha.Text);
            // Le usuário da Lista
            Modelo.Usuario aUsuario = aListUsuario[0];
            // Valida Senha
            if (aUsuario.senha != senhaMD5)
            {
                Session["msgErro"] = "Senha Inválida";
                Response.Redirect("~\\WebFormLogin.aspx");
            }
            // Salva usuário na sessão
            Session["msgErro"] = "";
            Session["usuario"] = aUsuario.nome;
            Response.Redirect("~\\WebSiteCRUDUsuario.aspx");
        }
            public string GerarHashMd5(string input)
            {
                MD5 md5Hash = MD5.Create();
                // Converter a String para array de bytes, que é como a biblioteca trabalha.
                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                // Cria-se um StringBuilder para recompôr a string.
                StringBuilder sBuilder = new StringBuilder();
                // Loop para formatar cada byte como uma String em hexadecimal
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                return sBuilder.ToString();
            }
        
    }
    
}