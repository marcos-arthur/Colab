<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">        
        <div class="column middle teste">  
            <div class="indicador"><a class="colorfix titulo"><i class="fa fa-bell"></i>LABORATÓRIOS</a></div>              
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->            
            <div class="content">
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddLab.aspx" />
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i><a class="text">Laboratório #<%# DataBinder.Eval(Container.DataItem, "nome")%></a></div>
                            <div class="bot">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectStatus1" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
            </div>            
        </div>
        
</asp:Content>