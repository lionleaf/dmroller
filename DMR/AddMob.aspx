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
    var abilities = 1; //The amount of ability the mob has.

    function verifyForm() {
        var error = false; //Set to true if something is wrong. Has to make sure not to return upon first error.
        
        var mobName = document.getElementById('mobName');   //Find all the elements
        var mobHP = document.getElementById('mobHP');

        mobName.setAttribute('style', 'background-color:;');  //Set color back to default (incase it was red, but is fine now)
        mobHP.setAttribute('style', 'background-color:;');
        

        if (Dat_Error(mobName, 'text')) {
            mobName.setAttribute('style', 'background-color:red;');
            error = true;
        }
        if (Dat_Error(mobHP, 'num')) {
            mobHP.setAttribute('style', 'background-color:red;');
            error = true;
        }
        
        // Loop through the fields that we don't know how many we've got of.
        for (var i = 1; i <= abilities; i++) {

            var abName = document.getElementById('mobAb' + abilities + 'Name');
            var abHit = document.getElementById('mobAb' + abilities + 'Hit');
            var abDamage = document.getElementById('mobAb' + abilities + 'Damage');

            abName.setAttribute('style', 'background-color:;');
            abHit.setAttribute('style', 'background-color:;');
            abDamage.setAttribute('style', 'background-color:;');
            
            
            if (Dat_Error(abName, 'text')) {
                abName.setAttribute('style', 'background-color:red;');
                error = true;
            }
            if (Dat_Error(abHit, 'num')) {
                abHit.setAttribute('style', 'background-color:red;');
                error = true;
            }
            if (Dat_Error(abDamage, 'dice')) {
                abDamage.setAttribute('style', 'background-color:red;');
                error = true;
            }
            
        }

        if (error)
            return false;
        else
            return true;
    }
    
    function AddMob() //This is what happens when you add a mob.
    {
        var mobName = document.getElementById('mobName');
        var mobHP = document.getElementById('mobHP');
        var abName = document.getElementById('mobAb1Name');
        var abHit = document.getElementById('mobAb1Hit');
        var abDamage = document.getElementById('mobAb1Damage');
        var abInfo = document.getElementById('mobAb1Info');
    
        if (!verifyForm()) {  //Check that all fields are OK before doing anything.
            alert("Please fill all fields correctly!");
        }
        else {

            abHit.value += "x";
            abHit.value += document.getElementById('mobAb1Def').value;
            for (var i = 2; i <= abilities; i++) {
             /*In order to submit the data to the server, we copy all the entered data from the generated boxes and put them in the first one. 
             i starts as 2, because the first generated ability is number 2.
             The abName field will end up like this: name1;name2;name3
             And then the dmg etc will match: dmg1;dmg2;dmg3
             Because we cannot accumulate text in the dropdown, the value will be added to the hit:
             hitxdef;hitxdef;hitxdef
             You're not allowed to put x in hit anyway.
                
                */
                abName.value += ";";
                abName.value += document.getElementById('mobAb' + i + 'Name').value;
                abHit.value += ";";
                abHit.value += document.getElementById('mobAb' + i + 'Hit').value;
                abHit.value += "x";
                abHit.value += document.getElementById('mobAb' + i + 'Def').value;
                abDamage.value += ";";
                abDamage.value += document.getElementById('mobAb' + i + 'Damage').value;
                abInfo.value += ";";
                abInfo.value += document.getElementById('mobAb' + i + 'Info').value;
            }

            document.getElementById('hiddenSubmit').click(); //Clicks the 'submit' button to get the C# code cracking.
            window.opener.document.getElementById('refreshButton').click(); //Hits the refresh button.
            window.close(); //Closes the window.
        }
    }
    function NewAbility(divID) //In turn, this is what happens when you add a new ability input field.
    {
        var d = document.getElementById(divID);
        var tempString = "";

        abilities++;
        
        
        //Generate the html for a new ability:
        tempString += '<p>';
        tempString += '<label class=\"AddMobLabel\">Ability</label>\n';
        tempString += '<fieldset class=\"AbilityFieldset\">';
        tempString += '<label class=\"abLabel\">Name</label>';
        tempString += '<input type\"text\" ID=\"mobAb' + abilities + 'Name\" class=\"AddMobAbName\" ToolTip=\"Name of the Ability\"></input>';
        tempString += '<br />';
        tempString += '<label class=\"abLabel\">Hit</label>';
        tempString += '<input type=\"text\" ID=\"mobAb' + abilities + 'Hit\" class=\"AddMobAbHit\" ToolTip=\"How much bonus does the ability have on the attackroll? A single number\"></input>';
        tempString += 'vs';
        tempString += '<select id=\"mobAb' + abilities + 'Def\" class=\"AddMobAbDef\"> <option value=\"AC\">AC</option><option value=\"Reflex\">Reflex</option><option value=\"Fortitude\">Fortitude</option><option value=\"Will\">Will</option></select>';
        tempString += '<br />';
        tempString += '<label class=\"abLabel\">Damage</label>';
        tempString += '<input type=\"text\" ID=\"mobAb' + abilities + 'Damage\" class=\"AddMobAbDamage\" ToolTip=\"Damage, formatted like this: \'2d8+5d6+7\'\"></input>';
        tempString += '<br />';
        tempString += '<label class=\"abLabel\">Info</label>';
        tempString += '<textarea id=\"mobAb' + abilities + 'Info\" class=\"AddMobAbInfo\" tooltip=\"Additional info about the ability. Optional.\"></textarea>';
        tempString += '</fieldset>';
        tempString += '</p>';

        d.innerHTML += tempString; //Add the generated html code to the bottom of the div!
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
                <asp:TextBox ID="mobName" runat="server" class="AddMobName" ></asp:TextBox>
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
                <asp:TextBox ID="mobHP" runat="server" class="AddMobControl">100</asp:TextBox>
                </p>
                
                <p>
                
                <label class ="AddMobLabel">Action Points</label>
                <asp:TextBox ID="mobAP" runat="server" class="AddMobControl" Enabled="true" BackColor="GrayText" ></asp:TextBox>
                    </p>
                 
                    <div id="mobAbilities">
                    <p>
                    <label class="AddMobLabel">Ability</label>
                    
                    
                    <fieldset class="AbilityFieldset">
                    
                        <label class="abLabel">Name</label>
                        <asp:TextBox ID="mobAb1Name" runat="server" class="AddMobAbName" 
                            ToolTip="Name of the Ability">Name</asp:TextBox>
                            <br />
                        <label class="abLabel">Hit</label>
                        <asp:TextBox ID="mobAb1Hit" runat="server" class="AddMobAbHit" 
                            ToolTip="How much bonus does the ability have on the attackroll? A single number">6</asp:TextBox>
                        vs
                        <select runat="server" id="mobAb1Def" class="AddMobAbDef">
                            <option value="AC">AC</option>
                            <option value="Reflex">Reflex</option>
                            <option value="Fortitude">Fortitude</option>
                            <option value="Will">Will</option>
                        </select>
                        <br />
                        <label class="abLabel">Damage</label>
                        <asp:TextBox ID="mobAb1Damage" runat="server" class="AddMobAbDamage" 
                            ToolTip="Damage, formatted like this: '2d8+5d6+7'">2d8+5d6+7</asp:TextBox>
                            <br />
                            <label class="abLabel">Info</label>
                            <asp:TextBox TextMode="MultiLine" ID="mobAb1Info" runat="server" class="AddMobAbInfo" 
                            ToolTip="Name of the Ability">Additional info (optional)</asp:TextBox>
                    
                    </fieldset>
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
