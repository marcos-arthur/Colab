<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="column middle">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="editmenu">
                            <div class="iconchamado"><i class=""></i> <a class="title">Chamado #<%# DataBinder.Eval(Container.DataItem, "id")%></a>                          
                            <a class="text status" >Status: <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                            </div> 
    <div class="btnplace">
                <p>ATRIBUIR CHAMADO</p>
                <asp:DropDownList runat="server" ID="atribuidoID" DataSourceID="ObjectDataSource4" DataTextField="nome" DataValueField="id"  CssClass="inputtextDrop"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectBolsistaServidor" TypeName="ProjectColab.DAL.DALUsuario"></asp:ObjectDataSource>

                <asp:Button ID="atribuir" runat="server" CssClass="btnEditChamado" Text="atribuir" OnClick="atribuir_Click"/>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btnEditChamado" CommandName="Fechar" CommandArgument='<%#Eval("id")%>'><i class="fa fa-external-link-square"></i> FECHAR CHAMADO</asp:LinkButton>
        </div>   
                            <!--Nome do usuario-->
                            <div class="rowChamado"><a class="textEditChamado">Aberto por </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>

                            <!--Usuario atribuido-->
                            <div class="rowChamado"><a class="textEditChamado"> Atendente </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>
                           
                            <!--Nome do laboratorio-->
                            <div class="rowChamado"><a class="textEditChamado"> Laboratório </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a></div>
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>

                            <!--Resumo do problema-->
                            <div class="rowChamado"><a class="textEditChamado"> Resumo do problema </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
                            <br />-->

                            <!--Quantidade de Equipamento-->
                            <div class="rowChamado"><a class="textEditChamado"> Quantidade de equipamentos </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div> 
                            
                            <!--Data-->
                            <div class="rowChamado"><a class="textEditChamado"> Data de abertura </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
                                
                            
                            <!--Botoes-->                
        
        </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALChamado" SelectMethod="Select" >
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>         
            </div> 
</div>

<!--Comentario-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="column middle">
            
            <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="inputtext"></asp:TextBox>
            <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="containerChat">
                        <i class="fa fa-user-circle iconFix"></i>
                        <p class="data"><span> <%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></span>
                        <%# DataBinder.Eval(Container.DataItem, "data_hora")%></p>
                        <p class="coment"><%# DataBinder.Eval(Container.DataItem, "descricao")%></p>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            
        </div>
</asp:Content>