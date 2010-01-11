using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

enum MonsterType
{
	Minion, 
	Standard, 
	Elite, 
	Solo
}

[Flags]
enum Condition : uint //No need for signing. This is bitflags.
{
	None = 0,
	Blinded = 0x1,			// (00000000000000000000000000000001)
	Dazed = 0x2,			// (00000000000000000000000000000010)
	Deafened = 0x4,			// (00000000000000000000000000000100)
	Dominated = 0x8,		// (00000000000000000000000000001000)
	Dying = 0x10,			// (00000000000000000000000000010000)
	Helpless = 0x20,		// (00000000000000000000000000100000)
	Immobilized = 0x40,		// (00000000000000000000000001000000)
	Marked = 0x80,			// (00000000000000000000000010000000)
	Petrified = 0x100,		// (00000000000000000000000100000000)
	Prone = 0x200,			// (00000000000000000000001000000000)
	Restrained = 0x400,		// (00000000000000000000010000000000)
	Slowed = 0x800,			// (00000000000000000000100000000000)
	Stunned = 0x1000,		// (00000000000000000001000000000000)
	Surprised = 0x2000,		// (00000000000000000010000000000000)
	Unconscious = 0x4000,	// (00000000000000000100000000000000)
	Weakened = 0x8000		// (00000000000000001000000000000000)
}

enum State
{
	Unscathed,
	Damaged,
	Bloodied,
	Dying,
	Dead
}
