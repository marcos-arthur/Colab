<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormCRUDTutorialBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormCRUDTutorialBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

        <div class="column middle teste">          
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~//3-Bolsista/WebFormAddTutorialBolsista.aspx" />
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i><a class="text"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a></div>
                            <a class="text">Enviado por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%> </a>

                            <div class="bot">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Baixar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>'><i class="fa fa-external-link-square"></i> BAIXAR TUTORIAL</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllStatus2" TypeName="ProjectColab.DAL.DALTutorial"></asp:ObjectDataSource>
            </div>            
        </div>
        
</asp:Content>