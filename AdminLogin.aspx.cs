using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Request.Cookies["Admin"] != null)
       {
           Session["admin_id"] = Request.Cookies["Admin"]["adminId"];
           Session["admin_name"] = Request.Cookies["Admin"]["adminName"];
           Session.Timeout = 720;
           Response.Redirect("dashboard.aspx");
       }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var loginQuery = db.DoAdminLogin(txtEmail.Text, txtPassword.Text).ToList();
            if (loginQuery.Count > 0)
            {
                Session["admin_id"] = loginQuery[0].AdminID;
                Session["admin_name"] = loginQuery[0].AdminName;
                Session.Timeout = 720;

                Response.Cookies["Admin"]["adminId"] = loginQuery[0].AdminID.ToString();
                Response.Cookies["Admin"]["adminName"] = loginQuery[0].AdminName;
                Response.Cookies["Admin"].Expires = DateTime.Now.AddDays(1);

                Response.Redirect("dashboard.aspx");
            }
            else
            {
                var errMsg = "Invalid Email of Password";
                lbError.Text = errMsg;
            }
        }
    }
}