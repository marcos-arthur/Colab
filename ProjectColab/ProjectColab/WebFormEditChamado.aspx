<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="style.css"/>    
<link rel="stylesheet" type="text/css" href="styleadd.css"/>
<link rel="stylesheet" type="text/css" href="Crudstyle.css"/> 
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
            <asp:DetailsView ID="DetailsView1" runat="server" Height="40%" Width="90%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="resumo" HeaderText="resumo" SortExpression="resumo" />
                    <asp:BoundField DataField="quantidadeeq" HeaderText="quantidadeeq" SortExpression="quantidadeeq" />
                    <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Chamado" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALChamado" UpdateMethod="Select">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
            <div class="mid">
                <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="text"></asp:TextBox>
                <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>
            </div>
            <div class="mid">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="usuario_id" HeaderText="usuario_id" SortExpression="usuario_id" />
                        <asp:BoundField DataField="chamados_id" HeaderText="chamados_id" SortExpression="chamados_id" />
                        <asp:BoundField DataField="restricao" HeaderText="restricao" SortExpression="restricao" />
                        <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                        <asp:BoundField DataField="data_hora" HeaderText="data_hora" SortExpression="data_hora" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

        </div>
    </form>
</body>
</html>
