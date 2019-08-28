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
            <li class="li1"><a href="WebFormCRUDChamado.aspx">DASHBOARD</a></li>
            <li class="li1"><a href="">TUTORIAIS</a></li>
            <li class="li1"><a href="">REQUISIÇÕES</a></li>
            <li class="li1"><a href="WebFormCRUDLabs.aspx">LABORATÓRIOS</a></li>
            <li class="li2"><a href="WebFormAddLab.aspx">+</a></li>
            <li class="li2"><a href="">USUARIO</a></li>
        </ul>



        <div class="mid">
            <p style="display:none">CÓDIGO DO LABORATÓRIO</p><asp:TextBox runat="server" ID="id" placeholder="INDISPONIVEL" CssClass="text" ReadOnly="True" Enabled="False" style="display:none"></asp:TextBox>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
            <p>NOME DO LABORATÓRIO</p><asp:TextBox runat="server" ID="nome" placeholder="NOME DO LABORATÓRIO" CssClass="text"></asp:TextBox>

            <br />
            <br />       
                <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Add_Click"/>
                <asp:Button runat="server" ID="cancel" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx"/>
        </div>
       <div class="mid">
            <asp:DropDownList ID="idlab" runat="server" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id"></asp:DropDownList>
           <p>MODELO</p><asp:TextBox ID="modelo" runat="server" CssClass="text"></asp:TextBox>
           <p>QUANTIDADE</p><asp:TextBox ID="quant" runat="server" CssClass="text"></asp:TextBox>
           <br />
           <br />
           <asp:Button ID="Button2" runat="server" Text="Button" CssClass="cancelbtn" OnClick="Button2_Click"  />
           <asp:Button ID="Button1" runat="server" Text="Button" CssClass="cancelbtn"  />

       </div> 
    </form>
</body>
</html>
