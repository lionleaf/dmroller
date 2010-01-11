<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DMR.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DMR</title>
    <script type="text/javascript" src="dat_ass.js"></script>
    <script type="text/javascript" src="JScript.js"></script>
    <script type="text/javascript" src="JSDice.js"></script>
    <script type="text/javascript" src="FloatDiv.js"></script>
    <link rel="Stylesheet" type="text/css" href="css.css" />
</head>
<body>
    <form id="MainForm" runat="server">
    <div id="static"><h1>ah herro wercome</h1></div>
    <div id="maindiv">
            <asp:Label runat="server" ID="MainLabel" Text=""></asp:Label>
    <input type="button" onclick="ToggleVisibility('maindiv', 'inputareadiv')" value="Create New Monster"/>
    </div>
    <div id="inputareadiv" style="display:none;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="newMonsterUpdatePanel" runat="server">
            <ContentTemplate>
                <!-- Hide this table shit 
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
                -->
                
                <fieldset class="AddMobFieldset">
                <legend class="AddMobLegend">Add Monster</legend>
                <p>
                <label class ="AddMobLabel">Name</label>
                <asp:TextBox ID="mobName" runat="server" class="AddMobControl" Width="19.5em">Andreas</asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Type</label>
                <asp:DropDownList ID="mobType" runat="server" class="AddMobControl" AutoPostBack="True" 
                            onselectedindexchanged="ddl_mobType_SelectedIndexChanged">
                            <asp:ListItem>Minion</asp:ListItem>
                            <asp:ListItem>Standard</asp:ListItem>
                            <asp:ListItem>Elite</asp:ListItem>
                            <asp:ListItem>Solo</asp:ListItem>
                            </asp:DropDownList>
                </p>
                <p>
                <label class ="AddMobLabel">HP</label>
                <asp:TextBox ID="mobHP" runat="server" class="AddMobControl">100</asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Action Points</label>
                <asp:TextBox ID="mobAP" runat="server" class="AddMobControl" Enabled="false" BackColor="GrayText"></asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Ability 1</label>
                <asp:TextBox ID="mobAb1Name" runat="server" class="AddMobControl" ToolTip="Name of the Ability">asd</asp:TextBox>
                <asp:TextBox ID="mobAb1Hit" runat="server" class="AddMobControl" ToolTip="How much bonus does the ability have on the attackroll? A single number">6</asp:TextBox>
                <asp:TextBox ID="mobAb1Damage" runat="server" class="AddMobControl" ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Ability 2</label>
                <asp:TextBox ID="mobAb2Name" runat="server" class="AddMobControl" ToolTip="Name of the Ability">gads</asp:TextBox>
                <asp:TextBox ID="mobAb2Hit" runat="server" class="AddMobControl" ToolTip="How much bonus does the ability have on the attackroll? A single number">9</asp:TextBox>
                <asp:TextBox ID="mobAb2Damage" runat="server" class="AddMobControl" ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Ability 3</label>
                <asp:TextBox ID="mobAb3Name" runat="server" class="AddMobControl" ToolTip="Name of the Ability">gas</asp:TextBox>
                <asp:TextBox ID="mobAb3Hit" runat="server" class="AddMobControl" ToolTip="How much bonus does the ability have on the attackroll? A single number">9</asp:TextBox>
                <asp:TextBox ID="mobAb3Damage" runat="server" class="AddMobControl" ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                </p>
                
                
                    <asp:Button ID="mobAddButton" runat="server" Text="Add Monster" OnClick="AddMob"/>
                    <asp:Label ID="lab_output" runat="server" Text=""></asp:Label>
                    </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
