<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditTutorial.aspx.cs" Inherits="ProjectColab.WebFormEditTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mid">
                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1">
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                        <asp:BoundField DataField="arquivo" HeaderText="arquivo" SortExpression="arquivo" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Tutorial" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALTutorial" UpdateMethod="Update"></asp:ObjectDataSource>
            </div>
</asp:Content>