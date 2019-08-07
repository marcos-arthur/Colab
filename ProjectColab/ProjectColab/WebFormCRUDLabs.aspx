<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCRUDLabs.aspx.cs" Inherits="ProjectColab.WebFormCRUDLabs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:hyperlink ID="inserir" NavigateUrl="~//WebFormAddLab.aspx" runat="server"  Text="Inserir laboratório"></asp:hyperlink>
            <br />
            <asp:HyperLink ID="atualizar" NavigateUrl="~//WebFormUpdateLab.aspx" runat="server" Text="Atualizar laboratório"></asp:HyperLink>            
        </div>
    </form>
</body>
</html>
