<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>
            <asp:BoundField DataField="resumo" HeaderText="resumo" SortExpression="resumo"></asp:BoundField>
            <asp:BoundField DataField="quantidadeeq" HeaderText="quantidadeeq" SortExpression="quantidadeeq"></asp:BoundField>
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="statuschamado" HeaderText="statuschamado" SortExpression="statuschamado"></asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>


    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="ProjectColab.DAL.DALChamado">
        <SelectParameters>
            <asp:SessionParameter SessionField="idchamado" Name="id" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="comenttext"></asp:TextBox>
                    <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>





                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                            <ul>
                                <li class="descricao" ><a><%# DataBinder.Eval(Container.DataItem, "descricao")%></a></li>
                                <li class="data_hora"><a><%# DataBinder.Eval(Container.DataItem, "data_hora")%></a></li>
                            </ul>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>


                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
</asp:Content>

