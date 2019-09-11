<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormAddUsuario.aspx.cs" Inherits="ProjectColab.WebFormAddUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class ="mid">            
            <p>NOME DO USUÁRIO</p>   <asp:TextBox ID="TextBox1" runat="server" CssClass="text"></asp:TextBox>                     
            <p>LOGIN</p>   <asp:TextBox ID="TextBox2" runat="server" CssClass="text"></asp:TextBox>      
            <p>SENHA</p>   <asp:TextBox ID="TextBox3" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>                     
            <p>TIPO</p>   <asp:TextBox ID="TextBox4" runat="server" CssClass="text"></asp:TextBox>   
            <p>FOTO</p>     <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
            <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDTutorial.aspx"/>
        </div>
</asp:Content>