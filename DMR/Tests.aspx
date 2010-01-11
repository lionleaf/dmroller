<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Tests.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="stylesheet" type="text/css" href="css.css" />
<script type="text/javascript" src="JScript.js"></script>
<script type="text/javascript" src="JSDice.js"></script>
<script type="text/javascript" src="FloatDiv.js"></script>
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox ID="txt_diceString" runat="server"></asp:TextBox><asp:Button ID="btn_save"
            runat="server" Text="Save DiceSet" OnClick="SaveDiceSet" />
            <asp:Button ID="btn_roll" runat="server" Text="Roll"  OnClick="Roll"/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            
            
            <asp:Button ID="Generate" runat="server" Text="Generate Monster" 
                onclick="Generate_Click" />
                              
            <!-- Test of the monster layout
            <div id="Monsterdiv" class="Monster" >
            <span class="Drag" onmousedown="dragStart(event, 'Monsterdiv')">Drag me</span>
            <ul class="Monster">
            <li class="Monstername">Orcus</li>
            <li class="Health"><b>HP:</b>10 (<b>Max:</b>100; <b>Bloodied:</b>50)</li>
            <li class="Abilityname">Super Power</li>
            <li class="Ability">+19 vs AC; 2d8+5</li>
            <li class="Abilityname">Another Power</li>
            <li class="Ability">+19 vs AC; 2d8+5</li>
            <li class="Abilityname">Awesome Power</li>
            <li class="Ability">+19 vs AC; 2d8+5</li>
            <li class="Hit">12=2[d8]+5[d9]+5</li>
            <li class="Damage">20=8[d8]+5[d9]+7</li>
            </ul>
            </div>
            -->
            </ContentTemplate>
            </asp:UpdatePanel>
                      
    </div>
    
    </form>
</body>
</html>
