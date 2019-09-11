using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab
{
    /// <summary>
    /// Descrição resumida de HandlerTutorial_info
    /// </summary>
    /*public class HandlerTutorial_info : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string id;
            List<Modelo.Tutorial> aListTutorial;
            Modelo.Tutorial aTutorial;
            DAL.DALTutorial aDALTutorial;

            id = context.Request.QueryString["id"].ToString();

            aDALTutorial = new DAL.DALTutorial();
            aListTutorial = aDALTutorial.Select(id);

            if (aListTutorial.Count > 0)
            {
                aTutorial = aListTutorial[0];
                context.Response.ContentType = aTutorial.arquivo.ToString();
                context.Response.BinaryWrite(aTutorial.arquivo);
            }
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }*/
}