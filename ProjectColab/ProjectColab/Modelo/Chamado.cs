using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Chamado
    {     
        /* DECLARAÇÃO DE VARIÁVEIS */

        /* Informações necessário para que um chamado seja aberto */

        //id do chamado
        public string id { get; set; }

        //resumo do chamado
        public string resumo { get; set; }

        //numeração do status do chamado
        public int status { get; set; }
        
        //id do usuário que abriu um chamado
        public string usuario_aberto_id { get; set; }
        
        //id do usuário para qual o chamado foi atribuido
        public string usuario_atribuido_id { get; set; }

        //id da sala que o chamado foi aberto
        public string sala_id { get; set; }

        //id da categoria do chamado
        public string categoria_id { get; set; }

        //quantidade de equipamentos
        public int quantidadeeq { get; set; }

        //Data em que o chamado foi aberto
        public DateTime data { get; set; }

        //tipo de chamado
        public int statusEI { get; set; }


        /* Informações necessárias para a visualização do chamado */

        //nome do usuário que abriu o chamado
        public string nomeUsuarioAberto { get; set; }

        //nome do usuário para qual o chamado foi atribuido
        public string nomeUsuarioAtribuido { get; set; }

        //nome da sala que chamado foi aberto
        public string nomesala { get; set; }

        //texto do status do chamado
        public string statuschamado { get; set; }        

        //nome da categoria
        public string categoriaNome { get; set; }

        //nome do tipo de chamado
        public string tipoNome { get; set; }

        /* CONSTUTORES */

        //Construtor padrão
        public Chamado()
        {
            this.id = "";
            this.status = 0;
            this.statusEI = 0;
            this.statuschamado = "";
            this.resumo = "";
            this.quantidadeeq = 0;
            this.data = new DateTime();
        }

        //Usado quando um chamado é aberto
        public Chamado(string aid, string usuAberto, string sala, string cat,int astatus, int astatusEI, string astatuschamado ,string aresumo, int aquantidadeeq, DateTime adata)
        {
            this.id = aid;
            this.usuario_aberto_id = usuAberto;
            this.sala_id = sala;
            this.categoria_id = cat;
            this.status = astatus;
            this.statusEI = astatusEI;
            this.statuschamado = astatuschamado;
            this.resumo = aresumo;
            this.quantidadeeq = aquantidadeeq;
            this.data = adata;
        }

        //Usado quando um chamado é selecionado
        public Chamado(string aid, string usuAberto, string sala, string usuAtribuido, string nomeUsuAberto, string nomeUsuAtribuido, string nomesala, int astatus, int astatusEI, string astatuschamado, string aresumo, int aquantidadeeq, DateTime adata, string catNome)
        {
            this.id = aid;
            this.usuario_aberto_id = usuAberto;
            this.sala_id = sala;
            this.usuario_atribuido_id = usuAtribuido;
            this.nomeUsuarioAberto = nomeUsuAberto;
            this.nomesala = nomesala;
            this.nomeUsuarioAtribuido = nomeUsuAtribuido;
            this.status = astatus;
            this.statusEI = astatusEI;
            this.resumo = aresumo;
            this.quantidadeeq = aquantidadeeq;
            this.data = adata;
            this.statuschamado = astatuschamado;
            this.categoriaNome = catNome;

            //Tipo de chamado (Externo ou Interno)
            if (statusEI == 1) this.tipoNome = "Externo";
            else this.tipoNome = "Interno";

        }
    }
}