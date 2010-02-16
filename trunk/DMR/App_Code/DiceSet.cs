#define debug
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Text;

/// <summary>
/// Contains a set of Dice. Currently not in active use, since the rolling is done by javascript in the web version.
/// </summary>
public class DiceSet
{
	#region Private Members
	private Regex _diceRegex = new Regex(@"[+-]?[0-9]*[dD][0-9]+"); //Regex to get out every single set of dice
	private Regex _bonusRegex = new Regex(@"[+-][0-9]*"); //Regex to get out the static bonus to the roll 
	private List<Dice> _dice = new List<Dice>(); //List of all the dice in the DiceSet
	private int bonus = 0; //The static bonus to the roll
	private int _lastSum = -1; //The sum of the last result. -1 indicates no rolls yet.
	private string _diceString; //The string of the DiceSet, for instance "2d6+2d4+7"
	#endregion

	public int HitBonus
	{
		get { return bonus; }
	}
	public string String
	{
		get { return _diceString; }
	}

	#region Constructor Overloads

	public DiceSet(string DiceString) //DiceString is a string of the type: "2d6+8"
	{
		_diceString = DiceString;
		DecodeString(_diceString);

	}

	public DiceSet(Dice[] dice, int bonus) //Accepts an array of dice, and a seperate bonus, and combines them.
	{
		foreach (Dice die in dice)
		{
			_dice.Add(die);
		}
		this.bonus = bonus;
	}

	public DiceSet(Dice[] dice)  //Same as the one above, but without the bonus
	{
		foreach (Dice die in dice)
		{
			_dice.Add(die);
		}
	}
	#endregion

	#region Private Methods

	private bool DecodeString(string input)  //Used to decode the string and get the actual dice
	{
		if (input.Substring(0, 1) != "+" && input.Substring(0, 1) != "-") //To make sure that every d is started with a + or - sign. 
		{
			input = input.Insert(0, "+");   //If there is no sign, we add a +. For instance the first dice in "5d6+2d8+8", "5d6", will now be "+5d6"
		}                                   //This is done to make it easier later on.

		bonus = 0;  //Clear the bonus.
		_dice.Clear(); //Clear the dice as well. To make sure we don't add to the last one.


		while (_diceRegex.IsMatch(input)) //We loop through the string and take out every diceset
		{
			AddDice(_diceRegex.Match(input).ToString()); //We send the DiceSet to AddDice() to add it to the list of dice.
			input = input.Remove(_diceRegex.Match(input).Index, _diceRegex.Match(input).Length); //Then remocve
		}


		foreach (Match match in _bonusRegex.Matches(input)) //We find the static bonus and and add it to _bonus
		{
			string str = match.ToString();
			bonus += Convert.ToInt32(str.ToString()); //We convert the string with the bonus to the integer "bonus"       
		}

		return true; //temp
	}
	private bool AddDice(string input)
	{
		//Here we should add logic to check whether the input is valid. 
        //Even though we'd expect it to be "clean" by now, it's always good to make a second check. 
        //(Who knows, someone might be able to call the function in a context we did not think about)
		int dPos = -1;
		bool positive;
		int numberOfDice;
		int diceSize;

		switch (input.Substring(0, 1)) //Check whether the dice should be added or subtracted
		{
			case "-":
				positive = false;
				break;
			case "+":
				positive = true;
				break;
			default:
				positive = true;
				break;
		}

		int y = 0; //counter
		foreach (char a in input) //Loop through every character of the dice-string to find the position of "d"
		{
			if (a == 'D' || a == 'd')
			{
				dPos = y;
				break;
			}
			y++;
		}

		if (dPos == 1) //Means 1 die. Remember here that every string starts with + or -.
			numberOfDice = 1;
		else
			numberOfDice = Convert.ToInt32(input.Substring(1, dPos - 1));
		diceSize = Convert.ToInt32(input.Substring(dPos + 1, input.Length - (dPos + 1)));

		//Add the dice

		for (int i = 0; i < numberOfDice; i++)
		{
			_dice.Add(new Dice(diceSize, positive)); //Why does it not overload with the positive variable here? 
                                                     //I fixed it. Will it break it?
		}

		return true; //it worked!
	}
	#endregion

	#region Public Methods
	public string Roll()
	{
		_lastSum = 0; //Clear the last roll!
		StringBuilder sb = new StringBuilder();
		foreach (Dice d in _dice) //Loop through every dice, roll it and add it to the stringbuilder.
		{
			_lastSum += d.Roll();
			sb.Append(d.LastRoll.ToString() + "(" + d.MaxRoll.ToString() + ")");
			sb.Append("+");
		}
		if (bonus != 0)
		{
			_lastSum += bonus;
			sb.Append(bonus);
		}
		else
		{
			sb.Remove(sb.Length - 1, 1); //Remove the last + sign if there is no bonus.
		}

		return _lastSum.ToString() + ": " + sb.ToString();
	}
	#endregion
}
