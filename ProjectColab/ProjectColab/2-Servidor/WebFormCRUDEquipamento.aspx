<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDEquipamento.aspx.cs" Inherits="ProjectColab.WebFormCRUDEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mid">
             <asp:GridView ID="GridView2" runat="server" Height="20%" Width="90%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" DataSourceID="ObjectDataSource1">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                     <asp:BoundField DataField="laboratorio_nome" HeaderText="laboratorio_nome" SortExpression="laboratorio_nome" />
                     <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                     <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
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
             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALEquipamento" DataObjectTypeName="ProjectColab.Modelo.Equipamento" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
             </asp:ObjectDataSource>
</div>
</asp:Content>
