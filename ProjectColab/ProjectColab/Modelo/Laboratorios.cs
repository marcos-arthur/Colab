using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Laboratorios
    {
        public string id { get; set; }
        public string nome { get; set; }

        public Laboratorios()
        {
            this.id = "";
            this.nome = "";

        }

        public Laboratorios(string aid,string anome)
        {
            this.id = aid;
            this.nome = anome;
        }
    }
}