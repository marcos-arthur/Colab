<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormAddChamado.aspx.cs" Inherits="ProjectColab.WebFormAddChamado" %>
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
                <asp:DropDownList ID="labDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="inputtext" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
                <asp:Label ID="MsgErrolab" runat="server" ForeColor="Red"></asp:Label>   
            <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->
                
                <br />
                <br />
                <asp:LinkButton ID="Button2" runat="server" CssClass="botaoadd" OnClick="add_Click1"><i class="fa fa-check"></i><p>ADICIONAR</p></asp:LinkButton>
                <asp:LinkButton ID="Button3" runat="server" CssClass="botaoadd" OnClick="Button1_Click"><i class="fa fa-remove"></i> CANCELAR</asp:LinkButton>
            </div>
         </div>

    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            <div class="column side">
                <div class="content2">
                    <div class="indicador"><a class="sub-title">CHAMADOS SEM ATRIBUIÇÃO</a></div>
                    <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "noCount")%></a>
                    <asp:Button runat="server" ID="Button2" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button2_Click"/>
                </div>  
            </div>
            <div class="column side">
                <div class="content2">
                    <div class="indicador"><a class="sub-title">CHAMADOS ATRIBUIDOS A MIM</a></div>
                    <a class="sub-first"> <%# DataBinder.Eval(Container.DataItem, "myCount")%></a>
                    <asp:Button runat="server" ID="Button5" Text="VISUALIZAR CHAMADOS" CssClass="btn small" OnClick="Button5_Click"/>
                </div>  
            </div>
        </ItemTemplate>
    </asp:Repeater>

    </div>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
     </asp:ObjectDataSource>
</asp:Content>
