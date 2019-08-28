using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial
    {
        public string id { get; set; }
        public string tutorial_titulo { get; set; }
        public decimal status { get; set; }
        public byte[] logo { get; set; }


        public Tutorial()
        {
            this.id = "";
            this.tutorial_titulo = "";
            this.status = 0;
            this.logo = null;
        }

        public Tutorial(string aid, string atutorial_titulo, decimal astatus, byte[] alogo)
        {
            this.id = aid;
            this.tutorial_titulo = atutorial_titulo;
            this.status = astatus;
            this.logo = alogo;
        }
    }
}
