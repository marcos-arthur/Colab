<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
         <div class="sec-mid">

             <br />

             <asp:GridView ID="GridView1"  Height="20%" Width="90%" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="ID DO LABORÁTORIO" SortExpression="id" />
                     <asp:BoundField DataField="nome" HeaderText="NOME DO LABORATÓRIO" SortExpression="nome" />
                     <asp:ButtonField CommandName="EDITAR" Text="EDITAR" ControlStyle-CssClass =" tablebtn2" ButtonType="Button" >
                        <ControlStyle CssClass=" tablebtn2"></ControlStyle>
                     </asp:ButtonField>
                     <asp:ButtonField CommandName="ABRIR" Text="ABRIR"  ControlStyle-CssClass = " tablebtn2" ButtonType="Button">
                     </asp:ButtonField>
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="WHITE" HorizontalAlign="Center"/>
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>

        </div>
         <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddLab.aspx" />  
    </div>      
</asp:Content>