<%@ Page Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormChamadosFechadosEditServidor.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormChamadosFechadosEditServidor" %>
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

                            <a class="text"><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            <br />

                            <a class="text">Quantidade de equipamentos: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a>
                            <br />
                            
                            <a class="text">Data de abertura: <%# DataBinder.Eval(Container.DataItem, "data")%> </a>                            
                            <div class="bot"><asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoopen" CommandName="Reabrir" CommandArgument='<%#Eval("id")%>'><i class="fa fa-external-link-square"></i> REABRIR CHAMADO</asp:LinkButton></div> 
                            
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
