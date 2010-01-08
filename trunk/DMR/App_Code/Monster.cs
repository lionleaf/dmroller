using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Monster
/// </summary>
public class Monster
{
    #region Private Members
    private int _actionPoints = 0;
    private int _health;
    private int _maxHealth;
    private int _bloodiedHealth;
    private List<string> _conditions = new List<string>();
    private List<Ability> _abilities = new List<Ability>();
    #endregion

    #region Properties
    #endregion

    #region Constructor Overload
    public Monster()
	{
    }
    #endregion

    #region Private Methods
    #endregion

    #region Public Methods

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
