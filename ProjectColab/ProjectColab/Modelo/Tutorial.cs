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
        public string arquivo { get; set; }


        public Tutorial()
        {
            this.id = "";
            this.tutorial_titulo = "";
            this.status = 0;
            this.arquivo = null;
        }

        public Tutorial(string id, string tutorial_titulo, decimal status, string arquivo)
        {
            this.id = id;
            this.tutorial_titulo = tutorial_titulo;
            this.status = status;
            this.arquivo = arquivo;
        }
    }
}
