<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddSala.aspx.cs" Inherits="ProjectColab.WebFormAddSala" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          
    <div class="row">
            <div class="column middle">
            <div class="indicador"><a class="title">ADICIONAR SALA</a></div>
                <div class="menuAdd">
                    <i class="fa fa-desktop"></i>
                    <asp:TextBox ID="nome" runat="server" Placeholder="nome da sala" CssClass="inputsearch2 inputToAdd"></asp:TextBox>
                    <asp:Label ID="MsgErro" runat="server" ForeColor="Red"></asp:Label>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd btnToAdd" OnClick="Add_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
                </div>    
            </div>
        </div>
      
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>