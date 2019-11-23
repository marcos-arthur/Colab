using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectColab.Modelo
{
    public class Tutorial_Assunto
    {
        public string idAssunto { get; set; }        
        public string idTutorial { get; set; }

        public string assuntoNome { get; set; }
        public string tutorialNome { get; set; }

        public Tutorial_Assunto()
        {
            idAssunto = "";
            idTutorial = "";
        }

        public Tutorial_Assunto(string aidAssunto, string aidTutorial)
        {
            idAssunto = aidAssunto;
            idTutorial = aidTutorial;
        }

        public Tutorial_Assunto(string aidAssunto, string aidTutorial, string aAssuntoNome, string aTutorialNome)
        {
            idAssunto = aidAssunto;
            idTutorial = aidTutorial;

            assuntoNome = aAssuntoNome;
            tutorialNome = aTutorialNome;
        }
    }
}