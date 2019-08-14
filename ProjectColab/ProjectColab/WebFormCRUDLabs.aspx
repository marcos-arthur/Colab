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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand" PageSize="15" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID DO LABORATÓRIO" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="NOME DO LABORATÓRIO" SortExpression="nome" />
                    <asp:BoundField DataField="equipamento" HeaderText="EQUIPAMENTO DO LABORATÓRIO" SortExpression="equipamento" />
                    <asp:BoundField DataField="quantidade" HeaderText="QUANTIDADE DE EQUIPAMENTOS" SortExpression="quantidade" />
                    <asp:ButtonField CommandName="Editar" Text="EDITAR" ButtonType="Button"  ControlStyle-CssClass="cancelbtn"/>
                    <asp:ButtonField CommandName="Excluir" Text="EXCLUIR" ButtonType="Button" ControlStyle-CssClass="cancelbtn" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#999999" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#8f3d3d"  Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#8f3d3d"  ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#7a5252"  ForeColor="#333333" />
                <SelectedRowStyle BackColor="#7a5252" Font-Bold="True" ForeColor="#7a5252"  />
                <SortedAscendingCellStyle BackColor="#999999" />
                <SortedAscendingHeaderStyle BackColor="#999999"  />
                <SortedDescendingCellStyle BackColor="#999999" />
                <SortedDescendingHeaderStyle BackColor="#999999" />
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
