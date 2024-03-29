﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormCRUDChamadoBolsista.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamadoBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" >      
        <div class="column middle teste">
            <div class="indicador"><a class="title">CHAMADOS</a></div>            
           
            
            <!-- Busca -->  
            <div class="content">  
                <div class="searchplace">
                        <asp:LinkButton ID="Button2" runat="server" CssClass="btnsearch bg ch" PostBackUrl="~/3-Bolsista/WebFormAddChamadoBolsista.aspx" ><i class=" fa fa-plus"></i> ABRIR CHAMADO</asp:LinkButton>                                           
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="inputsearch" placeholder="PESQUISAR CHAMADO (RESUMO)"></asp:TextBox>    
                        <asp:LinkButton ID="search1" runat="server" CssClass="btnsearch" OnClick="search_Click" >PESQUISAR</asp:LinkButton>                    
                </div>
            </div>
            
            <!--REPEATER PARA VISUALIZAR OS CHAMADOS-->
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            
                            <!-- ID do chamado -->
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="textEditChamado nomeChamado">CHAMADO #<%# DataBinder.Eval(Container.DataItem, "id")%></a><asp:HyperLink ID="status"     CssClass="text status" runat="server"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%></asp:HyperLink></div>
                            
                            <!-- Resumo do chamado -->
                            <div class="rowChamado titleFix">
                                <a class="textEditChamado">RESUMO DO CHAMADO:</a>                               
                                <a class="textEditChamado nomeChamado borderFix"> <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            </div>                                     
                            
                            <!-- Categoria -->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Categoria: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "categoriaNome")%> </a></div>                                                      

                            <!--Tipo do chamado-->
                            <div class="rowChamado"><a class="textEditChamado"> Tipo </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tipoNome")%> </a></div>

                            <!-- Nome da sala-->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> SALA: </a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomesala")%> </a></div>                            

                            <!-- Data de abertura -->
                            <div class="rowChamado rowFix"><a class="textEditChamado">Data de abertura:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
                           
                            
                           
                            <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link"></i> VISUALIZAR CHAMADO</asp:LinkButton></div> 
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" TypeName="ProjectColab.DAL.DALChamado" SelectMethod="Select">
                </asp:ObjectDataSource>
            </div>
        </div>
                <div class="column side">
                    <div class="content2">
                            <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS FECHADOS" CssClass="btn" PostBackUrl="~/3-Bolsista/WebFormChamadosFechadosBolsista.aspx"/> 
                        </div>  
                    </div>
            <!--FIM DO REPEATER-->          

</asp:Content>