<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormEditLab.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">       
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" OnItemCommand="Repeater3_ItemCommand">
                        <ItemTemplate>
                                <div class="indicador"><a class="title"><%# DataBinder.Eval(Container.DataItem, "nome")%></a></div>   
            <div class="menuAddLab">                                                                        

                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoadd btnToAdd" CommandName="Fechar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'><i class="fa fa-external-link-square"></i>FECHAR LABORATÓRIO</asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select2" TypeName="ProjectColab.DAL.DALLaboratorio">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="idlab" Name="id" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>            
            
                    <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR EQUIPAMENTO</asp:LinkButton>
            </div>  
            <!--Repeater para os equipamentos do lab-->
<div class="content">
            <asp:repeater runat="server" ID="LabEquips" DataSourceID="ObjectDataSource2">
                <ItemTemplate>            
                        <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="textEditChamado nomeChamado">Equipamento #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>
                                                   
                            <!--<a class="text"> <%# DataBinder.Eval(Container.DataItem, "id")%> </a> -->

                            <div class="rowChamado rowFix"><a class="textEditChamado">Modelo:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "modelo")%> </a></div> 

                            <div class="rowChamado rowFix"><a class="textEditChamado">Quantidade:</a><a class="textEditChamado nomeChamado"> <%# DataBinder.Eval(Container.DataItem, "quantidade")%> </a></div>                                 
                        </div>                           
                        <!-- Fazer botão de excluir <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->                        
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
