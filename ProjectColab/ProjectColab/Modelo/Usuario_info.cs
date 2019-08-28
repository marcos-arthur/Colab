using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Usuario_info
    {
        public string usuario_id { get; set; }
        public byte[] foto { get; set; }
        public string us_info { get; set; }
        public string arquivo { get; set; }

        public Usuario_info()
        {
            this.usuario_id = "";
            this.foto = null;
            this.us_info = "";
            this.arquivo = "";
        }
        public Usuario_info(string ausuario_id, byte[] afoto, string aus_info, string aarquivo)
        {
            this.usuario_id = ausuario_id;
            this.foto = afoto;
            this.us_info = aus_info;
            this.arquivo = aarquivo;
        }
    }
}