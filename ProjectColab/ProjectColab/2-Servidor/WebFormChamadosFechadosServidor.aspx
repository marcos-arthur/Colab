<%@ Page Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormChamadosFechadosServidor.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormChamadosFechadosServidor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        
        <div class="column middle teste"> 
            <div class="indicador"><a class="title">CHAMADOS FECHADOS</a></div> 

            <!-- Busca -->  
            <div class="content">  
                <div class="searchplace">
                        <asp:LinkButton ID="Button2" runat="server" CssClass="btnsearch bg ch" PostBackUrl="~/2-Servidor/WebFormCRUDChamado.aspx" ><i class=""></i> VOLTAR</asp:LinkButton>                                           
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="inputsearch" placeholder="PESQUISAR CHAMADO (RESUMO)"></asp:TextBox>    
                        <asp:LinkButton ID="search1" runat="server" CssClass="btnsearch" OnClick="search_Click" >PESQUISAR</asp:LinkButton>                    
                </div>
            </div>

            <div class="content">
                <!--REPEATER PARA VISUALIZAR OS CHAMADOS FECHADOS-->
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">                           
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="textEditChamado nomeChamado">CHAMADO #<%# DataBinder.Eval(Container.DataItem, "id")%></a><asp:HyperLink ID="status"     CssClass="text status" runat="server"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%></asp:HyperLink></div>                            
                            
                            <!-- Resumo do chamado -->
                            <div class="rowChamado titleFix">
                                <a class="textEditChamado">RESUMO DO CHAMADO:</a>                               
                                <a class="textEditChamado nomeChamado borderFix"> <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            </div>                                     
                            
                            <!-- Usuário que abriu -->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Aberto por: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>
                            
                            <!-- Categoria -->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Categoria: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "categoriaNome")%> </a></div>                                                      

                            <!--Tipo do chamado-->
                            <div class="rowChamado"><a class="textEditChamado"> Tipo </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tipoNome")%> </a></div>

                            <!-- Nome da sala-->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> SALA: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomesala")%> </a></div>

                            <!-- Usuario atribuido -->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Atribuido a: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>

                            <!-- Quantidade de equipamentos -->
                            <div class="rowChamado rowFix"><a class="textEditChamado">Quantidade de equipamentos:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div>

                            <!-- Data de abertura -->
                            <div class="rowChamado rowFix"><a class="textEditChamado">Data de abertura:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>

                            <div class="bot">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Reabrir" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'><i class="fa fa-external-link-square"></i>REABRIR CHAMADO</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectClose" TypeName="ProjectColab.DAL.DALChamado"></asp:ObjectDataSource>
            </div>
        </div>  
</asp:Content>