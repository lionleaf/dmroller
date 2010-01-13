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
    <div id="inputareadiv" style="display:block;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="newMonsterUpdatePanel" runat="server">
            <ContentTemplate>
                <fieldset class="AddMobFieldset">
                <legend class="AddMobLegend">Add Monster</legend>
                <p>
                <label class ="AddMobLabel">Name</label>
                <asp:TextBox ID="mobName" runat="server" class="AddMobControl" Width="19.5em" onchange="javascript:Dat_Error(this, 'textnum')"></asp:TextBox>
                </p>
                <p>
                <label class ="AddMobLabel">Type</label>
                <select onchange="mobTypeChanged(this, mobHP, mobAP)" runat="server" id="mobType">
                    <option value="Normal">Normal</option>
                    <option value="Elite">Elite</option>
                    <option value="Solo">Solo</option>
                    <option value="Minion">Minion</option>
                </select>

                </p>
                <p>
                <label class ="AddMobLabel">HP</label>
                <asp:TextBox ID="mobHP" runat="server" class="AddMobControl" onchange="javascript:Dat_Error(this, 'num')">100</asp:TextBox>
                </p>
                <p>
                <div id="mobAbilities">
                <label class ="AddMobLabel">Action Points</label>
                <asp:TextBox ID="mobAP" runat="server" class="AddMobControl" Enabled="true" BackColor="GrayText" onchange="javascript:Dat_Error(this, 'num')"></asp:TextBox>
                    <p>
                    </p>
                    <p>
                        <label class="AddMobLabel">
                        Ability 1</label>
                        <asp:TextBox ID="mobAb1Name" runat="server" class="AddMobControl" 
                            ToolTip="Name of the Ability">asd</asp:TextBox>
                        <asp:TextBox ID="mobAb1Hit" runat="server" class="AddMobControl" 
                            ToolTip="How much bonus does the ability have on the attackroll? A single number">6</asp:TextBox>
                        <asp:TextBox ID="mobAb1Damage" runat="server" class="AddMobControl" 
                            ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                    </p>
                    <p>
                        <label class="AddMobLabel">
                        Ability 2</label>
                        <asp:TextBox ID="mobAb2Name" runat="server" class="AddMobControl" 
                            ToolTip="Name of the Ability">gads</asp:TextBox>
                        <asp:TextBox ID="mobAb2Hit" runat="server" class="AddMobControl" 
                            ToolTip="How much bonus does the ability have on the attackroll? A single number">9</asp:TextBox>
                        <asp:TextBox ID="mobAb2Damage" runat="server" class="AddMobControl" 
                            ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                    </p>
                    <p>
                        <label class="AddMobLabel">
                        Ability 3</label>
                        <asp:TextBox ID="mobAb3Name" runat="server" class="AddMobControl" 
                            ToolTip="Name of the Ability">gas</asp:TextBox>
                        <asp:TextBox ID="mobAb3Hit" runat="server" class="AddMobControl" 
                            ToolTip="How much bonus does the ability have on the attackroll? A single number">9</asp:TextBox>
                        <asp:TextBox ID="mobAb3Damage" runat="server" class="AddMobControl" 
                            ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                    </p>
                    </div> 
                    <input onclick="NewAbility()" type="button" value="New ability" /><br />
                    <asp:Button ID="checkButton" runat="server" onclick="checkButton_Click" 
                        Text="this button is better" />
                    <asp:Button ID="mobAddButton" runat="server" OnClick="AddMob" 
                        Text="Add Monster" />
                    <asp:Label ID="lab_output" runat="server" Text=""></asp:Label>
                </p>
                               
                    </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
