using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

public class Monster
{
	#region Private Members
	private int _actionPoints = 0;
	private int _health; //Current hp
	private int _maxHealth; //Max hp
	private int _bloodiedHealth; //Half of max hp
	private List<string> _conditions = new List<string>();
	private List<Ability> _abilities = new List<Ability>();
	private string _name;
    private MonsterType _type = MonsterType.Undefined;
	#endregion

	#region Properties
	public string Name
	{
		get { return _name; }
		set { _name = value; }
	}
	#endregion

	#region Constructor Overload
	public Monster(string name, int MaxHP, Ability[] abilities)
	{
		_name = name;
		_maxHealth = _health = MaxHP;
		_bloodiedHealth = MaxHP / 2; //How this work? What work? What use?
		foreach (Ability a in abilities)
		{
			_abilities.Add(a);
		}
	}
	#endregion

	#region Private Methods
	#endregion

	#region Public Methods

	public string GenerateHTML()
	{
		StringBuilder sb = new StringBuilder();

		sb.Append("<div id=\"" + _name + "_div\" class=\"Monster\" >");
		sb.Append("<span class=\"Drag\" onmousedown=\"dragStart(event, \'" + _name + "_div\')\">Drag</span>");
		sb.Append("<ul class=\"Monster\">");
		sb.Append("<li class=\"Monstername\">" + _name + "</li>");
		sb.Append("<li class=\"Health\"><b>HP:</b>" + _health + " (<b>Max:</b>" + _maxHealth + "; <b>Bloodied:</b>" + _bloodiedHealth + ")</li>");

		foreach (Ability a in _abilities)
		{
			sb.Append("<li class=\"Abilityname\">" + a.Name);
			sb.Append("<a style=\"float:right\" class=\"Roll\" href=\"javascript:rollDice('" + a.HitBonus + "','" + a.DamageDice.String + "','" + _name + "')\">Roll!</a></li>");
            sb.Append("<li class=\"Ability\">+" + a.HitBonus);
            if(a.DefenseTargeted != Defense.Undefined)  //If the defense targeted by the ability is undefined, don't print "vs Undefined".
            {
                sb.Append(" vs "+a.DefenseTargeted.ToString());
            }
            sb.Append(";" + a.DamageDice.String + "</li>");

            if (a.ExtraInfo != "")
            {
                sb.Append("<li class=\"Ability\">" + a.ExtraInfo);
                sb.Append("</li>");
            }
		}


		sb.Append("<li class=\"Hit\" id=\"" + _name + "_hit\" ");
		sb.Append("onmouseover=\"ShowContent('" + _name + "_hitdiv'); return true;\" ");
		sb.Append("onmouseout=\"HideContent('" + _name + "_hitdiv'); return true;\" ");
		sb.Append("onclick=\"ShowContent('" + _name + "_hitdiv'); return true;\" ></li>");

		sb.Append("<li class=\"Damage\" id=\"" + _name + "_damage\" ");
		sb.Append("onmouseover=\"ShowContent('" + _name + "_damagediv'); return true;\" ");
		sb.Append("onmouseout=\"HideContent('" + _name + "_damagediv'); return true;\" ");
		sb.Append("onclick=\"ShowContent('" + _name + "_damagediv'); return true;\" ></li>");


		sb.Append("</ul>");
		sb.Append("</div>");
		sb.Append("<div id=\"" + _name + "_hitdiv\" class=\"MouseOver\"></div>");
		sb.Append("<div id=\"" + _name + "_damagediv\" class=\"MouseOver\"></div>");


		return sb.ToString();
	}


	public void UpdateHealth(int hp)
	{
		_health += hp;
		if (_health > _maxHealth)
		{
			_health = _maxHealth;
		}
		else if (_health < 0)
		{
			_health = 0;
		}

	}
	public bool IsDead()
	{
		if (_health <= 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	#endregion
}
