<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormViewTutorial.aspx.cs" Inherits="ProjectColab._2_Servidor.WebFormEditTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" onload="sumir()">
        <div class="column middle">
    <div class="editmenu">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
            <ItemTemplate>
        <div class="iconchamado"><i class=""></i> <a class="title">tutorial # <%# DataBinder.Eval(Container.DataItem, "id")%></a>
        </div> 
                <div class="rowChamado"><a class="textEditChamado">Titulo:</a><a id="titulotext" class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "tutorial_titulo")%></a>
                <asp:TextBox ID="titulo" runat="server"  CssClass="inputsearch2 inputToAdd"></asp:TextBox> 
                </div>
 
        

                <!--titulo-->
                <div id="textEnviado"  class="rowChamado"><a class="textEditChamado">Enviado por:</a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeUsuario")%></a></div>
                
                <div class="rowChamado assuntoDiv">
                    <div class=""><a>ATUALIZAR ARQUIVO</a></div>
                    <asp:FileUpload ID="arquivo" CssClass="inputsearch2 inputToAdd" placeholder="ola" runat="server" />
                </div>                

                <!--assunto-->                                    
                <div class="rowChamado"><a class="textEditChamado">Assunto: </a><a class="textEditChamado nomeChamado"><%# DataBinder.Eval(Container.DataItem, "nomeAssunto")%></a></div>                    
                <asp:DropDownList runat="server" CssClass="inputsearch2 inputToAdd" ID="dropAssuntos" DataSourceID="ObjectDataSource3" DataTextField="titulo" DataValueField="id">
                </asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DAOAssunto"></asp:ObjectDataSource>                
                
                <!--Botoes-->  

            </ItemTemplate>

        </asp:Repeater>
            <div class="bot">
                <div id="hide" class="botaoadd btnToAdd">Editar</div>
                <asp:LinkButton ID="btnEditar" runat="server" CssClass="botaoadd btnToAdd" OnClick="btnEditar_Click"><i class="fa fa-check"></i>EDITAR</asp:LinkButton>
                <asp:LinkButton ID="btnCancelar" runat="server" CssClass="botaoadd btnToAdd"><i class="fa fa-remove"></i>CANCELAR</asp:LinkButton>
            </div>
             </div>    
        </div>
<script>
$(document).ready(function () {
    $(".inputToAdd").hide();
    $(".assuntoDiv").hide();
    $("#ContentPlaceHolder1_btnEditar").hide();
    $("#ContentPlaceHolder1_btnCancelar").hide();
    $("#hide").click(function () {
        $("#ContentPlaceHolder1_Repeater1_titulo_0").val($("#titulotext").text());
        $("#textEnviado").hide();
        $(".nomeChamado").hide();
        $("#hide").hide();
        $("#ContentPlaceHolder1_btnEditar").show();
        $("#ContentPlaceHolder1_btnCancelar").show();
        $(".inputToAdd").show();
        $(".assuntoDiv").show();
  });
  $("#show").click(function(){
    $("p").show();
  });
});
</script>
        <!--Nome do usuario-->
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="Select" TypeName="ProjectColab.DAL.DALTutorial"><SelectParameters>
<asp:SessionParameter SessionField="idtutorial" Name="id" Type="String"></asp:SessionParameter>
</SelectParameters>
</asp:ObjectDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
