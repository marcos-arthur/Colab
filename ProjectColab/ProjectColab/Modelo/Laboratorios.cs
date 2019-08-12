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
        public string modelo { get; set; }
        public int quantidade { get; set; }

        public Laboratorios()
        {
            this.id = "";
            this.nome = "";
            this.modelo = "";
            this.quantidade = 0;
        }

        public Laboratorios(string aid,string anome,string amodelo,int aquantidade)
        {
            this.id = aid;
            this.nome = anome;
            this.modelo = amodelo;
            this.quantidade = aquantidade;
        }
    }
}