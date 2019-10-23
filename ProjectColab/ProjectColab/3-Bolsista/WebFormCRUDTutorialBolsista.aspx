<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormCRUDTutorialBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormCRUDTutorialBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="column middle teste">  
            <div class="indicador"><a class="title">TUTORIAIS</a></div>                 
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->

            <div class="content">  
                <div class="searchplace">                  
                        <asp:Button runat="server" ID="Button1" Text="+ TUTORIAL" CssClass="btnsearch bg ch" PostBackUrl="~//3-Bolsista/WebFormAddTutorialBolsista.aspx"/>                                        
                </div>
            </div>   

            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-book"></i><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado">Enviado por: </a> <a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%> </a></div>

                            <div class="bot">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Baixar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> BAIXAR TUTORIAL</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoopen" CommandName="Deletar" CommandArgument='<%#Eval("id") + ";"%>'><i class="fa fa-external-link-square"></i>DELETAR TUTORIAL</asp:LinkButton>                  
                        </div>                          
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllStatus2" TypeName="ProjectColab.DAL.DALTutorial"></asp:ObjectDataSource>
            </div>            
        </div>
        
</asp:Content>