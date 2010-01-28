<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMob.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DMR</title>
    <script type="text/javascript" src="dat_ass.js"></script>
    <script type="text/javascript" src="JScript.js"></script>
    <link rel="Stylesheet" type="text/css" href="css.css" />
</head>
<body>

<script type="text/javascript">
    var abilities = 1;
    function AddMob() {
        var abName = document.getElementById('mobAb1Name');
        var abHit = document.getElementById('mobAb1Hit');
        var abDamage = document.getElementById('mobAb1Damage');
        for (var i = 2; i <= abilities; i++) {
            abName.value += ";";
            abName.value += document.getElementById('mobAb' + i + 'Name').value;
            abHit.value += ";";
            abHit.value += document.getElementById('mobAb' + i + 'Hit').value;
            abDamage.value += ";";
            abDamage.value += document.getElementById('mobAb' + i + 'Damage').value;
        }

        document.getElementById('hiddenSubmit').click();
        window.opener.document.getElementById('refreshButton').click();
        window.close();
        

    }
    function NewAbility(divID) {
        var d = document.getElementById(divID);
        abilities++;
        d.innerHTML += '<p>';
        d.innerHTML += '<label class=\"AddMobLabel\">Ability</label>';
        d.innerHTML += '<input type\"Textbox\" ID=\"mobAb' + abilities + 'Name\" class=\"AddMobControl\" ToolTip=\"Name of the Ability\"></input>';
        d.innerHTML += '<input type=\"Textbox\" ID=\"mobAb' + abilities + 'Hit\" class=\"AddMobControl\" ToolTip=\"How much bonus does the ability have on the attackroll? A single number\"></input>';
        d.innerHTML += '<input type=\"Textbox\" ID=\"mobAb' + abilities + 'Damage\" class=\"AddMobControl\" ToolTip=\"Damage, formatted like this: \'2d8+5d6+7\'\"></input>';
        d.innerHTML += '</p>';
    }

</script>
    <div id="AddMobDiv">    
    <form id="AddMobForm" runat="server">
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
                
                <label class ="AddMobLabel">Action Points</label>
                <asp:TextBox ID="mobAP" runat="server" class="AddMobControl" Enabled="true" BackColor="GrayText"  onchange="javascript:Dat_Error(this, 'num')"></asp:TextBox>
                    <p>
                    </p>
                    <div id="mobAbilities">
                    <p>
                        <label class="AddMobLabel">
                        Ability</label>
                        <asp:TextBox ID="mobAb1Name" runat="server" class="AddMobControl" 
                            ToolTip="Name of the Ability">asd</asp:TextBox>
                        <asp:TextBox ID="mobAb1Hit" runat="server" class="AddMobControl" 
                            ToolTip="How much bonus does the ability have on the attackroll? A single number">6</asp:TextBox>
                        <asp:TextBox ID="mobAb1Damage" runat="server" class="AddMobControl" 
                            ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                    </p>
                    </div> 
                    <input onclick="javascript:NewAbility('mobAbilities')" class="Button" type="button" value="New ability" /><br />
                    <input type="button" class="Button" onclick="javascript:AddMob()" 
                        value="Add Monster" />
                        <asp:Button runat="server" ID="hiddenSubmit" OnClick="AddMob" Text="" class="hidden"/>
                    <asp:Label ID="lab_output" runat="server" Text=""></asp:Label>
                    <p>
                    </p>
                    
                    <p>
                    </p>
                    
                </p>
                               
                    </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    </div>
    
</body>
</html>
