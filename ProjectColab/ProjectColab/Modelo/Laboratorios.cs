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
        public Modelo.Equipamento eqid { get; set; }
        public Modelo.Equipamento laboratorio_id { get; set; }
        public Modelo.Equipamento modelo { get; set; }
        public Modelo.Equipamento quantidade { get; set; }

        public Laboratorios()
        {
            this.id = "";
            this.nome = "";
            this.eqid = new Modelo.Equipamento();
            this.laboratorio_id = new Modelo.Equipamento();
            this.modelo = new Modelo.Equipamento();
            this.quantidade = new Modelo.Equipamento(); 

        }

        public Laboratorios(string aid,string anome, string eqid, string laboratorio_id, string modelo, decimal quantidade)
        {
            this.id = aid;
            this.nome = anome;
        }
    }
}