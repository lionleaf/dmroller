<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Tests.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txt_diceString" runat="server"></asp:TextBox><asp:Button ID="btn_save"
            runat="server" Text="Save DiceSet" OnClick="SaveDiceSet" />
            <asp:Button ID="btn_roll" runat="server" Text="Roll"  OnClick="Roll"/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    
    </form>
</body>
</html>
