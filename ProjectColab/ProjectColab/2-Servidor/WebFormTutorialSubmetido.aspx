<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterServidor.Master" CodeBehind="WebFormTutorialSubmetido.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormTutorialSubmetido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->
            <div class="indicador"><a class="title">TUTORIAIS EM ANÁLISE</a></div>  
            <div class="menuAddLab"> 
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR TUTORIAL" CssClass="botaoadd btnToAdd lit" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx" />
                <asp:Button ID="Button3" runat="server" Text="VOLTAR" CssClass="botaoadd btnToAdd lit" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx" /> 
            </div>    
    
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-book"></i><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a></div>
                            <div class="rowChamado rowFix"><a class="textEditChamado">Enviado por: </a> <a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%> </a></div>

                            <div class="bot">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoopen" CommandName="Autorizar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> AUTORIZAR TUTORIAL</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoopen" CommandName="Negar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> NEGAR TUTORIAL</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Baixar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> BAIXAR TUTORIAL</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectStatus1" TypeName="ProjectColab.DAL.DALTutorial"></asp:ObjectDataSource>
            </div>            
        </div>
                
</asp:Content>
