<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterServidor.Master" CodeBehind="WebFormEditEquipamento.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditEquipamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="column middle">
            <!--Repeater para os equipamentos -->
            <asp:repeater runat="server" ID="LabEquips" DataSourceID="ObjectDataSource2">
                <ItemTemplate>
                    <div class="editmenu">              
                        <div class="iconchamado"><i class=""></i> <a class="title"><%# DataBinder.Eval(Container.DataItem, "modelo")%></a></div> 

                        <!-- id do equipamento -->
                        <div class="rowChamado"><a class="textEditChamado">id </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "id")%> </a></div>

                        <!-- Quantidade -->
                        <div class="rowChamado">
                            <a class="textEditChamado">Quantidade </a>

                            <asp:TextBox ID="quant" runat="server" Placeholder="DIGITE AQUI" CssClass="textEditChamado inputsearch2 inputToAdd"></asp:TextBox>                
                            <asp:Label ID="MsgErroQuant" runat="server" ForeColor="Red"></asp:Label>
                        </div>                            
                            
                        <!-- Fazer botão de excluir <div class="bot"><asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoopen" CommandName="ABRIR" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "id") %> ><i class="fa fa-external-link-square"></i> ABRIR LABORATÓRIO</asp:LinkButton></div> -->                        
                    </div>
                </ItemTemplate>
            </asp:repeater>            
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Select" TypeName="ProjectColab.DAL.DALEquipamento">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="idequip" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd btnToAdd"  OnClick="Button2_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd btnToAdd" PostBackUrl="~/2-Servidor/WebFormCRUDEquipamento.aspx"> CANCELAR</asp:LinkButton>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
</asp:Content>
