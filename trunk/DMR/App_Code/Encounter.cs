using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

public class Encounter
{
    #region Private Members
    List<Monster> _monsters = new List<Monster>();
	int _nameIncrementer = 1; //To handle multiple names, the names has to be unique, we add a number if there are multiple equal names 
                              //(so instead of three "mob", you'll have "mob","mob1" and "mob2"  .
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
		if (ContainsName(mob.Name))
		{
			mob.Name = mob.Name + _nameIncrementer;
			_nameIncrementer++;
		}
        _monsters.Add(mob);
    }
	public string GenerateHTML()
	{
		StringBuilder sb = new StringBuilder();
		foreach (Monster mob in _monsters)
		{
			sb.Append(mob.GenerateHTML());
		}
		return sb.ToString();
	}

	public bool ContainsName(string name)
	{
		foreach(Monster m in _monsters)
		{
			if (m.Name.ToLower() == name.ToLower())
				return true;
		}
		return false;
	}
    #endregion
}
