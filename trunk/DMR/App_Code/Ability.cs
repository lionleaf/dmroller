using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ability
/// </summary>
public class Ability
{
	#region Private Members
	private string _name;
	private DiceSet _hitDie;
	private DiceSet _dmgDice;
	private DiceSet _extraDmg;
	private int _lastHit;
	private int _lastDmg;
	#endregion

	#region Properties
	public string Name
	{
		get { return _name; }
		set { _name = value; }
	}
	public int HitBonus
	{
		get { return _hitDie.HitBonus; }
	}
	public DiceSet DamageDice
	{
		get { return _dmgDice; }
	}


	#endregion

	#region Constructors
	public Ability(string Name, DiceSet HitDie, DiceSet DmgDice)
	{
		_name = Name;
		_hitDie = HitDie;
		_dmgDice = DmgDice;
	}
	#endregion

	#region Public Methods
	public string hit()
	{
		return "";
	}
	#endregion
}
