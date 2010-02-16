<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlayEncounter.aspx.cs" Inherits="PlayEncounter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Encounter</title>
    <script type="text/javascript" src="dat_ass.js"></script>
    <script type="text/javascript" src="JScript.js"></script>
    <script type="text/javascript" src="FloatDiv.js"></script>
    <script type="text/javascript" src="JSDice.js"></script>
    <link rel="Stylesheet" type="text/css" href="css.css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
    <div>
    <asp:Button Text="Refresh" runat="server" ID="refreshButton" 
            onclick="refreshButton_Click" />
    <asp:Label ID="Monsters" runat="server" ></asp:Label>
    
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <button onclick="javascript:window.open('./AddMob.aspx',
    'AddMonster','toolbar=0,location=0,directories=0,menubar=0,width=450')">Click me</button>
    
    </form>
</body>
</html>
