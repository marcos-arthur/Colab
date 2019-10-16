<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDEquipamento.aspx.cs" Inherits="ProjectColab.WebFormCRUDEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">        
        <div class="column middle teste">  
            <div class="indicador"><a class="colorfix titulo"><i class="fa fa-keyboard-o"></i>EQUIPAMENTOS</a></div>              

            <!-- Busca -->
            <div class="content top">            
                <div class="search">            
                    <i class="fa fa-search"></i><asp:TextBox ID="searchBox" runat="server" CssClass="searchbar" placeholder="PESQUISAR MODELO"></asp:TextBox>
                    <asp:Button runat="server" Text="Buscar" ID="search" CssClass="btn" OnClick="search_Click"/>
                </div>    
            </div>

            <!--REPEATER PARA VISUALIZAR OS Equipamentos-->            
            <div class="content">
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR EQUIPAMENTO" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddEquipamento.aspx" />
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" >
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-keyboard-o"></i> <a class="text"><%# DataBinder.Eval(Container.DataItem, "modelo")%></a></div>
                            <!--<a class="text"> <%# DataBinder.Eval(Container.DataItem, "modelo")%> </a>-->
                            <a class="text">Laboratório <%# DataBinder.Eval(Container.DataItem, "laboratorio_nome")%> </a>
                            <a class="text">Quantidade: <%# DataBinder.Eval(Container.DataItem, "quantidade")%> </a>
                            <!-- EXCLUIR EQUIPAMENTO <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALEquipamento" SelectMethod="SelectAll" >
                </asp:ObjectDataSource>
            </div>            
        </div>

</asp:Content>
