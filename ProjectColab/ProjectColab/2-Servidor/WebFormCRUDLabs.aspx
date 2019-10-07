<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
    <div class="column middle">
             <asp:GridView ID="GridView1"  Height="20%" Width="90%" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnRowCommand="GridView1_RowCommand" DataKeyNames="id">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="id" HeaderText="ID DO LABORÁTORIO" SortExpression="id" />
                     <asp:BoundField DataField="nome" HeaderText="NOME DO LABORATÓRIO" SortExpression="nome" />                                  
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#8f3d3d" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#8f3d3d" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="WHITE" HorizontalAlign="Center"/>
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>
             <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ProjectColab.Modelo.Laboratorios" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ProjectColab.DAL.DALLaboratorio" UpdateMethod="Update"></asp:ObjectDataSource>


         <asp:Button ID="Button2" runat="server" Text="ADICIONAR LABORATÓRIO" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormAddLab.aspx" />    
    
        </div>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
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
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectChamados" TypeName="ProjectColab.DAL.DALConsulta">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="idusuario" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>