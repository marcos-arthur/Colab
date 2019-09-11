<%@ Page Title="" Language="C#" MasterPageFile="~/PageMaster.Master" AutoEventWireup="true" CodeBehind="WebFormAddLab.aspx.cs" Inherits="ProjectColab.WebFormAddLab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="mid">
            <p style="display:none">CÓDIGO DO LABORATÓRIO</p><asp:TextBox runat="server" ID="TextBox1" placeholder="INDISPONIVEL" CssClass="text" ReadOnly="True" Enabled="False" style="display:none"></asp:TextBox>
            
            <p>NOME DO LABORATÓRIO</p><asp:TextBox runat="server" ID="nome" placeholder="NOME DO LABORATÓRIO" CssClass="text"></asp:TextBox>
            <br />
            <br />       
                <asp:Button ID="Buuton" runat="server" Text="ADICIONAR"  CssClass="cancelbtn" OnClick="Add_Click"/>
                <asp:Button runat="server" ID="Button4" Text="CANCELAR" CssClass="cancelbtn" PostBackUrl="~/WebFormCRUDLabs.aspx"/>
        </div>
       <div class="mid">
            <asp:DropDownList ID="idlab" runat="server" DataSourceID="ObjectDataSource1" DataTextField="nome" DataValueField="id"></asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
           <p>MODELO DE EQUIPAMENTO</p><asp:TextBox ID="modelo" runat="server" CssClass="text"></asp:TextBox>
           <p>QUANTIDADE</p><asp:TextBox ID="quant" runat="server" CssClass="text"></asp:TextBox>
           <br />
           <br />
           <asp:Button ID="Button5" runat="server" Text="ADICIONAR" CssClass="cancelbtn" OnClick="Button2_Click"  />
           <asp:Button ID="Button6" runat="server" Text="CANCELAR" CssClass="cancelbtn" OnClick="Button1_Click"  />

       </div> 
</asp:Content>
