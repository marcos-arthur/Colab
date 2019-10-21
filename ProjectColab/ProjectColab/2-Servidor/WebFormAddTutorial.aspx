<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddTutorial.aspx.cs" Inherits="ProjectColab.WebFormAddTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">         

    <div class="row">
        <div class="column middle">
            <div class="indicador"><a class="title">ADICIONAR TUTORIAL</a></div>
                <div class="menuAdd">

                <asp:TextBox ID="titulo" runat="server" Placeholder="DIGITE AQUI O TÍTULO DO TUTORIAL" CssClass="inputsearch2 inputToAdd"></asp:TextBox>  
                <asp:Label ID="MsgErrotitulo" runat="server" ForeColor="Red"></asp:Label>

                <div class=""><a>ADICIONAR ARQUIVO DE TUTORIAL</a></div>
                <asp:FileUpload ID="arquivo" CssClass="inputsearch2 inputToAdd" placeholder="ola" runat="server" />
                <asp:Label ID="MsgErroarquivo" runat="server" ForeColor="Red"></asp:Label>                                
                
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button1_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd btnToAdd" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>
         </div> 
        
</asp:Content>

