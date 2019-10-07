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
            <asp:Button ID="Button5" runat="server" Text="ABRIR CHAMADO" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddChamado.aspx" />
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                <ItemTemplate>
                    <div class="content chamado">
                        <div class="row chamado">
                            <div class="margin id">
                                <div class="gridfix">
                                    <a class="text id">CHAMADO: #<%# DataBinder.Eval(Container.DataItem, "id")%></a>
                                    <a class="text status"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a>
                                    <asp:Button ID="Abrir"  runat="server" Text="Abrir" CssClass="btn test" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> />
                                </div>                            
                            </div>
                            <div class="margin"><a class="text">Aberto por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAberto")%> </a></div>
                            <div class="margin"><a class="text">Laboratório: <%# DataBinder.Eval(Container.DataItem, "nomeLaboratorio")%> </a></div>
                            <div class="margin"><a class="text">Atribuido a: <%# DataBinder.Eval(Container.DataItem, "nomeUsuarioAtribuido")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
                        </div>
                    </div>  
                </ItemTemplate>
            </asp:Repeater>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" TypeName="ProjectColab.DAL.DALChamado" >
    </asp:ObjectDataSource>
        </div>


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