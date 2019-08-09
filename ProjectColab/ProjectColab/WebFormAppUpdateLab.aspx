<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAppUpdateLab.aspx.cs" Inherits="ProjectColab.WebFormAppUpdateLab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Nome do Laboratório</p>
            <asp:DropDownList runat="server"></asp:DropDownList>

            <p>Quantidade de máquinas</p>
            <asp:TextBox runat="server" ID="qtd"></asp:TextBox>

            <p>Modelo</p>
            <asp:TextBox runat="server" ID="mdl"></asp:TextBox>

            <br />
            <br />
            <asp:Button runat="server" ID="add" Text="Adicionar"/>
            <asp:Button runat="server" ID="cancel" Text="Cancelar"/>
            <asp:Button runat="server" ID="remove" Text="Remover"/>
        </div>
    </form>
</body>
</html>
