using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserSideMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cvalue;
        if (Request.Cookies["UserCookieValue"] != null)
        {
            cvalue = Request.Cookies["UserCookieValue"].ToString();

        }
        else
        {
            Random num = new Random();
            int randomNum = num.Next();
            Response.Cookies["UserCookieValue"]["rand"] = randomNum.ToString();
            Response.Cookies["UserCookieValue"].Expires = DateTime.Now.AddDays(3);
        }
    }
}
