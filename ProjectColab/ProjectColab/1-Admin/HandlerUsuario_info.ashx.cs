using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab
{
    /// <summary>
    /// Descrição resumida de HandlerUsuario_info
    /// </summary>
    public class HandlerUsuario_info : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string id;
            Modelo.Usuario aUsuario;
            DAL.DALUsuario aDALUsuario;

            id = context.Request.QueryString["id"].ToString();

            aDALUsuario = new DAL.DALUsuario();
            aUsuario = aDALUsuario.Select(id);

            context.Response.ContentType = aUsuario.foto.ToString();
            context.Response.BinaryWrite(aUsuario.foto);            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}