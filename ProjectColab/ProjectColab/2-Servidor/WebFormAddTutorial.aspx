<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddTutorial.aspx.cs" Inherits="ProjectColab.WebFormAddTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">         

    <div class="row">
        <div class="column middle">


                <p>TITULO DO TUTORIAL</p>   <asp:TextBox ID="titulo" runat="server" CssClass="text"/>  
                <asp:Label ID="MsgErrotitulo" runat="server" ForeColor="Red"></asp:Label>
                <p>URL DO ARQUIVO</p>       <asp:TextBox ID="arquivo" runat="server" CssClass="text"/>          
                <asp:Label ID="MsgErroarquivo" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Button1_Click"/>
                <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx"/>



        </div> 
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                <ItemTemplate>

                    <div class="column side">
                        <div class="content2">
                            <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                            <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "noCount")%></a>
                            <asp:Button runat="server" ID="Button6" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button6_Click"/>
                        </div>  
                    </div>

                    <div class="column side">
                        <div class="content2">
                            <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                            <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "myCount")%></a>
                            <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button5_Click"/>
                        </div>  
                    </div>

                </ItemTemplate>
                
            </asp:Repeater>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
                <SelectParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>

    </div>






</asp:Content>

