using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Categoria
    {
        public string id { get; set; }
        public string nome { get; set; }

        public Categoria()
        {
            this.id = "";
            this.nome = "";
        }

        public Categoria(string id, string nome)
        {
            this.id = id;
            this.nome = nome;
        }
    }
}