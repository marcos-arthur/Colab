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
            <div class="titulo">Abrir chamado </div>
            <article>
                <div>
                    <a>Tipo de solicitação</a>
                    <input type="radio" name="types" value="Verificação"/>
                    <input type="radio" name="types" value="Instalação"/>
                    <input type="radio" name="types" value="Manutenção"/>
                </div>
            </article>
        </div>
    </form>
</body>
</html>
