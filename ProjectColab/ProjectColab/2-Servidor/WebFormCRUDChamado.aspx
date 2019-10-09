<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDChamado.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
       

        <div class="column middle teste">
       <!-- <div class="content"> <i class="fa fa-circle-o"></i>
            <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" PostBackUrl="~//2-Servidor/WebFormAddChamado.aspx" ><i class="fa fa-plus"></i> ABRIR CHAMADO</asp:LinkButton>
        </div>-->

 <!--REPEATER PARA VISUALIZAR OS CHAMADOS-->
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text">CHAMADO #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>
                            <a class="text"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>                      
                            <a class="text">Aberto por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a>
                            <a class="text">Laboratório: <%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a>
                            <a class="text">Atribuido a: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a>
                            <div class="resu"><a class="text"> <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a>
                            <a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "data")%> </a>
                            <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR CHAMADO</asp:LinkButton></div> 
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" TypeName="ProjectColab.DAL.DALChamado" >
                </asp:ObjectDataSource>
            </div>
        </div>
 <!--FIM DO REPEATER-->

</asp:Content>