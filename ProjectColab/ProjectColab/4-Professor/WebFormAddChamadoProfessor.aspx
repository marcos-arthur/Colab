<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterProfessor.Master" CodeBehind="WebFormAddChamadoProfessor.aspx.cs" Inherits="ProjectColab._4_Professor.WebFormAddChamadoProfessor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="mid">
                <asp:TextBox ID="status" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="id" runat="server" style="display:none" CssClass="text"></asp:TextBox>

                <p>RESUMO DO PROBLEMA</p>
                <asp:TextBox ID="resumo" runat="server" CssClass="text"></asp:TextBox>            
                <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>
                
                <p>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</p>
                <asp:TextBox ID="quantidadeeq" runat="server" type="number" CssClass="text"></asp:TextBox>
                <asp:Label ID="MsgErromaqdef" runat="server" ForeColor="Red"></asp:Label>

                <p>SALA</p>
                <asp:DropDownList ID="salaDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="text" AutoPostBack="True" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALSalas"></asp:ObjectDataSource>
                <asp:DropDownList ID="catDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtextDrop" DataSourceID="ObjectDataSource1"></asp:DropDownList>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALCategoria"></asp:ObjectDataSource>
                <asp:Label ID="MsgErrosalas" runat="server" ForeColor="Red"></asp:Label>   
                
                 <i class="fa fa-desktop"></i><asp:DropDownList ID="modeloDrop" runat="server" DataTextField="modelo" DataValueField="id" CssClass="inputsearch2 inputToAdd" DataSourceID="ObjectDataSource3" ></asp:DropDownList>
                             <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectFromSala" TypeName="ProjectColab.DAL.DALEquipamento">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="salaDrop" DefaultValue="0" Name="idsala" PropertyName="SelectedValue" Type="String" />
                                 </SelectParameters>
                            </asp:ObjectDataSource>
                <asp:CheckBox ID="CheckBox2" runat="server" Text="Todos"/>

                <asp:CheckBox ID="CheckBox1" runat="server" Text="Todos"/>
                <i class="fa fa-desktop"></i><asp:TextBox ID="tombamento" runat="server" Placeholder="DIGITE AQUI OS TOMBAMENTOS" CssClass="inputsearch2 inputToAdd"></asp:TextBox>

                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ADICIONAR"   CssClass="cancelbtn" OnClick="add_Click1"/>
                <asp:Button ID="Button1" runat="server" Text="CANCELAR"   CssClass="cancelbtn" PostBackUrl="~/4-Professor/WebFormCRUDChamadoProfessor.aspx" />
            </div>   
</asp:Content>
