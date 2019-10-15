    <%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDChamado.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" >      
        <div class="column middle teste">
            <div class="indicador"><a class="colorfix titulo"><i class="fa fa-bell"></i>CHAMADOS</a></div>            
            
            <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS FECHADOS" CssClass="btn" PostBackUrl="~/2-Servidor/WebFormChamadosFechadosServidor.aspx"/>
            
            <!-- Busca -->
            <div class="content top">            
                <div class="search">            
                    <i class="fa fa-search"></i><asp:TextBox ID="TextBox1" runat="server" CssClass="searchbar" placeholder="BUSCA PELO ID DO CHAMADO"></asp:TextBox>
                    <asp:Button runat="server" Text="Busca" ID="search1" CssClass="btn small" OnClick="search_Click"/>
                    <asp:LinkButton runat="server" ID="search" OnClick="search_Click" text="Busca"></asp:LinkButton>
                </div>
            </div>
            
            <!--REPEATER PARA VISUALIZAR OS CHAMADOS-->
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADO #<%# DataBinder.Eval(Container.DataItem, "id")%></a><asp:HyperLink ID="status"     CssClass="text status" runat="server"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%></asp:HyperLink></div>
                            
                            <div class="rowChamado titleFix">
                                <a class="textEditChamado">RESUMO DO CHAMADO:</a>                               
                                <a class="textEditChamado nomeChamado borderFix"> <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            </div>                                     
                            
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Aberto por </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>
                            <!-- Nome do laboratorio-->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Laboratório </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a></div>

                            <!-- Usuario atribuido -->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Atribuido a </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>

                            <!-- Quantidade de equipamentos -->
                            <div class="rowChamado rowFix"><a class="textEditChamado">Quantidade de equipamentos </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div>

                            <!-- Data de abertura -->
                            <div class="rowChamado rowFix"><a class="textEditChamado">Data de abertura</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>

                            <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> VISUALIZAR CHAMADO</asp:LinkButton></div> 
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" TypeName="ProjectColab.DAL.DALChamado" >
                </asp:ObjectDataSource>
            </div>
            <!--FIM DO REPEATER-->
        </div>            

</asp:Content>