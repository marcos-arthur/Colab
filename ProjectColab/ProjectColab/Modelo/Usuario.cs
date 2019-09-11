using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Usuario
    {
        public string id { get; set; }
        public string nome { get; set; }
        public string login { get; set; }
        public string senha { get; set; }
        public int tipo { get; set; }
        public byte[] foto { get; set; }


        public Usuario()
        {
            id = "";
            nome = "";
            login = "";
            senha = "";
            tipo = 0;
            foto = null;
        }

        public Usuario(string id, string nome, string login, string senha, int tipo, byte[] foto)
        {
            this.id = id;
            this.nome = nome;
            this.login = login;
            this.senha = senha;
            this.tipo = tipo;
            this.foto = foto;
        }
    }
}