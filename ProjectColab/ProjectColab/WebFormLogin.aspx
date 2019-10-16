<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormLogin.aspx.cs" Inherits="ProjectColab.WebFormLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/> 
<link rel="stylesheet" type="text/css" href="stylelogin.css"/> 
<link rel="stylesheet" type="text/css" href="StyleInput.css"/>
<link rel="stylesheet" type="text/css" href="StyleChat.css"/>
<link rel="stylesheet" type="text/css" href="stylecontainer.css"/> 
<link rel="stylesheet" type="text/css" href="StyleButton.css"/>
<link rel="stylesheet" type="text/css" href="StyleIndicador.css"/>
<link rel="stylesheet" type="text/css" href="StyleEditChamado.css"/> 
<link href="css\fontawesome.css" rel="stylesheet">
<link href="css\brands.css" rel="stylesheet">
<link href="css\solid.css" rel="stylesheet">  
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<style>
body{
    overflow-y:hidden;
}
</style>
<script src="../confirmar.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>COLAB</title>
</head>
<body>
<div id="particles-js"></div> 
    <form id="form1" runat="server">
        <div class="loginfix">

                <div class="login"> 
               <asp:Literal runat="server" ID="LabelMsgErro" />
            <div class="logo"><img  class="imagefix" src="..\logo.png"/></div>                    
                    <asp:TextBox ID="Login" placeholder="DIGITE O SEU LOGIN" runat="server" CssClass="inputlogin"></asp:TextBox>
                    <asp:TextBox ID="Senha" placeholder="DIGITE SUA SENHA" TextMode="Password" runat="server" CssClass="inputlogin"></asp:TextBox>
                <asp:TextBox ID="data" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:Button ID="add" runat="server" Text="ENTRAR" CssClass="btnlogin" OnClick="add_Click"/>
                </div>     
        </div>
<script src="js/particles.js"></script>
<script src="js/app.js"></script>
    </form>
</body>
</html>