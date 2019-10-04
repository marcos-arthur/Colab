using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Comentario
    {
        public string id { get; set; }
        public string usuario_id { get; set; }
        public string chamados_id { get; set; }
        public decimal restricao { get; set; }
        public string descricao { get; set; }
        public DateTime data_hora { get; set; }

        public Comentario()
        {
            this.id = "";
            this.usuario_id = "";
            this.chamados_id = "";
            this.descricao = "";
            this.restricao = 0;
            this.data_hora = new DateTime();
        }

        public Comentario(string id, string usuario_id, string chamados_id, decimal restricao, string descricao, DateTime data_hora)
        {
            this.id = id;
            this.usuario_id = usuario_id;
            this.chamados_id = chamados_id;
            this.restricao = restricao;
            this.descricao = descricao;
            this.data_hora = data_hora;
        }
    }
}