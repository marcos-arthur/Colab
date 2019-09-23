<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="ProjectColab.Index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="chamados"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>Chamdos</a></div>
            <div class="chamados2"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>Chamdos</a></div>
            <div class="chamados2"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>Chamdos</a></div>
        </ItemTemplate>
    </asp:Repeater>

</div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>


</asp:Content>
