<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PageMasterBolsista.Master" CodeBehind="WebFormAddChamadoBolsista.aspx.cs" Inherits="ProjectColab._3_Bolsista.WebFormAddChamadoBolsista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="column middle">
                <asp:TextBox ID="status" runat="server" style="display:none" CssClass="text"></asp:TextBox>
                <asp:TextBox ID="id" runat="server" style="display:none" CssClass="text"></asp:TextBox>

                <p>RESUMO DO PROBLEMA</p>
                <asp:TextBox ID="resumo" runat="server" CssClass="text"></asp:TextBox>      
                <asp:Label ID="MsgErroresumop" runat="server" ForeColor="Red"></asp:Label>
                
                <p>QUANTIDADE DE EQUIPAMENTOS DEFEITUOSOS</p>
                <asp:TextBox ID="quantidadeeq" runat="server" type="number" CssClass="text"></asp:TextBox>
              <asp:Label ID="MsgErromaqdef" runat="server" ForeColor="Red"></asp:Label>


                <p>Laboratório</p>
                <asp:DropDownList ID="labDrop" runat="server" DataTextField="nome" DataValueField="id" CssClass="text" DataSourceID="ObjectDataSource2"></asp:DropDownList>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio"></asp:ObjectDataSource>
                <asp:Label ID="MsgErrolab" runat="server" ForeColor="Red"></asp:Label>   
              
                <!--<asp:DropDownList ID="idnome" runat="server" DataSourceID="ObjectDataSource2" DataTextField="nome" DataValueField="nome"></asp:DropDownList>-->
                
                <br />
                <br />
                <asp:Button ID="add" runat="server" Text="ADICIONAR"   CssClass="btn" OnClick="add_Click1"/>
                <asp:Button ID="Button1" runat="server" Text="CANCELAR"   CssClass="btn" OnClick="Button1_Click"/>  
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

