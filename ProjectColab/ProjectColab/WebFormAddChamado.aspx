<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="mid">
                <asp:TextBox ID="status" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="id" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <p>RESUMO DO PROBLEMA</p><asp:TextBox ID="resumo" runat="server" CssClass="text"></asp:TextBox>
                <p>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</p><asp:TextBox ID="quantidadeeq" runat="server" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="data" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ADICIONAR"   CssClass="cancelbtn" OnClick="add_Click1"/>
                <asp:Button ID="Button1" runat="server" Text="CANCELAR"   CssClass="cancelbtn" OnClick="Button1_Click"/>
            </div>       
        </div>
</asp:Content>
