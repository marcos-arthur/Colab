<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterBolsista.Master" AutoEventWireup="true" CodeBehind="IndexBolsista.aspx.cs" Inherits="ProjectColab.IndexBolsista" %>
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
                        <div class="bot"><asp:Button runat="server" ID="Button1" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//3-Bolsista/WebFormCRUDChamadoBolsista.aspx" /></div> 
                    </div>
                    <div class="article">
                        <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADOS FECHADOS</a></div>
                        <a class="first"> <%# DataBinder.Eval(Container.DataItem, "countFechado")%></a>
                        <div class="bot"><asp:Button runat="server" ID="Button2" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//3-Bolsista/WebFormChamadosFechadosBolsista.aspx" /></div> 
                    </div>
                </div>         
                  
                <asp:Button runat="server" CssClass="btnPesquisar btn fixed" Text="+" PostBackUrl="~//3-Bolsista/WebFormAddChamadoBolsista.aspx"/>
            
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamadoDash" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Repeater runat="server" ID="Repeater2" DataSourceID="ObjectDataSource2">
        <ItemTemplate>
            <div class="column middle" >
                      <div class="content">
                          <div class="article">                                
                              <div class="iconchamado"><i class="fa fa-book"></i> <a class="text chamadoid">TUTORIAIS DISPONÍVEIS</a></div>
                                <a class="first"> <%# DataBinder.Eval(Container.DataItem, "tutoCount")%></a>
                              <div class="bot"><asp:Button runat="server" ID="Button5" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//3-Bolsista/WebFormCRUDTutorialBolsistta.aspx" /></div> 
                          </div>
                      </div>   
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelecTutoAll" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>
</asp:Content>