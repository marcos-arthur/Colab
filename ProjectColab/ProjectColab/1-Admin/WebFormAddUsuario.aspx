<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="WebFormAddUsuario.aspx.cs" Inherits="ProjectColab.WebFormAddUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class ="mid">   
            <p>NOME</p>   <asp:TextBox ID="nome" runat="server" CssClass="text"></asp:TextBox> 
            <asp:Label ID="MsgErronome" runat="server" ForeColor="Red"></asp:Label>
            <p>LOGIN</p>   <asp:TextBox ID="login" runat="server" CssClass="text"></asp:TextBox>      
            <asp:Label ID="MsgErrologin" runat="server" ForeColor="Red"></asp:Label>
            <p>SENHA</p>   <asp:TextBox ID="senha" TextMode="Password" runat="server" CssClass="text" MaxLength="20" ></asp:TextBox>
            <asp:Label ID="MsgErrosenha" runat="server" ForeColor="Red"></asp:Label>
            <p>Confirmar senha</p>   <asp:TextBox ID="confirmaSenha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
            <asp:Label ID="MsgErrosenhacf" runat="server" ForeColor="Red"></asp:Label>
            <p>TIPO</p>   <asp:TextBox ID="tipo" runat="server" CssClass="text"></asp:TextBox>   
            <asp:Label ID="MsgErrotipo" runat="server" ForeColor="Red"></asp:Label>           
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
            <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/1-Admin/IndexAdmin.aspx"/>
        </div>
</asp:Content>

