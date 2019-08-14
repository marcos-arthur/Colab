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
	        <div class="logo"><a href="index.aspx">COLAB</a></div>
        <ul class="menu2" style="background-color:white">
            <li class="li1"><a href="">DASHBOARD</a></li>
            <li class="li1"><a href="">TUTORIAIS</a></li>
            <li class="li1"><a href="">REQUISIÇÕES</a></li>
            <li class="li1"><a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a></li>
            <li class="li2"><a href="WebFormAddLab.aspx">+</a></li>
            <li class="li2"><a href="">USUARIO</a></li>
        </ul>



        <div class="mid">
            <p style="display:none">CÓDIGO DO LABORATÓRIO</p><asp:TextBox runat="server" ID="id" placeholder="INDISPONIVEL" CssClass="text" ReadOnly="True" Enabled="False" style="display:none"></asp:TextBox>

            <p>NOME DO LABORATÓRIO</p><asp:TextBox runat="server" ID="nome" placeholder="NOME DO LABORATÓRIO" CssClass="text"></asp:TextBox>

            <p>QUANTIDADE DE MAQUINAS</p><asp:TextBox runat="server" ID="quantidade" placeholder="QUANTIDADE DE MÁQUINAS" CssClass="text" ></asp:TextBox>

            <p>MODELO</p><asp:TextBox runat="server" ID="modelo" placeholder="MODELO" CssClass="text"></asp:TextBox>

            <br />
            <br />       
                <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Add_Click"/>
                <asp:Button runat="server" ID="cancel" Text="Cancelar" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx"/>


        </div>
    </form>
</body>
</html>
