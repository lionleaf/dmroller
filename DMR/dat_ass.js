function ToggleVisibility(one, two) //Toggles visibility between two divs
    {
        if (document.getElementById(one).style.display == "none")
        {
            document.getElementById(one).style.display = "block";
            document.getElementById(two).style.display = "none";
        }
        else
        {
            document.getElementById(one).style.display = "none";
            document.getElementById(two).style.display = "block";
        }
    }
function Dat_Error(object, type) //Used to check for input errors, client-side. REGEX Y'ALL.
{  
    switch (type)
    {
        case 'textnum': 
            var notallowed = new RegExp(/[^A-Za-z0-9_]/);
            break;
        case 'num':
            var notallowed = new RegExp(/[^0-9]/);
            break;
        case 'text':
            var notallowed = new RegExp(/[^A-Za-z0-9_]/);
            break;
        default:
            break;
    }
    var objectText = object.value;
    if (notallowed.exec(objectText))
    {
        alert("look at that, you fucked up by placing illegal characters in" + object.name);
    }
}
function mobTypeChanged(list, HPBox, APBox)//Sets stuff according to mob type as per D&D4.0 rules.
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