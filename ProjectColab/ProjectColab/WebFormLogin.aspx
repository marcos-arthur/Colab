<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormLogin.aspx.cs" Inherits="ProjectColab.WebFormLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/>  
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
<link rel="stylesheet" type="text/css" href="stylelogin.css"/> 
    <title>COLAB</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
	        <div class="logo"><a href="index.aspx">COLAB</a></div>
            <p>
               <asp:Literal runat="server" ID="LabelMsgErro" />
            </p> 
            <div class="login">                
                <p>LOGIN</p><asp:TextBox ID="Login" runat="server" CssClass="text"></asp:TextBox>
                <p>SENHA</p><asp:TextBox ID="Senha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="data" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ENTRAR" CssClass="loginbtn" OnClick="add_Click"/>
            </div>       
        </div>
    </form>
</body>
</html>