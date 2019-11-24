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

                        <!-- Modelo do equipamento -->
                        <div class="rowChamado">
                            <asp:Label ID="MsgErroModelo" runat="server" ForeColor="Red"></asp:Label>
                            <a class="textEditChamado">Modelo: </a>
                            <a id="modelotxt" class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "modelo")%></a>
                            <asp:TextBox ID="modelo" runat="server"  CssClass="inputsearch2 inputToAdd"></asp:TextBox>
                        </div>                         

                        <!-- Quantidade -->
                        <div class="rowChamado">
                            <asp:Label ID="MsgErroQuant" runat="server" ForeColor="Red"></asp:Label>
                            <a class="textEditChamado">Quantidade: </a>
                            <a id="quanttxt" class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "quantidade")%></a>
                            <asp:TextBox ID="quant" runat="server" CssClass="inputsearch2 inputToAdd"></asp:TextBox>                
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
            <div class="bot">
                <div id="hide" class="botaoadd btnToAdd">Editar</div>

                <asp:LinkButton ID="btnEditar" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button2_Click"><i class="fa fa-check"></i>ATUALIZAR</asp:LinkButton>
                <asp:LinkButton ID="btnCancelar" runat="server" CssClass="botaoadd btnToAdd"><i class="fa fa-remove"></i>CANCELAR</asp:LinkButton>                
                
                <asp:LinkButton ID="btnExcluir" runat="server" CssClass="botaoadd btnToAdd"  OnClick="Button3_Click"><i class="fa fa-check"></i>EXCLUIR</asp:LinkButton>
            </div>
        </div>

<script>
$(document).ready(function () {
    
    $(".inputToAdd").hide();
    $("#manterTxt").hide();
    $(".assuntoDiv").hide();
    $("#ContentPlaceHolder1_btnEditar").hide();
    $("#ContentPlaceHolder1_btnCancelar").hide();
    $("#ContentPlaceHolder1_btnExcluir").hide();
    $("#ContentPlaceHolder1_Repeater1_manter_0").hide();

    $("#hide").click(function () {
        $("#ContentPlaceHolder1_LabEquips_modelo_0").val($("#modelotxt").text());
        $("#ContentPlaceHolder1_LabEquips_quant_0").val($("#quanttxt").text());
        $("#textEnviado").hide();
        $(".nomeChamado").hide();
        $("#hide").hide();
        $("#ContentPlaceHolder1_btnEditar").show();
        $("#ContentPlaceHolder1_btnCancelar").show();
        $("#ContentPlaceHolder1_btnExcluir").show();
        $("#ContentPlaceHolder1_Repeater1_manter_0").show();
        $(".inputToAdd").show();
        $(".assuntoDiv").show();
        $("#manterTxt").show();
  });
  $("#show").click(function(){
    $("p").show();
  });
});
</script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    
</asp:Content>
