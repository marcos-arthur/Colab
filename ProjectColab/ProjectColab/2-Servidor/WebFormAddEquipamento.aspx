<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddEquipamento.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormAddEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
            <div class="column middle">
                <div class="menuadicao">

                    <div class="tag"><a>LABORATÓRIO</a></div>
                    <asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource3" DataTextField="nome" DataValueField="id"></asp:DropDownList>
                    <asp:Label ID="MsgErroDropLab" runat="server" ForeColor="Red"></asp:Label>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>

                    <div class="tag"><a>MODELO DE EQUIPAMENTO</a></div>
                    <asp:TextBox ID="modelo" runat="server" Placeholder="DIGITE AQUI O MODELO DO EQUIPAMENTO" CssClass="inputtext"></asp:TextBox>
                    <asp:Label ID="MsgErroModelo" runat="server" ForeColor="Red"></asp:Label>
                
                    <div class="tag"><a>QUANTIDADE</a></div>
                    <asp:TextBox ID="quant" runat="server" Placeholder="DIGITE AQUI O MODELO DO EQUIPAMENTO" CssClass="inputtext"></asp:TextBox>                
                    <asp:Label ID="MsgErroQuant" runat="server" ForeColor="Red"></asp:Label>   
                
                
                    <br />
                    <br />
                    <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                    <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
                </div>
                                  
            </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
