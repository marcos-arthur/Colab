using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Salas
    {
        public string id { get; set; }
        public string nome { get; set; }
        public string status { get; set; }

        public Salas()
        {
            this.id = "";
            this.nome = "";
            this.status = "";

        }

        public Salas(string aid, string anome, string astatus)
        {
            this.id = aid;
            this.nome = anome;
            this.status = astatus;
        }
    }
}