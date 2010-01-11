using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //what, did you think I bothered with writing code? ahuarhuarhauhrauhuhuuhuhuhuh.
        //Hit submit, get the textboxes' values

        //Run javascript for toggling visibility if input checks out ok
        //btn_submit.Attributes.Add("onclick", "javascript:toggle('divtest', 'divmain')");
        

        
    }
    protected void ddl_mobType_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ddl_mobType.SelectedValue) //fuck this shit is ugly
        {
            case "Standard":
                txt_mobAP.Text = "0";
                txt_mobHP.Text = "";
                txt_mobHP.Enabled = true;
                break;
            case "Minion":
                txt_mobAP.Text = "0";
                txt_mobHP.Text = "1";
                txt_mobHP.Enabled = false;
                break;
            case "Elite":
                txt_mobAP.Text = "1";
                txt_mobHP.Text = "";
                txt_mobHP.Enabled = true;
                break;
            case "Solo":
                txt_mobAP.Text = "2";
                txt_mobHP.Text = "";
                txt_mobHP.Enabled = true;
                break;
        }
    }
}
