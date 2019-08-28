<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDUsuario.aspx.cs" Inherits="ProjectColab.WebFormCRUDUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="shortcut icon" href="Logo.png" />
<link rel="stylesheet" type="text/css" href="style.css"/>    
<link rel="stylesheet" type="text/css" href="styleadd.css"/>
<link rel="stylesheet" type="text/css" href="Crudstyle.css"/> 
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
                <li class="li2"><a href="WebFormCRUDUsuario.aspx">USUARIO</a></li>
            </ul>
            <div class="mid"><asp:Button ID="Button1" runat="server" Text="Adicionar usuario" CssClass="cancelbtn" PostBackUrl="~/WebFormAddUsuario.aspx" /></div>
               
        </div>
    </form>
</body>
</html>
