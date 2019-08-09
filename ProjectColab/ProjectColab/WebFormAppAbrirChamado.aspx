<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAppAbrirChamado.aspx.cs" Inherits="ProjectColab.WebFormAppAbrirChamado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style.css" />    
</head>
<body runat="server">
        <form runat="server">
            <header>
                <a class="titulo" >Abrir chamado </a>                
            </header>
            <br />
            <article runat="server">                
                <div class="radios">
                    <div>
                        <a>Tipo de solicitação</a>  <br />                               
                        <div>                    
                            <asp:RadioButton runat="server" ID="veri" CssClass="radio" Text="teste" GroupName="solic" />
                            <asp:RadioButton runat="server" ID="inst" CssClass="radio" Text="Instalação" GroupName="solic"/>
                            <asp:RadioButton runat="server" ID="manu" CssClass="radio" Text="Manutenção" GroupName="solic"/>                                   
                        </div>
                    </div> 
                    <br />
                    <br />
                    <div> 
                        <a>Tipo de chamado</a> <br />                                 
                        <div>
                            <asp:RadioButton runat="server" ID="extern" CssClass="radio" Text="Externo" GroupName="cham" />
                            <asp:RadioButton runat="server" ID="intern" CssClass="radio" Text="Interno" GroupName="cham"/>                            
                        </div>
                    </div>
                </div>

                <asp:DropDownList runat="server" CssClass="dropDown">
                    <asp:ListItem Value="none">Laboratório </asp:ListItem>
                    <asp:ListItem Value="lab1">Laboratório 1</asp:ListItem>
                    <asp:ListItem Value="lab2">Laboratório 2</asp:ListItem>                    
                </asp:DropDownList>

                <div class="Maquinas">
                    <a>Máquinas</a>
                    <div>
                        <asp:Button runat="server" Text="&#43;" value="add"></asp:Button> 
                        <a>Adicionar</a>

                        <asp:CheckBox runat="server" ID="all" Text="Todas as máquinas" CssClass="machi"/>                                                

                        <input type="text" class="tomb" />
                    </div>                    
                </div>

                <div class="desc">
                    <asp:TextBox runat="server" ID="name" CssClass="Text" />
                </div>
                
                <div class="buttons" runat="server">
                    <asp:Button runat="server" value="cancel" Text="Cancelar"></asp:Button>
                    <button value="confirm">Confirmar</button>
                </div>
            </article>
        </form>
</body>
</html>
