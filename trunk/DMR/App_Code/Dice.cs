using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dice
/// </summary>
public class Dice
{
    #region Private Members
    private int _maxRoll;
    private int _minRoll = 1; // Default to 1, but could be changed in case of brutal etc.
    private int _lastRoll = -1; // Used to save the last roll. -1 indicates there has been no rolls yet.
    private bool _positive = true; // false if you subtract the die, if not, it's true
    private bool _lastCrit = false; // True if the last roll was a crit
    private int _critRange = 0; // Number of sides that crits from the top roll. 0 if it can't crit (not a hit die). 
    // For instance a value of 1 means on a d20 that 20 is a crit, 2 means 19 and 20 and so on.

    #endregion

    #region Properties
    public int LastRoll
    {
        get { return _lastRoll; }
    }

    public int MaxRoll
    {
        get { return _maxRoll; }
    }
    #endregion

    #region Constructor overloads
    public Dice(int MaxRoll)
    {
        _maxRoll = MaxRoll;
    }

    public Dice(int MaxRoll, bool Positive)
    {
        _positive = Positive;
        _maxRoll = MaxRoll;
    }

    public Dice(int MinRoll, int MaxRoll) //Constructor overload in case you need to impose strange dice rules (for instance brutal weapons) 
    {
        _minRoll = MinRoll;
        _maxRoll = MaxRoll;
    }

    public Dice(int MinRoll, int MaxRoll, bool Positive) //Constructor overload in case you need to impose strange dice rules (for instance brutal weapons) 
    {
        _minRoll = MinRoll;
        _maxRoll = MaxRoll;
        _positive = Positive;
    }
    #endregion

    #region Public Methods
    public int Roll()
    {
        _lastRoll = rng.Next(_minRoll, _maxRoll + 1);
        if (!_positive)
            _lastRoll *= -1;
        return _lastRoll;
    }
    #endregion
}

public static class rng //Because if we create the random generator the dice class, 
{                       //there will be one instance for each dice, and if (through the diceset) they
    static Random rand = new Random();//are created at the same time, they will give the same numbers, therefore I'm using a static class to hold it.

    public static int Next(int Min, int Max)
    {
        return rand.Next(Min, Max);
    }

}