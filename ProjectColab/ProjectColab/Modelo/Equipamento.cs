using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Equipamento
    {
        public string id { get; set; }
        public string sala_nome { get; set; }
        public string sala_id { get; set; }
        public string modelo { get; set; }
        public int quantidade { get; set; }

        public Equipamento()
        {
            this.id = "";
            this.sala_nome = "";
            this.sala_id = "";
            this.modelo = "";
            this.quantidade = 0;
        }

        public Equipamento(string id, string sala_nome, string sala_id,  string modelo, int quantidade)
        {
            this.id = id;
            this.sala_nome = sala_nome;
            this.sala_id = sala_id;
            this.modelo = modelo;
            this.quantidade = quantidade;
        }
    }
}