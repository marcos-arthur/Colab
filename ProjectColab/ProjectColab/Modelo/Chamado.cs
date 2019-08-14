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
        public string resumo { get; set; }
        public int qtdEquip { get; set; }
        public DateTime data { get; set; }

        public Chamado()
        {
            this.id = "";
            this.status = 0;
            this.resumo = "";
            this.qtdEquip = 0;
            this.data = new DateTime();
        }

        public Chamado(string aid, int astatus, string aresumo, int aqtdEquip, DateTime adata)
        {
            this.id = aid;
            this.status = astatus;
            this.resumo = aresumo;
            this.qtdEquip = aqtdEquip;
            this.data = adata;
        }
    }
}