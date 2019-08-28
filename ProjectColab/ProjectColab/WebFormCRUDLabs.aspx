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

             <asp:GridView ID="GridView1"  Height="20%" Width="90%" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="ID DO LABORÁTORIO" SortExpression="id" />
                     <asp:BoundField DataField="nome" HeaderText="NOME DO LABORATÓRIO" SortExpression="nome" />
                     <asp:ButtonField CommandName="EDITAR" Text="EDITAR" ControlStyle-CssClass =" tablebtn2" ButtonType="Button" >
<ControlStyle CssClass=" tablebtn2"></ControlStyle>
                     </asp:ButtonField>
                     <asp:ButtonField CommandName="EXCLUIR" Text="EXCLUIR"  ControlStyle-CssClass =" tablebtn2" ButtonType="Button">
<ControlStyle CssClass=" tablebtn2"></ControlStyle>
                     </asp:ButtonField>
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="WHITE" HorizontalAlign="Center"/>
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>


             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>


             <asp:GridView ID="GridView2" runat="server" Height="20%" Width="90%" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="ID DO EQUIPAMENTO" SortExpression="id" />
                     <asp:BoundField DataField="laboratorio_id" HeaderText="ID DO LABORATÓRIO" SortExpression="laboratorio_id" />
                     <asp:BoundField DataField="modelo" HeaderText="MODELO DO EQUIPAMENTO" SortExpression="modelo" />
                     <asp:BoundField DataField="quantidade" HeaderText="QUANTIDADE DE EQUIPAMENTOS" SortExpression="quantidade" />
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="white" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALEquipamento"></asp:ObjectDataSource>

        </div>
         <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddLab.aspx" />  
    </div>          
    </form>
</body>
</html>
