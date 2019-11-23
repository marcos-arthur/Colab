using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Assunto
    {
        public string id { get; set; }
        public string titulo{ get; set; }

        public Assunto() {
            id = "";
            titulo = "";
        }

        public Assunto(string aid, string atitulo)
        {
            id = aid;
            titulo = atitulo;
        }
    }
}