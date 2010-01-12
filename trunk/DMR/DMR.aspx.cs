using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class index : System.Web.UI.Page
{
	public Encounter MainEncounter;
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

		mobAddButton.Attributes.Add("onclick", "javascript:toggle('divtest', 'divmain')");

		MainLabel.Text = MainEncounter.GenerateHTML();
    }
    protected void AddMob(object sender, EventArgs e)
    {
		//This be ugly! Need to make it more flexible for an unknown amount of abilites! This is just for testing. Yo momma's ugly.
		Ability[] abilities = {new Ability(mobAb1Name.Text, new DiceSet("d20+"+mobAb1Hit.Text),new DiceSet(mobAb1Damage.Text)),
								new Ability(mobAb2Name.Text, new DiceSet("d20+"+mobAb2Hit.Text),new DiceSet(mobAb2Damage.Text)),
								new Ability(mobAb3Name.Text, new DiceSet("d20+"+mobAb3Hit.Text),new DiceSet(mobAb3Damage.Text))
							  };
		try
		{
			int hp = Convert.ToInt32(mobHP.Text);
			Monster mob = new Monster(mobName.Text, hp, abilities);

			MainEncounter.AddMonster(mob);

			Session["MainEncounter"] = MainEncounter;
		}
		catch
		{
			mobHP.Style.Add(HtmlTextWriterStyle.BackgroundColor, "red");
		}
		

        
        //Run javascript for toggling visibility if input checks out ok
        //btn_submit.Attributes.Add("onclick", "javascript:toggle('divtest', 'divmain')
        
    }
    protected void ddl_mobType_SelectedIndexChanged(object sender, EventArgs e)
    {
     switch (ddl_mobType.SelectedValue) //fuck this shit is ugly
     {
         case "Standard":
             txt_mobAP.Text = "0";
             txt_mobHP.Text = "";
             txt_mobHP.Enabled = true;
             break;
         case "Minion":
             txt_mobAP.Text = "0";
             txt_mobHP.Text = "1";
             txt_mobHP.Enabled = false;
             break;
         case "Elite":
             txt_mobAP.Text = "1";
             txt_mobHP.Text = "";
             txt_mobHP.Enabled = true;
             break;
         case "Solo":
             txt_mobAP.Text = "2";
             txt_mobHP.Text = "";
             txt_mobHP.Enabled = true;
             break;
      }
    }

}
