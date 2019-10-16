<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterProfessor.Master" AutoEventWireup="true" CodeBehind="IndexProfessor.aspx.cs" Inherits="ProjectColab.IndexProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
                  <div class="column middle" >
                          <div class="indicador"><a class="title">DASHBOARD</a></div>
                      <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADOS ABERTOS</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "countAberto")%></a>
                         <div class="bot"><asp:Button runat="server" ID="Button1" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//4-Professor/WebFormCRUDChamadoProfessor.aspx" /></div> 
                      </div>
                      <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADOS FECHADOS</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "countFechado")%></a>
                         <div class="bot"><asp:Button runat="server" ID="Button2" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//4-Professor/WebFormChamadosFechadosProfessor.aspx" /></div> 
                      </div>
                  </div>         
                <asp:Button runat="server" CssClass="btnPesquisar btn fixed" Text="+" PostBackUrl="~/4-Professor/WebFormAddChamadoProfessor.aspx"/>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamadoDash" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>
</asp:Content>

