<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>

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
            <div>   
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" OnRowCommand="GridView1_RowCommand" PageSize="15" >
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="equipamento" HeaderText="equipamento" SortExpression="equipamento" />
                    <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                    <asp:ButtonField CommandName="Editar" Text="Editar" />
                    <asp:ButtonField CommandName="Excluir" Text="Excluir" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>    
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" DeleteMethod="Delete" UpdateMethod="Update"></asp:ObjectDataSource>
        </div> 

            <!--
            <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    nome:
                    <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                    <br />
                    equipamento:
                    <asp:Label ID="equipamentoLabel" runat="server" Text='<%# Eval("equipamento") %>' />
                    <br />
                    quantidade:
                    <asp:Label ID="quantidadeLabel" runat="server" Text='<%# Eval("quantidade") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList> -->
            
            
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="cancelbtn" PostBackUrl="~/WebFormAddLab.aspx" />  


        </div>
                   
    </form>
</body>
</html>
