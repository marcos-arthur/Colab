<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDChamado.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
                <div class="sec-mid">
                <asp:GridView ID="GridView1" Height="30%" Max-Width="100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID DO CHAMADO" SortExpression="id" />
                        <asp:BoundField DataField="status" HeaderText="STATUS DO CHAMADO" SortExpression="status" />
                        <asp:BoundField DataField="resumo" HeaderText="RESUMO DO PROBLEMA" SortExpression="resumo" />
                        <asp:BoundField DataField="quantidadeeq" HeaderText="EQUIPAMENTOS DEFEITUOSOS" SortExpression="quantidadeeq" />
                        <asp:BoundField DataField="data" HeaderText="DATA DE ABERTURA" SortExpression="data" />
                        <asp:ButtonField CommandName="ABRIR" Text="ABRIR" ControlStyle-CssClass="tablebtn2" ButtonType="Button" >
                        <ControlStyle CssClass="tablebtn2"></ControlStyle>
                        </asp:ButtonField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="WHITE" ForeColor="BLACK"  HorizontalAlign="Center"/>
                    <SelectedRowStyle BackColor="" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Chamado" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALChamado"></asp:ObjectDataSource>
            </div>
                <asp:Button ID="Button2" runat="server" Text="ABRIR CHAMADO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddChamado.aspx" />
            </div>


<div class ="mid">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <HeaderTemplate>
            <ul>
                <li></li>
            </ul>
        </HeaderTemplate>
        <ItemTemplate>
            <ul class="container">
                <li><%# DataBinder.Eval(Container.DataItem, "id")%> </li>
                <li><%# DataBinder.Eval(Container.DataItem, "status")%> </li>
                <li><%# DataBinder.Eval(Container.DataItem, "resumo")%> </li>
                <li><%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%></li>
                <li><%# DataBinder.Eval(Container.DataItem, "data")%> </li>
            </ul>
        </ItemTemplate>


    </asp:Repeater>
</div>
</asp:Content>