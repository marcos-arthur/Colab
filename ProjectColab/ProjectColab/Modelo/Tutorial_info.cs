using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial_info
    {
        public string id { get; set; }
        public byte[] logo { get; set; }
        public string arquivo { get; set; }

        public Tutorial_info()
        {
            this.id = "";
            this.logo = null;
            this.arquivo = "";
        }
        public Tutorial_info(string aid, byte[] alogo, string aarquivo)
        {
            this.id = aid;
            this.logo = alogo;
            this.arquivo = aarquivo;
        }
    }
}

