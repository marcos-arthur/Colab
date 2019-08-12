<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>

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
		        <div class="box">
			        <a href="">DASHBOARD</a>
			        <a href="">TUTORIAIS</a>
			        <a href="">REQUISIÇÕES</a>
			        <a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a>
		        </div>
        <div>
            <asp:hyperlink ID="inserir" NavigateUrl="~//WebFormAddLab.aspx" runat="server"  Text="ADICIONAR LABORATÓRIO" CssClass="addbtn"></asp:hyperlink>            
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>    
        </div>
    </form>
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</body>
</html>
