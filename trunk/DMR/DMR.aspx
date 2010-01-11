<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DMR.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="dat_ass.js"></script>
    <style type="text/css">
    .inputdiv
    {
    	float:left;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="static"><h1>ah herro wercome</h1></div>
    <div id="maindiv">
    <input type="button" onclick="ToggleVisibility('maindiv', 'inputareadiv')" value="Create New Monster"/>
    </div>
    <div id="inputareadiv" style="display:none;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                <legend>Monster Info</legend>
                <tr>
                    <td>What</td><td>input</td><td>help</td>
                </tr>
                <tr>
                    <td>Name:</td><td><asp:TextBox ID="txt_mobname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Type:</td>
                    <td>
                        <asp:DropDownList ID="ddl_mobType" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="ddl_mobType_SelectedIndexChanged">
                            <asp:ListItem>Standard</asp:ListItem>
                            <asp:ListItem>Elite</asp:ListItem>
                            <asp:ListItem>Solo</asp:ListItem>
                            <asp:ListItem>Minion</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>HP:</td><td><asp:TextBox ID="txt_mobHP" runat="server"></asp:TextBox></td><td>current/max || max</td>
                </tr>
                <tr>
                    <td>Action Points:</td><td><asp:TextBox ID="txt_mobAP" runat="server" Enabled="false" Width="25"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ability 1:</td><td><asp:TextBox ID="txt_mobAb1Name" runat="server" ></asp:TextBox>
                        <asp:TextBox ID="txt_mobAb1Hit" runat="server" Width="80"></asp:TextBox>
                        <asp:TextBox ID="txt_mobAb1DMG" runat="server" Width="80"></asp:TextBox>
                    </td>
                    <td>Name|[hit]|dmg</td>
                </tr>
                <tr>
                    <td>Ability 2:</td><td><asp:TextBox ID="txt_mobAb2Name" runat="server" ></asp:TextBox>
                        <asp:TextBox ID="txt_mobAb2Hit" runat="server" Width="80"></asp:TextBox>
                        <asp:TextBox ID="txt_mobAb2DMG" runat="server" Width="80"></asp:TextBox>
                     </td>
                    <td>Name|[hit]|dmg</td>
                </tr>
                </table>
                    <asp:Button ID="btn_submit" runat="server" Text="Button" OnClick="btn_submit_Click"/>
                    <asp:Label ID="lab_output" runat="server" Text=""></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
