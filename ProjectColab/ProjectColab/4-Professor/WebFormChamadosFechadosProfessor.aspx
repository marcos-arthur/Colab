<%@ Page Language="C#" MasterPageFile="~/PageMasterProfessor.Master" AutoEventWireup="true" CodeBehind="WebFormChamadosFechadosProfessor.aspx.cs" Inherits="ProjectColab._4_Professor.WebFormChamadosFechadosProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        
        <div class="column middle teste">
       <!-- <div class="content"> <i class="fa fa-circle-o"></i>
            <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" PostBackUrl="~//2-Servidor/WebFormAddChamado.aspx" ><i class="fa fa-plus"></i> ABRIR CHAMADO</asp:LinkButton>
        </div>-->

 <!--REPEATER PARA VISUALIZAR OS CHAMADOS FECHADOS-->
            <div class="content">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            
                            <!-- ID do chamado -->
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

                            <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link"></i> VISUALIZAR CHAMADO</asp:LinkButton></div> 
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
               <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectCloseProf" TypeName="ProjectColab.DAL.DALChamado">
                   <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="idusuario" Type="string" />
                    </SelectParameters>
               </asp:ObjectDataSource>
            </div>
        </div>  
</asp:Content>
