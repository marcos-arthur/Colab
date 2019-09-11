<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDTutorial.aspx.cs" Inherits="ProjectColab.WebFormCRUDTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
                <div class="tables">
                     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
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
                         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                         <SortedAscendingCellStyle BackColor="#E9E7E2" />
                         <SortedAscendingHeaderStyle BackColor="#506C8C" />
                         <SortedDescendingCellStyle BackColor="#FFFDF8" />
                         <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                     </asp:GridView>
                     
                     <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Tutorial" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALTutorial" UpdateMethod="Update"></asp:ObjectDataSource>
                     
                </div>
                <asp:Button ID="Button1" runat="server" Text="ADICIONAR TUTORIAL" CssClass="cancelbtn" PostBackUrl="~/WebFormAddTutorial.aspx" />    
            </div>
</asp:Content>