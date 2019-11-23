<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" onload="sumir()">
        <div class="column middle">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="editmenu">
                            <div class="iconchamado"><i class=""></i> <a class="title">Chamado #<%# DataBinder.Eval(Container.DataItem, "id")%></a><a class="text status" ><%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                            </div> 

                            <!--Botoes--> 
                            <div class="searchplace">
                                <p>ATRIBUIR CHAMADO</p>
                                <asp:DropDownList runat="server" ID="atribuidoID" DataSourceID="ObjectDataSource4" DataTextField="nome" DataValueField="id"  CssClass="inputsearch  "></asp:DropDownList>
                                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectBolsistaServidor" TypeName="ProjectColab.DAL.DALUsuario"></asp:ObjectDataSource>

                                <asp:LinkButton ID="atribuir" runat="server" CssClass="btnsearch" CommandName="Fechar"  OnClick="atribuir_Click"> ATRIBUIR</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btnsearch bg invert" CommandName="Fechar" CommandArgument='<%#Eval("id")%>'> FECHAR CHAMADO</asp:LinkButton>
                            </div>   

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
                           
                            <!--Equipamentos-->
                            <div class="rowChamado rowFix"><a class="textEditChamado"> Equipamento(s) </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "equip_id")%> </a></div>

                            <!--Tombamentos-->
                            <div class="rowChamado  rowFix"><a class="textEditChamado"> Tombamento(s) </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tombamento")%> </a></div>
                                                       
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

<!--Comentario externo-->

<div class="comentario"></div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <div class="column middle">    
            <div class="searchplace">         
                    <div class="navbar">
                        <div><asp:Button ID="ButtonIn" runat="server" Text="COMENTÁRIOS INTERNOS"  CssClass="btn" OnClick="ButtonIn_Click"/></div>
                        <div><asp:Button ID="ButtonEx" runat="server" Text="COMENTÁRIOS EXTERNOS"  CssClass="btn" OnClick="ButtonEx_Click"/></div>
                    </div><!--<a class="title">COMENTÁRIOS INTERNOS</a>-->
           </div> 

                <asp:Label ID="MsgErrocoment" runat="server" ForeColor="Red"></asp:Label>  
        <asp:Panel ID="PanelEx" runat="server">
          <div class="searchplace">
                <asp:TextBox runat="server" ID="descricaoEx" placeholder="ADICIONAR COMENTARIO" CssClass="inputsearch2"></asp:TextBox>
                

                <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="btnsearch" OnClick="add_ClickEx"/>
            </div>  
            <div class="containerChat">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                 <ItemTemplate>
                        <div class="topoComentario" runat="server">
                            <i class="fa fa-user-circle iconFix"></i>
                                <div class="infoComentario">
                                    <div class="Info">
                                        <p class="data"> <%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></p>
                                        <p class="coment"> <%# DataBinder.Eval(Container.DataItem, "data_hora")%></p>
                                    </div>
                                    <div class="coment">   
                                        <p class="coment"><%# DataBinder.Eval(Container.DataItem, "descricao")%></p>
                                    </div>
                                </div>
                        </div>
                 </ItemTemplate>
            </asp:Repeater>

            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </div>
    </asp:Panel>

<!--Comentario interno-->     
        <asp:Panel ID="PanelIn" runat="server">
          <div class="searchplace">
                <asp:TextBox runat="server" ID="descricaoIn" placeholder="ADICIONAR COMENTARIO" CssClass="inputsearch2"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR"  CssClass="btnsearch" OnClick="add_ClickIn"/>
            </div>  
            <div class="containerChat">
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                        <div class="topoComentario">
                            <i class="fa fa-user-circle iconFix"></i>
                                <div class="infoComentario">
                                    <div class="Info">
                                        <p class="data"> <%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></p>
                                        <p class="coment"> <%# DataBinder.Eval(Container.DataItem, "data_hora")%></p>
                                    </div>
                                    <div class="coment">   
                                        <p class="coment"><%# DataBinder.Eval(Container.DataItem, "descricao")%></p>
                                    </div>
                                </div>
                        </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectInterno" TypeName="ProjectColab.DAL.DALComentario">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
    </div>
  </asp:Panel>          

    </div>
</asp:Content>