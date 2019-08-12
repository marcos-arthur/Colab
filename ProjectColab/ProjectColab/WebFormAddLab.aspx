<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddLab.aspx.cs" Inherits="ProjectColab.WebFormAddLab" %>

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
	        <div class="logo"><a href="">COLAB</a></div>
	        <div class="container">
		        <div class="box">
			        <a href="">DASHBOARD</a>
			        <a href="">TUTORIAIS</a>
			        <a href="">REQUISIÇÕES</a>
			        <a href="">LABORATÓRIOS</a>
		        </div>
		        <div class="box2">
			        <a href="">USUARIO</a>
			        <a href="WebFormAddLab.aspx">+</a>
		        </div>		
	        </div>




        <div class="mid">
            <p>NOME DO LABORATÓRIO</p><asp:TextBox runat="server" ID="name" placeholder="NOME DO LABORATÓRIO" CssClass="text"></asp:TextBox>

            <p>QUANTIDADE DE MAQUINAS</p>
            <asp:TextBox runat="server" ID="qtd" placeholder="QUANTIDADE DE MÁQUINAS" CssClass="text" ></asp:TextBox>

            <p>MODELO</p>

            <asp:TextBox runat="server" ID="mdl" placeholder="MODELO" CssClass="text"></asp:TextBox>

            <br />
            <br />
            <asp:Button runat="server" ID="add" Text="Adicionar" CssClass="addbtn"/>
            <asp:Button runat="server" ID="cancel" Text="Cancelar" CssClass="cancelbtn"/>

        </div>
    </form>
</body>
</html>
