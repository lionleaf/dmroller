﻿function ToggleVisibility(one, two) //Toggles visibility between two divs
    {
        if (document.getElementById('one').style.display == "none")
        {
            document.getElementById('one').style.display = "block";
            document.getElementById('two').style.display = "none";
        }
        else
        {
            document.getElementById('one').style.display = "none";
            document.getElementById('two').style.display = "block";
        }
    }
function mobTypeChanged(list, HPBox, APBox)//I HOPE I CAN KILL AND STAY THE SAME NANAENINAUNUN UN UNU NUNNNAEN
    {
        switch (list.value)
        {
            case "Minion":
                HPBox.value = "1";
                APBox.value = "0";
                APBox.disabled = "disabled";
                HPBox.disabled = "disabled";
                break;
            case "Elite":
                APBox.value = "1";
                APBox.disabled = "disabled";
                HPBox.disabled = "";
            break;
            case "Solo":
                APBox.value = "2";
                APBox.disabled = "disabled";
                HPBox.disabled = "";
            break;
            case "Normal":
                APBox.value = "";
                APBox.disabled = "";
                HPBox.disabled = "";
            break;
            default:
            break;
        
        }
    }
