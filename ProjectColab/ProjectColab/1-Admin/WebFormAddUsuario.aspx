<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterAdmin.Master" AutoEventWireup="true" CodeBehind="WebFormAddUsuario.aspx.cs" Inherits="ProjectColab.WebFormAddUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="column middle">           
        <div class="indicador"><a class="title">CADASTRO DE USUÁRIOS</a></div>  
            <div class="menuAdd">

                <div class="AreaToInput">
                    <asp:Label ID="MsgErronome" runat="server" ForeColor="Red"></asp:Label>
                    <p>NOME</p>   <asp:TextBox ID="nome" runat="server" Placeholder="NOME DO USUÁRIO CADASTRADO" CssClass="inputsearch2 inputToAdd"></asp:TextBox> 
                </div>

                <div class="AreaToInput">
                    <asp:Label ID="MsgErrologin" runat="server" ForeColor="Red"></asp:Label>
                    <p>LOGIN</p>   <asp:TextBox ID="login" runat="server" Placeholder="LOGIN DO USUÁRIO" CssClass="inputsearch2 inputToAdd"></asp:TextBox>      

                </div>

                <div class="AreaToInput">
                    <asp:Label ID="MsgErrosenha" runat="server" ForeColor="Red"></asp:Label>
                    <p>SENHA</p>   <asp:TextBox ID="senha" TextMode="Password" runat="server" Placeholder="SENHA DO USUÁRIO" CssClass="inputsearch2 inputToAdd" MaxLength="20" ></asp:TextBox>

                </div>

                <div class="AreaToInput">
                <asp:Label ID="MsgErrosenhacf" runat="server" ForeColor="Red"></asp:Label>
                <p>Confirmar senha</p>   <asp:TextBox ID="confirmaSenha" TextMode="Password" Placeholder="DIGITE NOVAMENTE A SENHA DO USUÁRIO" runat="server" CssClass="inputsearch2 inputToAdd"></asp:TextBox>

                </div>

                <div class="AreaToInput">
                    <asp:Label ID="MsgErrotipo" runat="server" ForeColor="Red"></asp:Label>   
                    <p>TIPO</p>   <asp:TextBox ID="tipo" runat="server" Placeholder="TIPO DO USUÁRIO" CssClass="inputsearch2 inputToAdd"></asp:TextBox>   
        
                </div>
                <asp:Button ID="Button2" runat="server" Text="ADICIONAR"  CssClass="botaoadd btnToAdd" OnClick="Button1_Click"/>
                <asp:Button runat="server" ID="Button3" Text="CANCELAR" CssClass="botaoadd btnToAdd" PostBackUrl="~/1-Admin/IndexAdmin.aspx"/>
            </div>
        </div>
    </div>
</asp:Content>

