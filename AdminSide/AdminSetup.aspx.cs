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
                    txtPass.Attributes["Value"] = AdminData.AdminPassword;
                    // Show the password on Edit page using it's attributes
                    txtConfirmPass.Attributes["Value"] = AdminData.AdminPassword;
                    
                    
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
                // Get the record of query string ID from database
                tblAdmin ad = db.tblAdmins.FirstOrDefault(v => v.AdminID == adminId);
                ad.AdminName = txtName.Text;
                ad.AdminEmail = txtEmail.Text;

                var Pass = System.Text.Encoding.UTF8.GetBytes(txtPass.Text);
                var HashedPassword = System.Convert.ToBase64String(Pass);

                ad.AdminPassword = HashedPassword;
                //check for Email Duplication when goes to edit record
                tblAdmin EmailDuplication = db.tblAdmins.FirstOrDefault(email => email.AdminEmail == txtEmail.Text & email.AdminID != adminId);
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
                    db.SaveChanges();
                    Response.Redirect("allAdmins.aspx");
                }
                 
            }
            else
            {
                tblAdmin admin = new tblAdmin();
                var Name = txtName.Text;
                var Email = txtEmail.Text;
                //Password Encryption 
                var Pass = System.Text.Encoding.UTF8.GetBytes(txtPass.Text);
                var HashedPassword = System.Convert.ToBase64String(Pass);
                admin.AdminName = Name;
                admin.AdminEmail = Email;
                admin.AdminPassword = HashedPassword;
                // Check for Email Duplication 
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