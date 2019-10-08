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
                            <div class="iconchamado"><i class="fa fa-circle-o-notch"></i></div>
                            <a class="text">CHAMADO: #<%# DataBinder.Eval(Container.DataItem, "id")%></a>
                            <a class="text"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                            <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR CHAMADO</asp:LinkButton>                          
                            <a class="text">Aberto por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a>
                            <a class="text">Laboratório: <%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a>
                            <a class="text">Atribuido a: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a>
                            <a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            <a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a>
                            <a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "data")%> </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" TypeName="ProjectColab.DAL.DALChamado" >
    </asp:ObjectDataSource>
        </div></div>
 <!--FIM DO REPEATER-->

        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
            <ItemTemplate>
                <div class="column side">
                    <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "noCount")%></a>
                         <asp:Button runat="server" ID="Button2" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button2_Click"/>
                      </div>  
                  </div>
                  <div class="column side">
                      <div class="content2">
                          <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                         <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "myCount")%></a>
                         <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button5_Click"/>
                      </div>  
                </div>
            </ItemTemplate>
        </asp:Repeater>
       
    </div>
</asp:Content>