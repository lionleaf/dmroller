#define prestrin
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    DiceSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["DiceSet"] != null)
            ds = (DiceSet)Session["DiceSet"];
    }

    protected void SaveDiceSet(object sender, EventArgs e)
    {
        ds = new DiceSet(txt_diceString.Text);
        Session["DiceSet"] = ds;
    }

    protected void Roll(object sender, EventArgs e)
    {
        try
        {
            Label1.Text = ds.Roll();
        }
        catch
        {
            Label1.Text = "Please initiate a DiceSet before rolling it!";
        }
    }
}
