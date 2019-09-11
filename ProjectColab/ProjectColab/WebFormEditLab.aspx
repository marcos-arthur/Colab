<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab.WebFormEditLab" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab.WebFormEditLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
                <asp:DetailsView ID="DetailsView3" runat="server" Height="40%" Width="90%" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" OnItemDeleted="DetailsView1_ItemDeleted" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="WHITE" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="javascript:return ConfirmaExclusao()" Text="Excluir"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>

                <asp:DetailsView ID="DetailsView4" Height="40%" Width="90%" runat="server"  AutoGenerateRows="False" DataSourceID="ObjectDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                        <asp:BoundField DataField="laboratorio_id" HeaderText="laboratorio_id" SortExpression="laboratorio_id" />
                        <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                        <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>

                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DataObjectTypeName="ProjectColab.Modelo.Equipamento" SelectMethod="Select" TypeName="ProjectColab.DAL.DALEquipamento" UpdateMethod="Insert">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update" DeleteMethod="Delete">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="id" SessionField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="Button1" runat="server" Text="VOLTAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx" />
            </div>
</asp:Content>