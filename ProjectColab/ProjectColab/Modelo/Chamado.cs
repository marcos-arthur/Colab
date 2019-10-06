using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Chamado
    {
        public string id { get; set; }
        public int status { get; set; }
        public string usuario_aberto_id { get; set; }
        public string usuario_atribuido_id { get; set; }
        public string laboratorios_id { get; set; }
        public string nomeUsuarioAberto { get; set; }
        public string nomeUsuarioAtribuido { get; set; }
        public string nomeLaboratorio { get; set; }
        public string resumo { get; set; }
        public decimal quantidadeeq { get; set; }
        public DateTime data { get; set; }
        public string statuschamado { get; set; }

        public Chamado()
        {
            this.id = "";
            this.status = 0;
            this.statuschamado = "";
            this.resumo = "";
            this.quantidadeeq = 0;
            this.data = new DateTime();
        }

        public Chamado(string aid, string usuAberto, string lab, int astatus,string astatuschamado ,string aresumo, decimal aquantidadeeq, DateTime adata)
        {
            this.id = aid;
            this.usuario_aberto_id = usuAberto;
            this.laboratorios_id = lab;
            this.status = astatus;
            this.resumo = aresumo;
            this.quantidadeeq = aquantidadeeq;
            this.data = adata;
            this.statuschamado = astatuschamado;
        }
        public Chamado(string aid, string usuAberto, string lab, string usuAtribuido, string nomeUsuAberto, string nomeUsuAtribuido, string nomeLab, int astatus, string astatuschamado, string aresumo, decimal aquantidadeeq, DateTime adata)
        {
            this.id = aid;
            this.usuario_aberto_id = usuAberto;
            this.laboratorios_id = lab;
            this.usuario_atribuido_id = usuAtribuido;
            this.nomeUsuarioAberto = nomeUsuAberto;
            this.nomeLaboratorio = nomeLab;
            this.nomeUsuarioAtribuido = nomeUsuAtribuido;
            this.status = astatus;
            this.resumo = aresumo;
            this.quantidadeeq = aquantidadeeq;
            this.data = adata;
            this.statuschamado = astatuschamado;
        }
    }
}