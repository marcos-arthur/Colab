<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="ProjectColab.Index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="row">
                  <div class="column middle" >
                      <div class="content">
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <a class="title">CHAMADOS</a>
                         <asp:Button runat="server" ID="Button1" Text="ABRIR CHAMADOS" CssClass="btn" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>
                      <div class="content">
                         <a class="title">TUTORIAIS</a>
                         <asp:Button runat="server" ID="Button3" Text="ABRIR TUTORIAIS" CssClass="btn" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>
                  </div>


                  <div class="column side">
                      <div class="content2">
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a>
                         <asp:Button runat="server" ID="Button2" Text="ABRIR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>  
                  </div>
            </div>
            <div class="rigth-chamados"><div class="content2"> <a> <%# DataBinder.Eval(Container.DataItem, "count")%></a> <a>CHAMDOS</a><a class="atencao"> ATRIBUIDOS A MIM</a></div></div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>


</asp:Content>
