using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Ability keeps the information for one mob-ability
/// </summary>
public class Ability 
{
    #region Private Members
    private string _name;
    private DiceSet _hitDie;
    private DiceSet _dmgDice;
    private DiceSet _extraDmg; //For conditional extra damage dice.
    private int _lastHit; //Last roll of hitDie
    private int _lastDmg; //Last roll of dmgDice   (Accessed by other classes through the property)
    private Defense _defense = Defense.Undefined; //The defense that the ability targets!
    private string _info; //A string with extra info if the user wants it.
    #endregion

    #region Properties 
    //Properties! To controll access of private variables from other classes.
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
    public Defense DefenseTargeted
    {
        get { return _defense; }
    }
    public string ExtraInfo
    {
        get { return _info; }
    }


    #endregion

    #region Constructors

    public Ability(string Name, DiceSet HitDie, DiceSet DmgDice)  // Self-explanatory
    {
        _name = Name;
        _hitDie = HitDie;
        _dmgDice = DmgDice;
    }
    public Ability(string Name, DiceSet HitDie, DiceSet DmgDice, Defense defense)  //Overload to set the defense variable!
    {
        _name = Name;
        _hitDie = HitDie;
        _dmgDice = DmgDice;
        _defense = defense;
    }
    public Ability(string Name, DiceSet HitDie, DiceSet DmgDice, Defense defense, string info)  //Overload to set the defense and info variable!
    {
        _name = Name;
        _hitDie = HitDie;
        _dmgDice = DmgDice;
        _defense = defense;
        _info = info;
    }
    #endregion

}
