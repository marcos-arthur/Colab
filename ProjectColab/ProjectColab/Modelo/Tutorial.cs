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
        public string nomeAssunto { get; set; }
        public string idAssunto { get; set; }


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
        public Tutorial(string id, string idU, string nomeUsu, string tutorial_titulo, int status, string nomeAssun, string idAssunto)
        {
            this.id = id;
            this.nomeUsuario = nomeUsu;
            this.idUsuario = idU;
            this.tutorial_titulo = tutorial_titulo;
            this.status = status;
            this.arquivo = arquivo;
            this.nomeAssunto = nomeAssun;
            this.idAssunto = idAssunto;
        }
        public Tutorial(byte[] arquivo)
        {
            this.arquivo = arquivo;           
        }
        
        /// <summary>
        /// Contrutor usado para atualizar um tutorial
        /// </summary>
        /// <param name="id">id do tutorial</param>
        /// <param name="titulo">titulo do tutorial</param>        
        /// <param name="arquivo">array de byte do arquivo</param>
        public Tutorial(string id, string titulo, byte[] arquivo) {
            this.id = id;
            this.tutorial_titulo = titulo;
            this.arquivo = arquivo;
        }

    }
}
