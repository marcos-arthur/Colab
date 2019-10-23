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
                            <!--Nome do usuario-->
                            <div class="rowChamado"><a class="textEditChamado">Aberto por </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>

                            <!--Usuario atribuido-->
                            <div class="rowChamado"><a class="textEditChamado"> Atendente </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>
                           
                            <!--Nome da sala-->
                            <div class="rowChamado"><a class="textEditChamado"> Sala </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomesala")%> </a></div>                            

                            <!--Categoria do chamado-->
                            <div class="rowChamado"><a class="textEditChamado"> Categoria </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "categoriaNome")%> </a></div>                            

                            <!--Tipo do chamado-->
                            <div class="rowChamado"><a class="textEditChamado"> Tipo </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tipoNome")%> </a></div>           

                            <!--Resumo do problema-->
                            <div class="rowChamado"><a class="textEditChamado"> Resumo do problema </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
                            <br />-->

                            <!--Quantidade de Equipamento-->
                            <div class="rowChamado"><a class="textEditChamado"> Quantidade de equipamentos </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div> 
                            
                            <!--Data-->
                            <div class="rowChamado"><a class="textEditChamado"> Data de abertura </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
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
