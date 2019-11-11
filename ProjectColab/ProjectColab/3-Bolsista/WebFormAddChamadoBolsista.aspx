<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormAddChamadoBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormAddChamadoBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="column middle">
    <div class="indicador"><a class="title">ADICIONAR CHAMADO</a></div>
        <div class="content">
            <div class="menuAdd">
                <!-- Primeira parte da criação de chamados-->

                <div class="AreaToInput">
                    <asp:Label ID="MsgErroresumop" runat="server" CssClass="alerta" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="resumo" runat="server" Placeholder="DIGITE AQUI O RESUMO DO PROBLEMA" CssClass="inputsearch2 inputToAdd"></asp:TextBox>
                </div>

                <div class="AreaToInput">
                    <asp:DropDownList ID="salaDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputsearch2 inputToAdd" AutoPostBack="True" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectStatus1" TypeName="ProjectColab.DAL.DALSalas"></asp:ObjectDataSource>
                </div>

                <div class="AreaToInput">
                    <asp:Label ID="MsgErrosala" CssClass="alerta" runat="server" ForeColor="Red"></asp:Label>   
                    <asp:DropDownList ID="catDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputsearch2 inputToAdd" DataSourceID="ObjectDataSource1"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALCategoria"></asp:ObjectDataSource>         
                    <!-- Segunda parte da criação de chamados-->
                </div>

                 <i class="fa fa-desktop"></i><asp:DropDownList ID="modeloDrop" runat="server" DataTextField="modelo" DataValueField="id" CssClass="inputsearch2 inputToAdd" DataSourceID="ObjectDataSource3" ></asp:DropDownList>
                             <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectFromSala" TypeName="ProjectColab.DAL.DALEquipamento">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="salaDrop" DefaultValue="0" Name="idsala" PropertyName="SelectedValue" Type="String" />
                                 </SelectParameters>
                            </asp:ObjectDataSource>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Todos"/>
                 <i class="fa fa-desktop"></i><asp:TextBox ID="tombamento" runat="server" Placeholder="DIGITE AQUI OS TOMBAMENTOS" CssClass="inputsearch2 inputToAdd"></asp:TextBox>

                <div class="AreaToInput">
                    <asp:Label ID="MsgErromaqdef" CssClass="alerta" runat="server" ForeColor="Red"></asp:Label>
                    <asp:TextBox ID="quantidadeeq" runat="server" Placeholder="DIGITE AQUI A QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS" CssClass="inputsearch2 inputToAdd" OnTextChanged="quantidadeeq_TextChanged"></asp:TextBox>
                </div>
                

                <div class="AreaToInput">
                    <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->                
                    <asp:DropDownList ID="statusEI" CssClass="inputsearch2 inputToAdd" runat="server">
                    <asp:ListItem Value="1">Externo</asp:ListItem>
                    <asp:ListItem Value="2">Interno</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd btnToAdd" OnClick="add_Click1"><i class="fa fa-check"></i>ADICIONAR</asp:LinkButton>
                <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd btnToAdd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>  
            </div>        
        </div>
    </div>    

</asp:Content>

