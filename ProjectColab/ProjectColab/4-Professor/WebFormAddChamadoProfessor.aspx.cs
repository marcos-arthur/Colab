﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectColab._4_Professor
{
    public partial class WebFormAddChamadoProfessor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Apresenta mensagem de erro
            if ((Session["MsgErroresumop"] != null) && (Session["MsgErroresumop"].ToString() != ""))
            {
                MsgErroresumop.Text = Session["MsgErroresumop"].ToString();
                Session["MsgErroresumop"] = null;
            }
            if ((Session["MsgErromaqdef"] != null) && (Session["MsgErromaqdef"].ToString() != ""))
            {
                MsgErromaqdef.Text = Session["MsgErromaqdef"].ToString();
                Session["MsgErromaqdef"] = null;
            }
            if ((Session["MsgErrosala"] != null) && (Session["MsgErrosala"].ToString() != ""))
            {
                MsgErrosalas.Text = Session["MsgErrosalas"].ToString();
                Session["MsgErrosalas"] = null;
            }
        }
        protected void add_Click1(object sender, EventArgs e)
        {
            //Chamada do Modelo e do DAL para gravar valor no banco
            Modelo.Chamado aChamado;
            DAL.DALChamado aDALChamado = new DAL.DALChamado(); ;

            //Conversão de da quantidade de equipamento de string para int
            int quantidade = 0;
            //Caso seja um inteiro, efetua a conversão
            //Caso contrário, retornará 0 para ser tratado no trigger do banco
            if (int.TryParse(quantidadeeq.Text, out int result)) quantidade = Convert.ToInt32(quantidadeeq.Text);
            else quantidade = 0;

            //Salva os valores pegos na WebForm na classe modelo

            aChamado = new Modelo.Chamado("1", Session["idusuario"].ToString(), salaDrop.Text, catDrop.Text,modeloDrop.Text,tombamento.Text, 1, 1, "", Convert.ToString(resumo.Text), quantidade, DateTime.Now);

            //bool para controle de erros
            //ok == true    -> Erro inexistente
            //ok == false = -> Erro existente
            bool ok = true;

            //TryCatch para tratamento de possíveis erros
            //Os erros serão apresentados na tela quando a página for atualizada
            try
            {
                aDALChamado.Insert(aChamado);
            }
            //Erros capturados pelos triggers no banco de dados
            catch (SqlException error)
            {
                //Caso um erro seja detectado, ok se torna false
                ok = false;

                //Resumo vazio
                if (error.Message.Contains("Para abrir um chamado você deve indicar o problema")) Session["MsgErroresumop"] = "Para abrir um chamado você deve indicar o problema";

                //Quantidade de máquinas com defeito menor que 1
                if (error.Message.Contains("A quantidade de equipamentos deve ser um número maior que 0")) Session["MsgErromaqdef"] = "A quantidade de equipamentos deve ser um número maior que 0";

                //Quantidade de máquinas maior que o existente na sala
                if (error.Message.Contains("Numero maximo de maquinas excedido")) Session["MsgErromaqdef"] = "Número máximo de equipamentos excedido";

                //Nenhum equipamento foi escolhido -- Caso esse erro ocorra, nenhum dos outros será chamado, pois ele ocorre antes do trigger
                if (error.Message.Contains("FK__Chamado__salas__5EBF139D")) Session["MsgErrosalas"] = "Voce deve selecionar a sala que possui equipamentos com defeito";

            }
            //Erro de erro de conversão que pode acontecer no DAL            
            catch (FormatException errorFormat)
            {
                //Caso um erro seja detectado, ok se torna false
                ok = false;

                //Nenhum equipamento foi escolhido
                //Esse erro não será tratado caso a língua padrão da máquina onde a aplicação foi instalada for diferente do português
                //    Acontecerá, pois o Format Exception é gerado automaticamente
                //Nenhum equipamento foi escolhido -- Caso esse erro ocorra, nenhum dos outros será chamado, pois ele ocorre antes do trigger
                if (errorFormat.Message.Contains("A cadeia de caracteres de entrada não estava em um formato correto")) Session["MsgErrosala"] = "Deve haver uma sala válida existente";
            }

            //If para confirmação de erro
            //Caso não ocorra algum erro, o usuário é redirecionado para o crud
            //Caso haja erro, a página atualiza exibe as mensagens de erro
            if (ok) Response.Redirect("~//4-Professor/WebFormCRUDChamadoProfessor.aspx");
            else Response.Redirect("~//4-Professor/WebFormAddChamadoProfessor.aspx");
        }
    }
}