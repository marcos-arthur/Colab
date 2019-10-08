<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormCRUDTutorialBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormCRUDTutorialBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Width="100%">
                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                             <asp:BoundField DataField="nomeUsuario" HeaderText="nomeUsuario" SortExpression="nomeUsuario" />
                             <asp:BoundField DataField="tutorial_titulo" HeaderText="tutorial_titulo" SortExpression="tutorial_titulo" />
                             <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                             <asp:ButtonField CommandName="Baixar" Text="Baixar" ButtonType="Button" />

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
                     
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~/3-Bolsista/WebFormAddTutorialBolsista.aspx"/>  
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

        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>      
</asp:Content>