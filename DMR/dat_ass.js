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