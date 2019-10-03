<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="WebFormAddUsuario.aspx.cs" Inherits="ProjectColab.WebFormAddUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class ="mid">            
            <p>NOME DO USUÁRIO</p>   <asp:TextBox ID="nomeusuario" runat="server" CssClass="text"></asp:TextBox>                     
            <p>LOGIN</p>   <asp:TextBox ID="login" runat="server" CssClass="text"></asp:TextBox>      
            <p>SENHA</p>   <asp:TextBox ID="senha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
            <p>Confirmar senha</p>   <asp:TextBox ID="confirmaSenha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
            <p>TIPO</p>   <asp:TextBox ID="tipo" runat="server" CssClass="text"></asp:TextBox>   
            <p>FOTO</p>     <asp:FileUpload ID="foto" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
            <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/Admin/WebFormCRUDUsuario.aspx" />
        </div>
</asp:Content>