<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/>  
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
    <title>ABRIR CHAMADO</title>
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
            <div class="mid">
                <asp:TextBox ID="status" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="id" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <p>RESUMO DO PROBLEMA</p><asp:TextBox ID="resumo" runat="server" CssClass="text"></asp:TextBox>
                <p>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</p><asp:TextBox ID="quantidadeeq" runat="server" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="data" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ADICIONAR"   CssClass="cancelbtn" OnClick="add_Click1"/>
                <asp:Button ID="Button1" runat="server" Text="CANCELAR"   CssClass="cancelbtn"/>
            </div>       
        </div>
    </form>
</body>
</html>
