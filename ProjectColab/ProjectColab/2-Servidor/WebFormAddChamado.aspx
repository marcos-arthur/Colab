<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="row">
        <div class="column middle">
                <div class="indicador"><a class="title">ADICIONAR CHAMADO</a></div>
                <div class="content">
                    <!-- Primeira parte da criação de chamados-->
                    <div class="contentCadastro">
                        
                        <div class="rowCadastro ">
                            <a class="">RESUMO DO PROBLEMA</a>

                            <asp:TextBox ID="resumo" runat="server" Placeholder="DIGITE AQUI O RESUMO DO PROBLEMA" CssClass="cadastro"></asp:TextBox>

                            <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>
                        </div>                  
                        <div class="rowCadastro">
                            <a class="">RESUMO DO PROBLEMA</a>
                            <asp:DropDownList ID="labDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtxt" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
                            <asp:DropDownList ID="catDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtextDrop" DataSourceID="ObjectDataSource1"></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALCategoria"></asp:ObjectDataSource>
                            <asp:Label ID="MsgErrolab" runat="server" ForeColor="Red"></asp:Label>   
                        </div>
                    


                    <!-- Segunda parte da criação de chamados-->
                    <div class="contentCadastro">
                        <div class="rowCadastro">
                            <a class="">RESUMO DO PROBLEMA</a>
                            <asp:TextBox ID="quantidadeeq" runat="server" Placeholder="DIGITE AQUI A QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS" CssClass="cadastro"></asp:TextBox>
                            <asp:Label ID="MsgErromaqdef" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                    </div>
                    </div>  



                </div>
                <div class="content">
            <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->
                <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" OnClick="add_Click1"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>
         </div>
    
</asp:Content>
