using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab
{
    /// <summary>
    /// Descrição resumida de HandlerTutorial_info
    /// </summary>
    public class HandlerTutorial_info : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string id;
            List<Modelo.Tutorial_info> aListTutorial_info;
            Modelo.Tutorial_info aTutorial_info;
            DAL.DALTutorial_info aDALTutorial_info;

            id = context.Request.QueryString["id"].ToString();

            aDALTutorial_info = new DAL.DALTutorial_info();
            aListTutorial_info = aDALTutorial_info.Select(id);

            if (aListTutorial_info.Count > 0)
            {
                aTutorial_info = aListTutorial_info[0];
                context.Response.ContentType = aTutorial_info.logo.ToString();
                context.Response.BinaryWrite(aTutorial_info.logo);
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