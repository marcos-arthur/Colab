<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
                        <div class="editmenu">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                    <ItemTemplate>
                            <div class="iconchamado"><i class=""></i> <a class="title">Laboratório #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>                            
                            <a class="text" ><%# DataBinder.Eval(Container.DataItem, "nome")%> </a>                                     
                        <div class="bot">
                         <asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoopen" CommandName="Fechar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'><i class="fa fa-external-link-square"></i>FECHAR LABORATÓRIO</asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
</div>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select2" TypeName="ProjectColab.DAL.DALLaboratorio">
                <SelectParameters>
                    <asp:SessionParameter SessionField="idlab" Name="id" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:ObjectDataSource>  

            <div class="menuadicao">

                <div class="tag"><a>Nome do Laboratório</a></div>
                <asp:TextBox ID="nome" runat="server" Placeholder="DIGITE AQUI O NOME" CssClass="inputtext"></asp:TextBox>  
                <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>

                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd" OnClick="LinkButton1_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd" OnClick="LinkButton2_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>            
            
             <br />
            <asp:LinkButton ID="Button2" runat="server" CssClass="" OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR EQUIPAMENTO</asp:LinkButton>

        
            <br />

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

        </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
</asp:Content>
