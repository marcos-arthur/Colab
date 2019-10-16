<%@ Page Title="" Language="C#" MasterPageFile="~/PageMasterServidor.Master" AutoEventWireup="true" CodeBehind="IndexServidor.aspx.cs" Inherits="ProjectColab.IndexServidorTeste" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>            
                  <div class="column middle" >
                          <div class="indicador"><a class="title">DASHBOARD</a></div>
                      <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADOS ABERTOS</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "countAberto")%></a>
                         <div class="bot"><asp:Button runat="server" ID="Button1" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDChamado.aspx" /></div> 
                      </div>
                      <div class="article">
                            <div class="iconchamado"><i class="fa fa-bell"></i> <a class="text chamadoid">CHAMADOS FECHADOS</a></div>
                         <a class="first"> <%# DataBinder.Eval(Container.DataItem, "countFechado")%></a>
                         <div class="bot"><asp:Button runat="server" ID="Button2" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormChamadosFechadosServidor.aspx" /></div> 
                      </div>
                  </div>                                             
        </ItemTemplate>
    </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectChamadoDash" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:Repeater runat="server" ID="Repeater2" DataSourceID="ObjectDataSource2">
        <ItemTemplate>
            <div class="column middle" >
                      <div class="content">
                          <div class="article">                                
                              <div class="iconchamado"><i class="fa fa-book"></i> <a class="text chamadoid">TUTORIAIS CONFIRMADOS</a></div>
                                <a class="first"> <%# DataBinder.Eval(Container.DataItem, "tutoCount")%></a>
                              <div class="bot"><asp:Button runat="server" ID="Button5" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDTutorial.aspx" /></div> 
                          </div>
                          <div class="article">                             
                                <div class="iconchamado"><i class="fa fa-book"></i> <a class="text chamadoid">TUTORIAIS EM ANÁLISE</a></div>
                              <a class="first"> <%# DataBinder.Eval(Container.DataItem, "tutoCountAnalise")%></a>
                             <div class="bot"> <asp:Button runat="server" ID="Button6" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormTutorialSubmetido.aspx"/></div> 
                          </div>
                      </div>   
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelecTutoAll" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>

    <asp:Repeater runat="server" ID="Repeater3" DataSourceID="ObjectDataSource3">
        <ItemTemplate>
                      <div class="content">
                            <div class="article">                              
                                <div class="iconchamado"><i class="fa fa-desktop"></i> <a class="text chamadoid">laboratórios</a></div>
                                <a class="first"> <%# DataBinder.Eval(Container.DataItem, "labCount")%></a>
                             <div class="bot"> <asp:Button runat="server" ID="Button3" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDLabs.aspx" /></div> 
                          </div>                          
                      </div> 
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="SelectLabDash" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>

    <asp:Repeater runat="server" ID="Repeater4" DataSourceID="ObjectDataSource4">
        <ItemTemplate>
                      <div class="content">
                            <div class="article">                              
                                <div class="iconchamado"><i class="fa fa-desktop"></i> <a class="text chamadoid">equipamentos</a></div>
                                <a class="first"> <%# DataBinder.Eval(Container.DataItem, "EquipCount")%></a>
                             <div class="bot"> <asp:Button runat="server" ID="Button3" Text="VISUALIZAR" CssClass="btn" PostBackUrl="~//2-Servidor/WebFormCRUDLabs.aspx" /></div> 
                          </div>                          
                      </div>
                  </div>    
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="SelectEquipDash" TypeName="ProjectColab.DAL.DALConsulta">
    </asp:ObjectDataSource>
</asp:Content>