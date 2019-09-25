<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormLoginRegister.aspx.cs" Inherits="ProjectColab.WebFormLoginRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/>  
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
<link rel="stylesheet" type="text/css" href="stylelogin.css"/> 
    <title>ABRIR CHAMADO</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
	        <div class="logo"><a href="index.aspx">COLAB</a></div>
            
            <div class="login">
                <asp:Label ID="LabelMsgErro" runat="server" ForeColor="Red"></asp:Label>
                <p>NOME</p><asp:TextBox ID="Nome" runat="server" CssClass="text"></asp:TextBox>
                <p>LOGIN</p><asp:TextBox ID="Login" runat="server" CssClass="text"></asp:TextBox>
                <p>SENHA</p><asp:TextBox ID="Senha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>                
                <asp:TextBox ID="data" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="1">Servidor COLAB</asp:ListItem>
                    <asp:ListItem Value="2">Professor Diatinf</asp:ListItem>
                    <asp:ListItem Value="3">Bolsista</asp:ListItem>
                </asp:DropDownList>
                <p>CONFIRMAÇÃO DE SENHA</p><asp:TextBox ID="ConfirmarSenha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
                <p>FOTO</p><asp:FileUpload ID="Foto" runat="server" />
                <asp:TextBox ID="TextBox2" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="cadastro" runat="server" Text="CADASTRAR" postback="/~WebFormLoginRegister.aspx"  CssClass="loginbtn" OnClick="cadastro_Click1" />
            </div>   
            
        </div>
    </form>

</body>
</html>