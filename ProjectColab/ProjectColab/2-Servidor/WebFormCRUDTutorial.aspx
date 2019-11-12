<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDTutorial.aspx.cs" Inherits="ProjectColab.WebFormCRUDTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle teste">     
            <div class="indicador"><a class="title">TUTORIAIS</a></div>          
            
            <!-- Busca -->
            <div class="content">  
                <div class="searchplace">                  
                    <asp:Button runat="server" ID="Button1" Text="+ TUTORIAL" CssClass="btnsearch bg ch" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx"/>                      
                    <i class="fa fa-search"></i>

                    <asp:DropDownList runat="server" ID="dropAssuntos" DataSourceID="ObjectDataSource3" DataTextField="titulo" DataValueField="id">
                    </asp:DropDownList>

                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DAOAssunto"></asp:ObjectDataSource>
                    <asp:TextBox ID="searchBox" runat="server" CssClass="inputsearch" placeholder="PESQUISAR POR TÍTULO"></asp:TextBox> 
                    <asp:Button runat="server" Text="PESQUISAR" ID="search" CssClass="btnsearch" OnClick="search_Click"/>                       
                </div>
            </div>   

            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->
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



        <div class="column side">
            <div class="content2">
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <div class="indicador"><a class="sub-title">TUTORIAIS EM ANÁLISE</a></div>
                        <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "tutoCountAnalise")%></a>
                        <asp:Button runat="server" ID="Button7" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~/2-Servidor/WebFormTutorialSubmetido.aspx"/>                                   
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelecTutoAll" TypeName="ProjectColab.DAL.DALConsulta">
                </asp:ObjectDataSource>
            </div>  
        </div>        
</asp:Content>