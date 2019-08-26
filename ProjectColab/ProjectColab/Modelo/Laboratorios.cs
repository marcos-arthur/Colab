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
        public string equipamento { get; set; }

        public Laboratorios()
        {
            this.id = "";
            this.nome = "";
            this.equipamento= "";
        }

        public Laboratorios(string aid,string anome,string aequipamento)
        {
            this.id = aid;
            this.nome = anome;
            this.equipamento = aequipamento;
        }
    }
}