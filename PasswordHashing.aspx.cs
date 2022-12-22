using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PasswordHashing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEncrypt_Click(object sender, EventArgs e)
    {
        var password = txtPassword.Text;
        var Hashed = System.Text.Encoding.UTF8.GetBytes(password);
        var HashedPassword = System.Convert.ToBase64String(Hashed);
        Response.Write(HashedPassword);
    }
}