<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="IndexServidor.aspx.cs" Inherits="ProjectColab.IndexServidorTeste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">    
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>            
                  <div class="column middle" >
                      <div class="content">
                          <div class="indicador"><a class="colorfix titulo">DASHBOARD</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "count")%></a>
                         <a class="title">CHAMADOS</a>
                         <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" />
                      </div>
                  </div>                                             
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Repeater runat="server" ID="Repeater2" DataSourceID="ObjectDataSource2">
        <ItemTemplate>
            <div class="column middle" >
                      <div class="content">
                         <div class="indicador"><a class="colorfix titulo">TUTORIAIS</a></div>
                         <asp:Button runat="server" ID="Button3" Text="VISUALIZAR TUTORIAIS" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx" />
                      </div>
                  </div>
                  <div class="column middle">
                      <div class="content">
                         <div class="indicador"><a class="colorfix titulo">LABORATÓRIOS</a></div>
                         <asp:Button runat="server" ID="Button4" Text="VISUALIZAR LABORATÓRIOS" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDLabs.aspx" />
                      </div>
                  </div> 
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>