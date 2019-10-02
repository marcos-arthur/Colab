<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDChamado.aspx.cs" Inherits="ProjectColab.WebFormCRUDChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta"></asp:ObjectDataSource>
        <!--<div class="column middle">
                <asp:GridView ID="GridView1" Height="30%" width="100%" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="5" DataSourceID="ObjectDataSource1" ForeColor="#E6E6E6" GridLines="None" OnRowCommand="GridView1_RowCommand" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="NotSet" CellSpacing="0" EditRowStyle-Height="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="black" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID DO CHAMADO" SortExpression="id" />
                        <asp:BoundField DataField="status" HeaderText="STATUS DO CHAMADO" SortExpression="status" />
                        <asp:BoundField DataField="resumo" HeaderText="RESUMO DO PROBLEMA" SortExpression="resumo" />
                        <asp:BoundField DataField="quantidadeeq" HeaderText="EQUIPAMENTOS DEFEITUOSOS" SortExpression="quantidadeeq" />
                        <asp:BoundField DataField="data" HeaderText="DATA DE ABERTURA" SortExpression="data" />
                        <asp:ButtonField CommandName="ABRIR" Text="ABRIR" ControlStyle-CssClass="btn small" ButtonType="Button" ><ControlStyle CssClass="btn small"></ControlStyle></asp:ButtonField>
                    </Columns>
                    <EditRowStyle BackColor="#999999"  CssClass="editrow" Width="50px" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#E6E6E6" Font-Bold="True" ForeColor="black"  CssClass="indicador"/>
                    <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="WHITE" ForeColor="BLACK"  HorizontalAlign="Center"/>
                    <SelectedRowStyle BackColor="" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Chamado" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALChamado"></asp:ObjectDataSource>
                <asp:Button ID="Button2" runat="server" Text="ABRIR CHAMADO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddChamado.aspx" />
            </div>-->

        <div class="column middle">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1">
                <ItemTemplate>
                    <div class="content chamado">
                        <div class="row chamado">
                            <a>CHAMADO: #<%# DataBinder.Eval(Container.DataItem, "id")%> </a>
                            <a><%# DataBinder.Eval(Container.DataItem, "status")%> </a>
                            <a><%# DataBinder.Eval(Container.DataItem, "resumo")%> </a>
                            <a><%# DataBinder.Eval(Container.DataItem, "quantidadeeq")%></a>
                            <a><%# DataBinder.Eval(Container.DataItem, "data")%> </a>
                        </div>
                    </div>  
                </ItemTemplate>
            </asp:Repeater>
            <asp:Button ID="Button5" runat="server" Text="ABRIR CHAMADO" CssClass="tablebtn2" PostBackUrl="~/WebFormAddChamado.aspx" />
        </div>


        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
            <ItemTemplate>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                        <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                        <asp:Button runat="server" ID="Button1" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx" />
                    </div>
                </div>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                        <a class="sub-first"><%# DataBinder.Eval(Container.DataItem, "count")%></a>
                        <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~/WebFormCRUDChamado.aspx" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>