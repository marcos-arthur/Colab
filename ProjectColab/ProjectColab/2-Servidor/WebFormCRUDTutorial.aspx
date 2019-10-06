<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDTutorial.aspx.cs" Inherits="ProjectColab.WebFormCRUDTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Width="100%">
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                             <asp:BoundField DataField="tutorial_titulo" HeaderText="Título" SortExpression="tutorial_titulo" />
                             <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                         </Columns>
                         <EditRowStyle BackColor="#999999" />
                         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="#F7F6F3" ForeColor="#333333"  HorizontalAlign="Center" />
                         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                         <SortedAscendingCellStyle BackColor="#E9E7E2" />
                         <SortedAscendingHeaderStyle BackColor="#506C8C" />
                         <SortedDescendingCellStyle BackColor="#FFFDF8" />
                         <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                     </asp:GridView>
                     
                     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Tutorial" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALTutorial" UpdateMethod="Update"></asp:ObjectDataSource>
                     
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx" />  
        </div>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <div class="column side">
                            <div class="content2">
                                <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                                <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                                <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" />
                            </div>
                        </div>
                        <div class="column side">
                            <div class="content2">
                                <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                                <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                                <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>      
</asp:Content>