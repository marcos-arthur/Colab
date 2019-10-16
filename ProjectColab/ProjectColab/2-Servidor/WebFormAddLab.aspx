<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddLab.aspx.cs" Inherits="ProjectColab.WebFormAddLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          
    <div class="row">
            <div class="column middle">
            <div class="indicador"><a class="title">ADICIONAR LABORATÓRIO</a></div>
                <div class="menuadicao">

                <div class=""><i class="fa fa-desktop"></i>
                <asp:TextBox ID="nome" runat="server" Placeholder="nome do laboratório" CssClass="inputtext"></asp:TextBox> </div> 
                <asp:Label ID="MsgErro" runat="server" ForeColor="Red"></asp:Label>

                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd" OnClick="Add_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>     
                
            </div>
      
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>