<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterProfessor.Master" CodeBehind="WebFormCRUDChamadoProfessor.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamadoProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>
        <div class="column middle teste">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                <ItemTemplate>
                    <div class="content chamado">
                        <div class="row chamado">
                            <div class="margin id">
                                <div class="gridfix id"><a class="text id">CHAMADO: #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>
                                <div class="botaoabrir"> <asp:Button ID="Abrir"  runat="server" Text="Abrir" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> /> </div>
                                <div class="gridfix status"><a class="text status"> <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a> </div>
                            </div>

                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "statuschamado")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "resumo")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%> </a></div>
                            <div class="margin"><a class="text">CHAMADO: <%# DataBinder.Eval(Container.DataItem, "data")%> </a></div>
                        </div>
                    </div>  
                </ItemTemplate>
            </asp:Repeater>
            <asp:Button ID="Button5" runat="server" Text="ABRIR CHAMADO" CssClass="tablebtn2" PostBackUrl="~/4-Professor/WebFormAddChamadoProfessor.aspx" />
        </div>         
    </div>
</asp:Content>