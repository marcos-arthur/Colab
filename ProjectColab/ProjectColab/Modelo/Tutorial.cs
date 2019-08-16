using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial
    {
        public string id { get; set; }
        public string titulo { get; set; }
        public decimal status{ get; set; }
        public string arquivo { get; set; }

        public Tutorial()
        {
            this.id = "";
            this.titulo = "";
            this.status = 0;
            this.arquivo = "";
        }

        public Tutorial(string aid, string atitulo, decimal astatus, string aarquivo)
        {
            this.id = aid;
            this.titulo = atitulo;
            this.status = astatus;
            this.arquivo = aarquivo;
        }
    }
}