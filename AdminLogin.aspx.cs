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
       if(Request.Cookies["adminCookie"] != null)
       {
           Session["adminID"] = Request.Cookies["adminCookie"]["adminId"];
           Session["adminName"] = Request.Cookies["adminCookie"]["adminName"];
           Session.Timeout = 720;
           Response.Redirect("AdminSide/allAdmins.aspx");
       }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var password = txtPassword.Text;
            var middle = System.Text.Encoding.UTF8.GetBytes(password);
            var hashedPass = System.Convert.ToBase64String(middle);
            var LoginQuery = db.DoAdminLogin(txtEmail.Text, hashedPass).ToList();
            if(LoginQuery.Count > 0)
            {
                Session["adminID"] = LoginQuery[0].AdminEmail.ToString();
                Session["adminName"] = LoginQuery[0].AdminName;
                Session.Timeout = 720;

                Response.Cookies["adminCookie"]["adminId"] = LoginQuery[0].AdminID.ToString();
                Response.Cookies["adminCookie"]["adminName"] = LoginQuery[0].AdminName;
                Response.Cookies["adminCookie"].Expires = DateTime.Now.AddDays(1);

                Response.Redirect("AdminSide/allAdmins.aspx");
            }
            else
            {
                lblErrMsg.Text = "Invalid Email or Password";
            }
        }
    }
}