<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDEquipamento.aspx.cs" Inherits="ProjectColab.WebFormCRUDEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">        
        <div class="column middle teste">  
            <div class="indicador"><a class="title">EQUIPAMENTOS</a></div>              


            <!-- Busca -->  
            <div class="content">  
                <div class="searchplace">       
                    <asp:Button ID="Button2" runat="server" Text="+ EQUIPAMENTO" CssClass="btnsearch bg ch" PostBackUrl="~//2-Servidor/WebFormAddEquipamento.aspx" />                    
                    <i class="fa fa-search"></i>
                    <asp:TextBox ID="searchBox" runat="server" CssClass="inputsearch" placeholder="PESQUISAR MODELO"></asp:TextBox>
                    <asp:Button runat="server" Text="Buscar" ID="Button3" CssClass="btnsearch" OnClick="search_Click"/>                 
                </div>
            </div>

            <!--REPEATER PARA VISUALIZAR OS Equipamentos-->            
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" >
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-keyboard-o"></i> <a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "modelo")%></a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado">Laboratório</a> <a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "laboratorio_nome")%> </a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado">Quantidade:</a><a class="text"><%# DataBinder.Eval(Container.DataItem, "quantidade")%> </a></div>
                            <!-- EXCLUIR EQUIPAMENTO <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALEquipamento" SelectMethod="SelectAll" >
                </asp:ObjectDataSource>
            </div>            
        </div>

</asp:Content>
