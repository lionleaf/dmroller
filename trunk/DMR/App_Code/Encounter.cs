using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Encounter
{
    #region Private Members
    List<Monster> _monsters;
    #endregion

    #region Properties
    #endregion

    #region Constructor Overloads
    public Encounter()
	{
		
    }
    #endregion

    #region Public Methods
    public void AddMonster(Monster mob)
    {
        _monsters.Add(mob);
    }
    #endregion
}
