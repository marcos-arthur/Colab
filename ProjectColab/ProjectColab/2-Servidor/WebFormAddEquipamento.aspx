<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddEquipamento.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormAddEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="column middle">
                <div class="menuAdd">

                    <i class="fa fa-desktop"></i><asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource3" DataTextField="nome" DataValueField="id" CssClass="inputsearch2 inputToAdd"></asp:DropDownList>
                    <asp:Label ID="MsgErroDropSalas" runat="server" ForeColor="Red"></asp:Label>


                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DataObjectTypeName="ProjectColab.Modelo.Salas" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALSalas" UpdateMethod="Update"></asp:ObjectDataSource>

                    <i class="fa fa-desktop"></i><asp:TextBox ID="modelo" runat="server" Placeholder="DIGITE AQUI O MODELO DO EQUIPAMENTO" CssClass="inputsearch2 inputToAdd"></asp:TextBox>
                    <asp:Label ID="MsgErroModelo" runat="server" ForeColor="Red"></asp:Label>
                
                    <i class="fa fa-desktop"></i><asp:TextBox ID="quant" runat="server" Placeholder="QUANTIDADE DE EQUIPAMENTOS" CssClass="inputsearch2 inputToAdd"></asp:TextBox>                
                    <asp:Label ID="MsgErroQuant" runat="server" ForeColor="Red"></asp:Label>   
                
                    <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd btnToAdd"  OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                    <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd btnToAdd"  OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
                </div>
                                  
            </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
