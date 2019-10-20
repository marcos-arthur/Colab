using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Equipamento
    {
        public string id { get; set; }
        public string laboratorio_nome { get; set; }
        public string laboratorio_id { get; set; }
        public string modelo { get; set; }
        public int quantidade { get; set; }

        public Equipamento()
        {
            this.id = "";
            this.laboratorio_nome = "";
            this.laboratorio_id = "";
            this.modelo = "";
            this.quantidade = 0;
        }

        public Equipamento(string id, string laboratorio_nome, string laboratorio_id,  string modelo, int quantidade)
        {
            this.id = id;
            this.laboratorio_nome = laboratorio_nome;
            this.laboratorio_id = laboratorio_id ;
            this.modelo = modelo;
            this.quantidade = quantidade;
        }
    }
}