<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab.WebFormEditLab" %>

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
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="500px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnItemDeleted="DetailsView1_ItemDeleted">
                    <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="equipamento" HeaderText="equipamento" SortExpression="equipamento" />
                        <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="javascript:return ConfirmaExclusao()" Text="Excluir"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                </asp:DetailsView>

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update" DeleteMethod="Delete">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="id" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="Button2" runat="server" Text="VOLTAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx" />
            </div>
        </div>
    </form>
</body>
</html>
