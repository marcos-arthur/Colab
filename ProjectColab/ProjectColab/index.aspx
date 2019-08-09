<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectColab.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <head>
	<title>COLAB</title>
	<link rel="shortcut icon" href="Logo.png" >
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

	<div class="top">
		<img src="Imangens/Logo.png">
	</div>
	<div class="menu">
        <asp:HyperLink ID="HyperLink2" runat="server">DASHBOARD</asp:HyperLink>
        <asp:HyperLink ID="HyperLink3" runat="server">BASE DE TUTORIAIS</asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server">REQUISIÇÕES</asp:HyperLink>
	</div>
    <div class="title">
			<a>DASHBOARD</a>	
	</div>

</body>
        </div>
    </form>
</body>
</html>
