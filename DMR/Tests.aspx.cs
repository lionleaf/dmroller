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
	protected void Generate_Click(object sender, EventArgs e)
	{
		Ability[] a = { new Ability("Absinthe", new DiceSet("d20+15"), new DiceSet("2d8+3d10+5")), 
                        new Ability("Super power", new DiceSet("d20+19"), new DiceSet("5d9+3d10+5")), 
                        new Ability("Lava", new DiceSet("d20+12"), new DiceSet("10d10")) };
		Monster odd = new Monster("Odd", 51, a);
		Monster Andreas = new Monster("Andreas", 101, a);
		Label1.Text = odd.GenerateHTML();
		Label1.Text += Andreas.GenerateHTML();

	}
}
