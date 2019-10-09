<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDEquipamento.aspx.cs" Inherits="ProjectColab.WebFormCRUDEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">        
        <div class="column middle teste">  
            <div class="indicador"><a class="colorfix titulo"><i class="fa fa-bell"></i>EQUIPAMENTOS</a></div>              
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->            
            <div class="content">
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR EQUIPAMENTO" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddEquipamento.aspx" />
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text">Equipamento  #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>
                            <a class="text"> <%# DataBinder.Eval(Container.DataItem, "modelo")%> </a>
                            <a class="text"> <%# DataBinder.Eval(Container.DataItem, "laboratorio_nome")%> </a>
                            <a class="text"> <%# DataBinder.Eval(Container.DataItem, "quantidade")%> </a>
                            <!-- EXCLUIR EQUIPAMENTO <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" TypeName="ProjectColab.DAL.DALEquipamento" SelectMethod="SelectAll" >
                </asp:ObjectDataSource>
            </div>            
        </div>

    <!--<div class="mid">
             <asp:GridView ID="GridView2" runat="server" Height="20%" Width="90%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" DataSourceID="ObjectDataSource1">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                     <asp:BoundField DataField="laboratorio_nome" HeaderText="laboratorio_nome" SortExpression="laboratorio_nome" />
                     <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                     <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="white" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALEquipamento" DataObjectTypeName="ProjectColab.Modelo.Equipamento" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
             </asp:ObjectDataSource>
</div>-->

</asp:Content>
