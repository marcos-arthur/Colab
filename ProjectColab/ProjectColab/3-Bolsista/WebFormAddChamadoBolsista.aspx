<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormAddChamadoBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormAddChamadoBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="column middle">
                <div class="menuadicao">

                <div class="tag"><a>RESUMO DO PROBLEMA</a></div>
                <asp:TextBox ID="resumo" runat="server" Placeholder="DIGITE AQUI O RESUMO DO PROBLEMA" CssClass="inputtext"></asp:TextBox>  
                <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>

                <div class="tag"><a>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</a></div>
                <asp:TextBox ID="quantidadeeq" runat="server" Placeholder="DIGITE AQUI A QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS" CssClass="inputtext"></asp:TextBox>
                <asp:Label ID="MsgErromaqdef" runat="server" ForeColor="Red"></asp:Label>
                
                <div class="tag"><a>LABORATÓRIO</a></div>
                <asp:DropDownList ID="labDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtextDrop" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
                <asp:DropDownList ID="catDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtextDrop" DataSourceID="ObjectDataSource1"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALCategoria"></asp:ObjectDataSource>
                <asp:Label ID="MsgErrolab" runat="server" ForeColor="Red"></asp:Label>   
            <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->
                
                <br />
                <br />
                <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" OnClick="add_Click1"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
                <asp:LinkButton ID="Button4" runat="server" CssClass="botaoadd" OnClick="add_Click2"><i class="fa fa-remove"></i> ABRIR CHAMADO INTERNO</asp:LinkButton>
            </div>
            </div>


</asp:Content>

