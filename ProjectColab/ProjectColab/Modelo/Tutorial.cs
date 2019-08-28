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


        public Tutorial()
        {
            this.id = "";
            this.tutorial_titulo = "";
            this.status = 0;
        }

        public Tutorial(string aid, string atutorial_titulo, decimal astatus)
        {
            this.id = aid;
            this.tutorial_titulo = atutorial_titulo;
            this.status = astatus;
        }
    }
}
