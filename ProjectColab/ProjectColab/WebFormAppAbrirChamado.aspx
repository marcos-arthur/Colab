<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormAppAbrirChamado.aspx.cs" Inherits="ProjectColab.WebFormAppAbrirChamado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style.css" />    
</head>
<body>
        <div>
            <header>
                <a class="titulo" >Abrir chamado </a>                
            </header>
            <br />
            <article>
                

                <div class="radios">
                    <div>
                        <a>Tipo de solicitação</a>                                 
                        <form>                    
                            <input type="radio" name="solic" value="veri"/> <a>Verificação</a>                    
                            <input type="radio" name="solic" value="inst"/> <a>Instalação</a>
                            <input type="radio" name="solic" value="manu"/> <a>Manutenção</a>                    
                        </form>
                    </div>
                    <div>
                        <a>Tipo de chamado</a>                                 
                        <form>                    
                            <input type="radio" name="cham" value="veri"/> <a>Externo</a>                    
                            <input type="radio" name="cham" value="inst"/> <a>Interno</a>
                        </form>
                    </div>
                </div>

                <div class="comboBox">
                    <select>
                        <option value="none">Laboratório</option>
                        <option value="lab1">Laboratório 1</option>
                        <option value="lab2">Laboratório 2</option>
                        <option value="lab3">Laboratório 3</option>                        
                    </select>
                </div>

                <div class="Maquinas">
                    <a>Máquinas</a>
                    <div>
                        <button>&#43;</button> 
                        <a>Adicionar</a>

                        <input type="checkbox" name="machi" class="machi" value="all"/> 
                        <a runat="server">Todas as máquinas</a>

                        <input type="text" class="tomb" />
                    </div>                    
                </div>

                <div class="desc">
                    <input type="text" name="desc"/>
                </div>
                
                <div class="buttons">
                    <button value="cancel">Cancelar</button>
                    <button value="confirm">Confirmar</button>
                </div>
            </article>
        </div>

    <asp:datalist runat="server"></asp:datalist>
</body>
</html>


<form runat="server">
    <!-- 
                    <div>
                    <header>Tipo de solicitação - HTML</header> 
                    <input type="radio" name="types" value="Verificação"/> <a>Verificação</a> <br />
                    <input type="radio" name="types" value="Instalação"/> <a>Instalação</a> <br />
                    <input type="radio" name="types" value="Manutenção"/> <a>Manutenção</a> <br />

                    <br />

                    <header>Tipo de solicitação - ASPX</header> 
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
                -->
</form>