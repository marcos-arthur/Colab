<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id"></asp:BoundField>
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="ProjectColab.DAL.DALLaboratorio">
                <SelectParameters>
                    <asp:SessionParameter SessionField="idlab" Name="id" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:ObjectDataSource>            
        </div>

        
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <!--Repeater para os equipamentos do lab-->
        <asp:repeater runat="server" ID="LabEquips" DataSourceID="ObjectDataSource2">
            <ItemTemplate>
                <div class="">                            
                    <div class=""><i class="fa fa-bell"></i> <a class="text">Equipamento #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>
                                                   
                    <!--<a class="text"> <%# DataBinder.Eval(Container.DataItem, "id")%> </a> -->

                    <a class="text">Modelo: <%# DataBinder.Eval(Container.DataItem, "modelo")%> </a> 

                    <a class="text">Quantidade: <%# DataBinder.Eval(Container.DataItem, "quantidade")%> </a>                                 
                            
                    <!-- Fazer botão de excluir <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->                        
                </div>
            </ItemTemplate>
        </asp:repeater>            
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectFromLab" TypeName="ProjectColab.DAL.DALEquipamento">
            <SelectParameters>
                <asp:SessionParameter Name="idLab" SessionField="idlab" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>
