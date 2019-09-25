<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="ProjectColab.Index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="container">
            <div class="left-chamados"><div class="content"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>CHAMDOS</a><a class="atencao"> SEM ATRIBUIÇÃO</a> </div></div>
            </div>
            <div class="rigth-chamados"><div class="content2"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>CHAMDOS</a><a class="atencao"> ATRIBUIDOS A MIM</a></div></div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>


</asp:Content>
