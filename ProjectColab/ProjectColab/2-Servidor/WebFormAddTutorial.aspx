<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddTutorial.aspx.cs" Inherits="ProjectColab.WebFormAddTutorial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">         

    <div class="row">
        <div class="column middle">
                <div class="menuadicao">

                <div class="tag"><a>TITULO DO TUTORIAL</a></div>
                <asp:TextBox ID="titulo" runat="server" Placeholder="DIGITE AQUI O TÍTULO DO TUTORIAL" CssClass="inputtext"></asp:TextBox>  
                <asp:Label ID="MsgErrotitulo" runat="server" ForeColor="Red"></asp:Label>

                <div class="tag"><a>URL DO ARQUIVO</a></div>
                <asp:FileUpload ID="arquivo" CssClass="btn" runat="server" />
                <asp:Label ID="MsgErroarquivo" runat="server" ForeColor="Red"></asp:Label>                                
                
                <br />
                <br />
                
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="botaoadd" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>
         </div> 
        
</asp:Content>

