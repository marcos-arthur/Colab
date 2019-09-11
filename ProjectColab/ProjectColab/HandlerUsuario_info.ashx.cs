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
            List<Modelo.Usuario> aListUsuario;
            Modelo.Usuario aUsuario;
            DAL.DALUsuario aDALUsuario;

            id = context.Request.QueryString["id"].ToString();

            aDALUsuario = new DAL.DALUsuario();
            aListUsuario = aDALUsuario.Select(id);

            if (aListUsuario.Count > 0)
            {
                aUsuario = aListUsuario[0];
                context.Response.ContentType = aUsuario.foto.ToString();
                context.Response.BinaryWrite(aUsuario.foto);
            }
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