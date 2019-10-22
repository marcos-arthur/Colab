using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial
    {
        public string id { get; set; }
        public string idUsuario { get; set; }
        public string nomeUsuario { get; set; }
        public string tutorial_titulo { get; set; }
        public int status { get; set; }
        public byte[] arquivo { get; set; }


        public Tutorial()
        {
            this.id = "";
            this.tutorial_titulo = "";
            this.status = 0;
            this.arquivo = null;
        }

        public Tutorial(string id, string idU, string tutorial_titulo, int status, byte[] arquivo)
        {
            this.id = id;
            this.idUsuario = idU;
            this.tutorial_titulo = tutorial_titulo;
            this.status = status;
            this.arquivo = arquivo;
        }
        public Tutorial(string id, string idU, string nomeUsu, string tutorial_titulo, int status)
        {
            this.id = id;
            this.nomeUsuario = nomeUsu;
            this.idUsuario = idU;
            this.tutorial_titulo = tutorial_titulo;
            this.status = status;
            this.arquivo = arquivo;
        }
        public Tutorial(byte[] arquivo)
        {
            this.arquivo = arquivo;
        }
    }
}
