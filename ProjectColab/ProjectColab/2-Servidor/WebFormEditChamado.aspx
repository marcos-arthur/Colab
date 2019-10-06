<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditChamado.aspx.cs" Inherits="ProjectColab.WebFormEditChamado" %>
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
            
            <div>
                <p>ATRIBUIR CHAMADO</p>
                <asp:DropDownList runat="server" ID="atribuidoID" DataSourceID="ObjectDataSource4" DataTextField="nome" DataValueField="id" ></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectBolsistaServidor" TypeName="ProjectColab.DAL.DALUsuario"></asp:ObjectDataSource>
                <asp:Button ID="atribuir" runat="server" Text="atribuir" OnClick="atribuir_Click"/>
            </div>
    </div>



        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource3">
            <ItemTemplate>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                        <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "noCount")%></a>
                        <asp:Button runat="server" ID="Button2" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx"/>
                    </div>  
                </div>
                <div class="column side">
                    <div class="content2">
                        <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                        <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "myCount")%></a>
                        <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx"/>
                    </div>  
                </div>
            </ItemTemplate>
        </asp:Repeater>


                <div class="column middle">
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="ProjectColab.DAL.DALChamado">
        <SelectParameters>
            <asp:SessionParameter SessionField="idchamado" Name="id" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:TextBox runat="server" ID="descricao" placeholder="ADICIONAR COMENTARIO" CssClass="comenttext"></asp:TextBox>
                    <asp:Button ID="add" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="add_Click"/>



                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                    <ItemTemplate>
                        <div class="column middle">
                                <a><%# DataBinder.Eval(Container.DataItem, "descricao")%></a>
                               <a><%# DataBinder.Eval(Container.DataItem, "data_hora")%></a>
                        </div>
                        <br />
                    </ItemTemplate>

                </asp:Repeater>


                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="ProjectColab.Modelo.Comentario" InsertMethod="Insert" SelectMethod="Select" TypeName="ProjectColab.DAL.DALComentario">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="idchamado" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
            </SelectParameters>
                    </asp:ObjectDataSource>
    </div>
</asp:Content>

