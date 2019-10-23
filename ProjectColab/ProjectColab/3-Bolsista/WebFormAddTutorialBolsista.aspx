<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormAddTutorialBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormAddTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            
    <div class="row">            
        <div class="column middle">
            <div class="indicador"><a class="title">ADICIONAR TUTORIAL</a></div>
           <div class="menuAdd">

                <div class="AreaToInput">
                    <i class="fa fa-align-left"></i>
                    <asp:TextBox ID="titulo" runat="server" Placeholder="DIGITE AQUI O TÍTULO DO TUTORIAL" CssClass="inputsearch2 inputToAdd"></asp:TextBox>  
                    <asp:Label ID="MsgErrotitulo" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <div class="AreaToInput">
                    <div class="tag"><a>URL DO ARQUIVO</a></div>
                    <asp:FileUpload ID="arquivo" runat="server" CssClass="inputsearch2 inputToAdd" />
                    <asp:Label ID="MsgErroarquivo" runat="server" ForeColor="Red"></asp:Label>                                
                </div>

                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>
        </div>

</asp:Content>