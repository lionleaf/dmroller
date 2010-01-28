using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlayEncounter : System.Web.UI.Page
{
	Encounter MainEncounter;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["MainEncounter"] != null)
		{
			MainEncounter = (Encounter)Session["MainEncounter"];
		}
		else
		{
			MainEncounter = new Encounter();
		}
		Monsters.Text = MainEncounter.GenerateHTML();
	}
	protected void refreshButton_Click(object sender, EventArgs e)
	{
		if (Session["MainEncounter"] != null)
		{
			MainEncounter = (Encounter)Session["MainEncounter"];
		}
		else
		{
			MainEncounter = new Encounter();
		}
		Monsters.Text = MainEncounter.GenerateHTML();
	}

}