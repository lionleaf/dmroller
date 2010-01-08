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
    private DiceSet _hitDie;
    private DiceSet _dmgDice;
    private DiceSet _extraDmg;
    private int _lastHit;
    private int _lastDmg;
    #endregion

    #region Properties

    #endregion

    #region Constructors
    public Ability(DiceSet HitDie, DiceSet DmgDice)
	{
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
