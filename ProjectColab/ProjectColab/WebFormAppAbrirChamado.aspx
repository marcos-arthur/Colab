<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAppAbrirChamado.aspx.cs" Inherits="ProjectColab.WebFormAppAbrirChamado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <a class="titulo" >Abrir chamado </a>                
            </header>
            <br />
            <article>
                <div>
                    <header>Tipo de solicitação - HTML</header> <!-- Baseada em divs -->
                    <input type="radio" name="types" value="Verificação"/> <a>Verificação</a> <br />
                    <input type="radio" name="types" value="Instalação"/> <a>Instalação</a> <br />
                    <input type="radio" name="types" value="Manutenção"/> <a>Manutenção</a> <br />

                    <br />

                    <header>Tipo de solicitação - ASPX</header> <!-- Baseada em Tables -->
                    <asp:RadioButtonList runat="server">
                        <asp:ListItem Value="Verif">Verificação</asp:ListItem>
                        <asp:ListItem Value="Inst">Instalação</asp:ListItem>
                        <asp:ListItem Value="Manu">Manutenção</asp:ListItem>
                    </asp:RadioButtonList>

                    <asp:RadioButton runat="server" />

                    <div ID="div1" runat="server">
                        <%#Eval("ActualContent")%> 
                    </div>
                </div>
            </article>
        </div>
    </form>
</body>
</html>
