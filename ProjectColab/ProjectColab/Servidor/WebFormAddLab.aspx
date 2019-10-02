﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormAddLab.aspx.cs" Inherits="ProjectColab.WebFormAddLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          
    <div class="row">
            <div class="column middle">
                <!-- LABEL de erros -->
                <asp:Label ID="MsgErro" runat="server" ForeColor="Red"></asp:Label> <!-- COLOCAR UMA QUEBRA DE LINHA VIA .CSS -->
            
            
            

                <p style="display:none">CÓDIGO DO LABORATÓRIO</p><asp:TextBox runat="server" ID="TextBox1" placeholder="INDISPONIVEL" CssClass="text" ReadOnly="True" Enabled="False" style="display:none"></asp:TextBox>
            
                <p>NOME DO LABORATÓRIO</p><asp:TextBox runat="server" ID="nome" placeholder="NOME DO LABORATÓRIO" CssClass="text"></asp:TextBox>
        
                <br />
                <br />       
                <asp:Button ID="Buuton" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Add_Click"/>
                <asp:Button runat="server" ID="Button4" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx"/>

                <asp:Label ID="MsgErroDropLab" runat="server" ForeColor="Red"></asp:Label>
                <asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>
            
                <asp:Label ID="MsgErroModelo" runat="server" ForeColor="Red"></asp:Label>
                <p>MODELO DE EQUIPAMENTO</p><asp:TextBox ID="modelo" runat="server" CssClass="text"></asp:TextBox>
            
                <asp:Label ID="MsgErroQuant" runat="server" ForeColor="Red"></asp:Label>
                <p>QUANTIDADE</p><asp:TextBox ID="quant" runat="server" CssClass="text"></asp:TextBox>
            
                <br />
                <br />
                <asp:Button ID="Button5" runat="server" Text="ADICIONAR" CssClass="cancelbtn" OnClick="Button2_Click"  />
                <asp:Button ID="Button6" runat="server" Text="CANCELAR" CssClass="cancelbtn" OnClick="Button1_Click"  />
            </div>
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                        <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                        <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx" />
                    </div>
                </div>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                        <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                        <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>
    </div>
</asp:Content>