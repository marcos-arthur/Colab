<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="IndexAdmin.aspx.cs" Inherits="ProjectColab.IndexAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand" DataKeyNames="id,senha">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="senha" HeaderText="senha" SortExpression="senha" Visible="False" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" /> 
                <asp:CommandField ShowEditButton="True" />
                <asp:ButtonField CommandName="desativar" Text="Desativar" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Usuario" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALUsuario" UpdateMethod="Update"></asp:ObjectDataSource>
    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnRowCommand="GridView2_RowCommand" DataKeyNames="id,senha">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="senha" HeaderText="senha" SortExpression="senha" Visible="False" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" /> 
                <asp:ButtonField CommandName="ativar" Text="Ativar" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAllStatus2" TypeName="ProjectColab.DAL.DALUsuario"></asp:ObjectDataSource>
        </div>  
    </div>      
       
</asp:Content>
