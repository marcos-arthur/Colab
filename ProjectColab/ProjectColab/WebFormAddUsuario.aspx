<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddUsuario.aspx.cs" Inherits="ProjectColab.WebFormAddUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/>  
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
	        <div class="logo"><a href="index.aspx">COLAB</a></div>
            <ul class="menu2" style="background-color:white">
                <li class="li1"><a href="WebFormCRUDChamado.aspx">DASHBOARD</a></li>
                <li class="li1"><a href="WebFormCRUDTutorial.aspx">TUTORIAIS</a></li>
                <li class="li1"><a href="">REQUISIÇÕES</a></li>
                <li class="li1"><a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a></li>
                <li class="li2"><a href="WebFormAddLab.aspx">+</a></li>
                <li class="li2"><a href="WebFormAddUsuario.aspx">USUARIO</a></li>
            </ul>


            <div class ="mid">            
                <p>NOME DO USUÁRIO</p>   <asp:TextBox ID="nomeusuario" runat="server" CssClass="text"></asp:TextBox>                     
                <p>LOGIN</p>   <asp:TextBox ID="login" runat="server" CssClass="text"></asp:TextBox>      
                <p>SENHA</p>   <asp:TextBox ID="senha" TextMode="Password" runat="server" CssClass="text"></asp:TextBox>                     
                <p>TIPO</p>   <asp:TextBox ID="tipo" runat="server" CssClass="text"></asp:TextBox>   
                <p>FOTO</p>     <asp:FileUpload ID="foto" runat="server" />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
                <asp:Button runat="server" ID="cancel" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDTutorial.aspx"/>
            </div>


        </div>
    </form>
</body>
</html>