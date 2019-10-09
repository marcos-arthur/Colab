﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterBolsista.Master" AutoEventWireup="true" CodeBehind="IndexBolsista.aspx.cs" Inherits="ProjectColab.IndexBolsista" %>
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
                         <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn" PostBackUrl="~/3-Bolsista/WebFormCRUDChamadoBolsista.aspx"/>
                      </div>
                  </div>
                  <div class="column side">
                      <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "noCount")%></a>
                         <asp:Button runat="server" ID="Button2" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button1_Click"/>
                      </div>  
                  </div>
                  <div class="column side">
                      <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "myCount")%></a>
                         <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button5_Click" />
                      </div>   
                  </div>
                  <div class="column middle" >
                      <div class="content">
                         <div class="indicador"><a class="colorfix titulo">TUTORIAIS</a></div>
                         <asp:Button runat="server" ID="Button3" Text="VISUALIZAR TUTORIAIS" CssClass="btn" PostBackUrl="~/3-Bolsista/WebFormCRUDTutorialBolsista.aspx"/>
                      </div>
                  </div>
                <asp:Button runat="server" CssClass="btnPesquisar btn fixed" Text="+" PostBackUrl="~//3-Bolsista/WebFormAddChamadoBolsista.aspx"/>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>


</asp:Content>
