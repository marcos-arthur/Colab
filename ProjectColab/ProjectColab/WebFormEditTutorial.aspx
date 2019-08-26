<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditTutorial.aspx.cs" Inherits="ProjectColab.WebFormEditTutorial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/> 
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
<script src="script.js"></script>
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
            <div class="mid">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1">
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                        <asp:BoundField DataField="arquivo" HeaderText="arquivo" SortExpression="arquivo" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Tutorial" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALTutorial" UpdateMethod="Update"></asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>
