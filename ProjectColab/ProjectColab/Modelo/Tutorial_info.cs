using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial_info
    {
        public string tutorial_id { get; set; }
        public byte[] logo { get; set; }
        public string pr_info { get; set; }

        public Tutorial_info()
        {
            this.tutorial_id = "";
            this.logo = null;
            this.pr_info = "";
        }
        public Tutorial_info(string atutorial_id, byte[] alogo, string apr_info)
        {
            this.tutorial_id = atutorial_id;
            this.logo = alogo;
            this.pr_info = apr_info;
        }
    }

}