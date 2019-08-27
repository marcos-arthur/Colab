
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddTutorial.aspx.cs" Inherits="ProjectColab.WebFormAddTutorial" %>

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
                <li class="li2"><a href="">USUARIO</a></li>
            </ul>


            <div class ="mid">            
                <p>TITULO DO TUTORIAL</p>   <asp:TextBox ID="titulo" runat="server" CssClass="text"></asp:TextBox>                     
                <p>URL DO ARQUIVO</p>   <asp:FileUpload ID="arquivo_url" runat="server" />        
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
                <asp:Button runat="server" ID="cancel" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDTutorial.aspx"/>
            </div>


        </div>
    </form>
</body>
</html>