<%@ Page Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormChamadosFechadosServidor.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormChamadosFechadosServidor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        
        <div class="column middle teste">
       <!-- <div class="content"> <i class="fa fa-circle-o"></i>
            <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" PostBackUrl="~//2-Servidor/WebFormAddChamado.aspx" ><i class="fa fa-plus"></i> ABRIR CHAMADO</asp:LinkButton>
        </div>-->

 <!--REPEATER PARA VISUALIZAR OS CHAMADOS FECHADOS-->
            <div class="indicador"><a class="title">CHAMADOS FECHADOS</a></div> 
            <div class="content">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                           
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="textEditChamado nomeChamado">CHAMADO #<%# DataBinder.Eval(Container.DataItem, "id")%></a><asp:HyperLink ID="status"     CssClass="text status" runat="server"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%></asp:HyperLink></div>                            
                            
                            <!--Atribuição-->
                            <div class="rowChamado rowFix"><a class="textEditChamado ">Aberto por:</a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>

                            <div class="rowChamado titleFix">
                                <a class="textEditChamado">RESUMO DO CHAMADO:</a>                               
                                <a class="textEditChamado nomeChamado borderFix"> <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            </div>
                            
                            <!--nome do laborátório-->
                            <div class="rowChamado rowFix"><a class="textEditChamado ">Laboratório:</a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a></div>

                            <div class="rowChamado rowFix"><a class="textEditChamado ">Atribuido a:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado ">Quantidade de equipamentos:</a><a class="textEditChamado nomeChamado">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado ">Data:</a><a class="textEditChamado nomeChamado">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
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