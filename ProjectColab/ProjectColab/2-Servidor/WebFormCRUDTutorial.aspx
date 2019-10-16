<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDTutorial.aspx.cs" Inherits="ProjectColab.WebFormCRUDTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle teste">     
            <div class="indicador"><a class="colorfix titulo"><i class="fa fa-book"></i>TUTORIAIS</a></div>          
            
            <!-- Busca -->
            <div class="content top">            
                <div class="search">            
                    <i class="fa fa-search"></i><asp:TextBox ID="searchBox" runat="server" CssClass="searchbar" placeholder="PESQUISAR POR TÍTULO"></asp:TextBox>
                    <asp:Button runat="server" Text="Buscar" ID="search" CssClass="btn" OnClick="search_Click"/>
                </div>    
            </div>

            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx" />
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-book"></i><a class="text"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a></div>
                            <a class="text">Enviado por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%> </a>

                            <div class="bot">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Baixar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> BAIXAR TUTORIAL</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllStatus2" TypeName="ProjectColab.DAL.DALTutorial"></asp:ObjectDataSource>
            </div>
            <asp:Button ID="Button4" runat="server" Text="VER TUTORIAIS SUBMETIDOS" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormTutorialSubmetido.aspx" />
        </div>
             
</asp:Content>