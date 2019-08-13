<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAddLab.aspx.cs" Inherits="ProjectColab.WebFormAddLab" %>

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
            <asp:TextBox runat="server" ID="name"></asp:TextBox>

            <p>Quantidade de máquinas</p>
            <asp:TextBox runat="server" ID="qtd"></asp:TextBox>

            <p>Modelo</p>
            <asp:TextBox runat="server" ID="mdl"></asp:TextBox>

            <br />
            <br />
            <asp:Button runat="server" ID="add" Text="Adicionar" OnClick="saveButton"/>
            <asp:Button runat="server" ID="cancel" Text="Cancelar"/>

        </div>
    </form>
</body>
</html>
