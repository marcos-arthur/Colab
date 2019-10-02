<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="Index2.aspx.cs" Inherits="ProjectColab.Index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="row">
                  <div class="column middle" >
                      <div class="content">
                          <div class="indicador"><a class="colorfix titulo">DASHBOARD</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <a class="title">CHAMADOS</a>
                         <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>
                  </div>
                  <div class="column side">
                      <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <asp:Button runat="server" ID="Button2" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>  
                  </div>
                  <div class="column side">
                      <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>  
                  </div>
                  <div class="column middle" >
                      <div class="content">
                         <div class="indicador"><a class="colorfix titulo">TUTORIAIS</a></div>
                         <asp:Button runat="server" ID="Button3" Text="VISUALIZAR TUTORIAIS" CssClass="btn" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>
                  </div>
                  <div class="column middle">
                      <div class="content">
                         <div class="indicador"><a class="colorfix titulo">LABORATÓRIOS</a></div>
                         <asp:Button runat="server" ID="Button4" Text="VISUALIZAR LABORATÓRIOS" CssClass="btn" PostBackUrl="~/WebFormCRUDChamado.aspx"/>
                      </div>
                  </div>


                <button class="btnPesquisar btn fixed">+</button>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>


</asp:Content>
