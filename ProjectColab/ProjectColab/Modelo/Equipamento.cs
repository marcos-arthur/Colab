using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Equipamento
    {
        public string id { get; set; }
        public string laboratorio_id { get; set; }
        public string modelo { get; set; }
        public decimal quantidade { get; set; }

        public Equipamento()
        {
            this.id = "";
            this.laboratorio_id = "";
            this.modelo = "";
            this.quantidade = 0;
        }

        public Equipamento(string aid, string laboratorio_id,string modelo,decimal quantidade)
        {
            this.id = aid;
            this.laboratorio_id = laboratorio_id;
            this.modelo = modelo;
            this.quantidade = quantidade;
        }
    }
}