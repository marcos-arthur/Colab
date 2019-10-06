﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row">
        <div class="column middle">

                <asp:TextBox ID="status" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="id" runat="server" style="display:none" CssClass="text"></asp:TextBox>

                <p>RESUMO DO PROBLEMA</p>
                <asp:TextBox ID="resumo" runat="server" CssClass="text"></asp:TextBox>             
                
                <p>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</p><asp:TextBox ID="quantidadeeq" runat="server" type="number" CssClass="text"></asp:TextBox>
                
                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ADICIONAR"   CssClass="btn" OnClick="add_Click1"/>
                <asp:Button ID="Button1" runat="server" Text="CANCELAR"   CssClass="btn" OnClick="Button1_Click"/>  
            </div>

    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="column side">
                <div class="content2">
                    <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                    <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                    <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" />
                </div>
            </div>
            <div class="column side">
                <div class="content2">
                    <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                    <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                    <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    </div>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
     </asp:ObjectDataSource>
</asp:Content>
