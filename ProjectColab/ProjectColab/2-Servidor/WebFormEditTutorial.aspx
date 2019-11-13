<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditTutorial.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" onload="sumir()">
        <div class="column middle">
    <div class="editmenu">
        <div class="iconchamado"><i class=""></i> <a class="title">tutorial #</a>
        </div> 

        <!--Nome do usuario-->
        <div class="rowChamado"><a class="textEditChamado">Aberto por </a><a class="textEditChamado nomeChamado">dawdawd</a></div>
        
        <!--Tipo do tutorial-->
        <div class="rowChamado"><a class="textEditChamado">assunto</a><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="titulo" DataValueField="id"></asp:DropDownList><asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DAOAssunto"></asp:ObjectDataSource>
        </div>

        <!--Usuario atribuido-->
        <div class="rowChamado"><a class="textEditChamado"> Atendente </a><a class="textEditChamado nomeChamado">dawdwad</a></div>
                           
        <!--Nome da sala-->
        <div class="rowChamado"><a class="textEditChamado"> Sala </a><a class="textEditChamado nomeChamado">dawdawd</a></div>                            

        <!--Categoria do chamado-->
        <div class="rowChamado"><a class="textEditChamado"> Categoria </a><a class="textEditChamado nomeChamado">dawdad</a></div>                            

        <!--Tipo do chamado-->
        <div class="rowChamado"><a class="textEditChamado"> Tipo </a><a class="textEditChamado nomeChamado">dawdawd</a></div>           

        <!--Resumo do problema-->
        <div class="rowChamado"><a class="textEditChamado"> Resumo do problema </a><a class="textEditChamado nomeChamado">dawdwad</a></div>
        <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
        <br />-->

        <!--Quantidade de Equipamento-->
        <div class="rowChamado"><a class="textEditChamado"> Quantidade de equipamentos </a><a class="textEditChamado nomeChamado">dawawdawd</a></div> 
                            
        <!--Data-->
        <div class="rowChamado"><a class="textEditChamado"> Data de abertura </a><a class="textEditChamado nomeChamado">dawdawd</a></div>
                                
                            
        <!--Botoes-->  
    </div>    
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
