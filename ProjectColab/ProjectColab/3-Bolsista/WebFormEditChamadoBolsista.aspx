<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterBolsista.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamadoBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormEditChamadoBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="">
                            <div class=""><i class=""></i> <a class="text">Chamado #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>                            
                            <a class="text" >Status: <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                            <br />

                            <a class="text">Aberto por <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a>
                            <br />

                            <a class="text">Atribui a <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a>
                            <br />

                            <a class="text"><%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a>
                            <br />
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
                            <br />-->

                            <a class="text"><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            <br />
                            <!--<asp:TextBox runat="server" visible="false"></asp:TextBox>
                            <br />-->

                            <a class="text">Quantidade de equipamentos: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a>
                            <br />
                            
                            <a class="text">Data de abertura: <%# DataBinder.Eval(Container.DataItem, "data")%> </a>                            
                            
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALChamado" SelectMethod="Select" >
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
        </div>
        
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="column middle">
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="ProjectColab.DAL.DALChamado">
                <SelectParameters>
                    <asp:SessionParameter SessionField="idchamado" Name="id" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="comenttext"></asp:TextBox>
            <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="column middle">                        
                        <a><%# DataBinder.Eval(Container.DataItem, "descricao")%></a>
                        <a><%# DataBinder.Eval(Container.DataItem, "data_hora")%></a>
                        <a><%# DataBinder.Eval(Container.DataItem, "usuario_nome")%></a>
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