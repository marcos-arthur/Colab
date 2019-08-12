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
	        <div class="logo"><a href="">COLAB</a></div>
	        <div class="container">
		        <div class="box">
			        <a href="">DASHBOARD</a>
			        <a href="">TUTORIAIS</a>
			        <a href="">REQUISIÇÕES</a>
			        <a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a>
		        </div>
		        <div class="box2">
			        <a href="">USUARIO</a>
			        <a href="WebFormAddLab.aspx">+</a>
		        </div>		
	        </div>
        <div class="mid">
            <div>
            <asp:hyperlink ID="inserir" NavigateUrl="~//WebFormAddLab.aspx" runat="server"  Text="ADICIONAR LABORATÓRIO" CssClass="addbtn"></asp:hyperlink>            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Codigo" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="Nome do Laboratório" SortExpression="nome" />
                    <asp:BoundField DataField="equipamento" HeaderText="Tipo de Equipamentos" SortExpression="equipamento" />
                    <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade" />
                </Columns>
            </asp:GridView>    
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
        </div></div>
        
    </form>
</body>
</html>
