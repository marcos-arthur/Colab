<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterServidor.Master" CodeBehind="WebFormTutorialSubmetido.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormTutorialSubmetido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
            <!--REPEATER PARA VISUALIZAR OS LABORATÓRIOS-->
            <asp:Button ID="Button2" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx" />
            <div class="content">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource2" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a></div>                            
                            <a class="text">Enviado por: <%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%> </a>
                            
                            <div class="bot"><asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoopen" CommandName="Autorizar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>' ><i class="fa fa-external-link-square"></i> AUTORIZAR TUTORIAL</asp:LinkButton></div> 
                            <div class="bot"><asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoopen" CommandName="Negar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>' ><i class="fa fa-external-link-square"></i> NEGAR TUTORIAL</asp:LinkButton></div> 
                            <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="Baixar" CommandArgument='<%#Eval("id") + ";" +Eval("tutorial_titulo")%>' ><i class="fa fa-external-link-square"></i> BAIXAR TUTORIAL</asp:LinkButton></div> 
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" TypeName="ProjectColab.DAL.DALTutorial" SelectMethod="SelectAllStatus" >
                </asp:ObjectDataSource>
            </div>
            <asp:Button ID="Button4" runat="server" Text="VER TUTORIAIS SUBMETIDOS" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormTutorialSubmetido.aspx" />

            <!--
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" EnableViewState="False" OnRowCommand="GridView1_RowCommand" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id"></asp:BoundField>
                    <asp:BoundField DataField="nomeUsuario" HeaderText="nomeUsuario" SortExpression="nomeUsuario"></asp:BoundField>
                    <asp:BoundField DataField="tutorial_titulo" HeaderText="tutorial_titulo" SortExpression="tutorial_titulo"></asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status"></asp:BoundField>
                    <asp:ButtonField ButtonType="Button" CommandName="Baixar" Text="Baixar" />
                    <asp:ButtonField ButtonType="Button" CommandName="Autorizar" Text="Autorizar" />
                    <asp:ButtonField ButtonType="Button" Text="Negar" CommandName="Negar" />
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
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllStatus" TypeName="ProjectColab.DAL.DALTutorial"></asp:ObjectDataSource>
            -->
            
            <asp:Button ID="Button1" runat="server" Text="ADICIONAR TUTORIAL" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddTutorial.aspx" />  
                <asp:Button ID="Button3" runat="server" Text="VOLTAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx" />  
        </div>
                
</asp:Content>
