using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Salas
    {
        public string nome { get; set; }
        public int id { get; set; }

        public Salas(){
            id = 0;
            nome = "";
        }

        public Salas(string name, int id) {
            this.id = id;
            nome = name;
        }
    }
}