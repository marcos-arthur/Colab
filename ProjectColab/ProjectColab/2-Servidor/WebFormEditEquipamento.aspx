﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterServidor.Master" CodeBehind="WebFormEditEquipamento.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
                        <div class="editmenu">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource1" >
                    <ItemTemplate>
                            <div class="iconchamado"><i class=""></i> <a class="title">Sala #<%# DataBinder.Eval(Container.DataItem, "id")%></a></div>                            
                            <a class="text" ><%# DataBinder.Eval(Container.DataItem, "nome")%> </a>                                     
                        <div class="bot">
                         <asp:LinkButton ID="LinkButton3" runat="server" CssClass="botaoopen" CommandName="Fechar" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'><i class="fa fa-external-link-square"></i>FECHAR LABORATÓRIO</asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
</div>
            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select2" TypeName="ProjectColab.DAL.DALSalas">
                <SelectParameters>
                    <asp:SessionParameter SessionField="idsala" Name="id" Type="String"></asp:SessionParameter>
                </SelectParameters>
            </asp:ObjectDataSource>            
            
             <br />
            <asp:LinkButton ID="Button2" runat="server" CssClass="" OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR EQUIPAMENTO</asp:LinkButton>

        
            <br />

            <!--Repeater para os equipamentos da sala-->
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
                    <asp:SessionParameter Name="idsala" SessionField="idsala" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
</asp:Content>