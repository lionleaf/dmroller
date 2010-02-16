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

	}

	protected Ability[] ExtractAbilities(string Names, string Hits, string Damages, string Infos)  //Gets an array from three strings seperated by ;. "ab1;ab2","20;10","2d6;3d4" will return two abilities: ab1 and ab2, ab1 has +20 hit and 2d6 damage, while ab2 has +10 hit and 3d4 damage.
	{
		string[] name = Names.Split(';');
		string[] hitDef = Hits.Split(';');
        string[] damage = Damages.Split(';');
        string[] info = Infos.Split(new char[]{';'},StringSplitOptions.None);

		if (!(name.Length == hitDef.Length && hitDef.Length == damage.Length)) return null; //Input in each field is required for each ability is required -- some later form of errorchecking?

		Ability[] result = new Ability[name.Length]; //Declare (name.Length) instances of Ability class. This corresponds with the amount of abilities the mob has
		
        for (int i = 0; i < name.Length; i++)
		{
            string[] currentHitDef = hitDef[i].Split('x');
			result[i] = new Ability(name[i], new DiceSet("d20+" + currentHitDef[0]), new DiceSet(damage[i]),(Defense)Enum.Parse(typeof(Defense),currentHitDef[1],true), info[i]);  //Creates a new ability and puts it into the result array. DiceSet overload used: DiceSet(string DiceString)
		}
		return result;
	}
	protected void AddMob(object sender, EventArgs e) // Run onsubmit of the form
	{
		Ability[] abilities = ExtractAbilities(mobAb1Name.Text, mobAb1Hit.Text, mobAb1Damage.Text, mobAb1Info.Text);
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
	}
	protected void Button2_Click(object sender, EventArgs e)
	{

	}
}
