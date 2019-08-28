<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/> 
<link rel="stylesheet" type="text/css" href="styleadd.css"/> 
<link rel="stylesheet" type="text/css" href="Crudstyle.css"/> 
<script src="script.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
         <div class="sec-mid">
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" DeleteMethod="Delete" UpdateMethod="Update"></asp:ObjectDataSource>

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="ObjectDataSource3" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand1">
                    <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#8f3d3d"  Font-Bold="True" ForeColor="White" CssClass="header"/>
                <PagerStyle BackColor="#8f3d3d"  ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="white" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"  />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1"  />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                         <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="EDITAR" Text="EDITAR" ControlStyle-CssClass="tablebtn" >
<ControlStyle CssClass="tablebtn"></ControlStyle>
                             </asp:ButtonField>
                        <asp:ButtonField Text="EXCLUIR" ButtonType="Button" CommandName="EXCLUIR" ControlStyle-CssClass="tablebtn" >
<ControlStyle CssClass="tablebtn"></ControlStyle>
                             </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectPublishers" TypeName="ProjectColab.DAL.DALConsulta" DataObjectTypeName="ProjectColab.Modelo.Equipamento" UpdateMethod="Update"></asp:ObjectDataSource>
            

        </div>
         <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddLab.aspx" />  
    </div>          
    </form>
</body>
</html>
