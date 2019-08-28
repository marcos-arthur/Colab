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
                <asp:DetailsView ID="DetailsView1" runat="server" Height="40%" Width="90%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" OnItemDeleted="DetailsView1_ItemDeleted" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="WHITE" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
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
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>

                <asp:DetailsView ID="DetailsView2" Height="40%" Width="90%" runat="server"  AutoGenerateRows="False" DataSourceID="ObjectDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="laboratorio_id" HeaderText="laboratorio_id" SortExpression="laboratorio_id" />
                        <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                        <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>

                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Equipamento" SelectMethod="Select" TypeName="ProjectColab.DAL.DALEquipamento" UpdateMethod="Insert">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>

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
