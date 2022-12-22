using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_AdminSetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
            using (EPharmacy027Entities db = new EPharmacy027Entities())
            {
                if (Request.QueryString["adminId"] != null)
                {
                    int adminId = Convert.ToInt32(Request.QueryString["adminId"]);
                    tblAdmin AdminData = db.tblAdmins.FirstOrDefault(admin => admin.AdminID == adminId);
                    txtName.Text = AdminData.AdminName;
                    txtEmail.Text = AdminData.AdminEmail;
                    //var dbPassword = AdminData.AdminPassword;
                    //var dppass = System.Convert.FromBase64String(dbPassword);
                    //var DecryptedPassword = System.Text.Encoding.UTF8.GetString(dppass);
                    txtPass.Text = AdminData.AdminPassword;
                    txtConfirmPass.Text = AdminData.AdminPassword;
                    
                    
                }
            }
        }
        
    }

    protected void btnMakeAdmin_Click(object sender, EventArgs e)
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if (Request.QueryString["adminId"] != null)
            {
                int adminId = Convert.ToInt32(Request.QueryString["adminId"]);
                tblAdmin ad = db.tblAdmins.FirstOrDefault(v => v.AdminID == adminId);
                ad.AdminName = txtName.Text;
                ad.AdminEmail = txtEmail.Text;
                ad.AdminPassword = txtPass.Text;
                tblAdmin EmailDuplication = db.tblAdmins.FirstOrDefault(email => email.AdminEmail == txtEmail.Text & email.AdminID != adminId);
                if (EmailDuplication != null)
                {
                    lblErrorMsg.Text = "Email Already Exist";
                    return;
                }
                else
                {
                    db.SaveChanges();
                    Response.Redirect("allAdmins.aspx");
                }
                 
            }
            else
            {
                tblAdmin admin = new tblAdmin();
                var Name = txtName.Text;
                var Email = txtEmail.Text;
                var Pass = System.Text.Encoding.UTF8.GetBytes(txtPass.Text);
                var HashedPassword = System.Convert.ToBase64String(Pass);
                admin.AdminName = Name;
                admin.AdminEmail = Email;
                admin.AdminPassword = HashedPassword;
                tblAdmin EmailDuplication = db.tblAdmins.FirstOrDefault(email => email.AdminEmail == Email);
                if (EmailDuplication != null)
                {
                    lblErrorMsg.Text = "Email Already Exist";
                    return;
                }
                else if (txtPass.Text != txtConfirmPass.Text)
                {
                    lblErrorMsg.Text = "Password do not match";
                    return;
                }
                else
                {
                    db.tblAdmins.Add(admin);
                    db.SaveChanges();
                    Response.Redirect("allAdmins.aspx");
                }
            }
        }
    }
}