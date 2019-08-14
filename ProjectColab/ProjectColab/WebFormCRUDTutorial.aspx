<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDTutorial.aspx.cs" Inherits="ProjectColab.WebFormCRUDTutorial" %>

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
                <li class="li1"><a href="">DASHBOARD</a></li>
                <li class="li1"><a href="WebFormCRUDTutorial.aspx">TUTORIAIS</a></li>
                <li class="li1"><a href="">REQUISIÇÕES</a></li>
                <li class="li1"><a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a></li>
                <li class="li2"><a href="WebFormAddLab.aspx">+</a></li>
                <li class="li2"><a href="">USUARIO</a></li>
            </ul>
            <div class="mid">
                <div class="tables">
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                             <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                             <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                             <asp:BoundField DataField="arquivo" HeaderText="arquivo" SortExpression="arquivo" />
                         </Columns>
                     </asp:GridView>
                     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Tutorial" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALTutorial" UpdateMethod="Update" DeleteMethod="Delete"></asp:ObjectDataSource>
                </div>


                <asp:Button ID="Button1" runat="server" Text="ADICIONAR TUTORIAL" CssClass="cancelbtn" />
    
            </div>



        </div>
    </form>
</body>
</html>
