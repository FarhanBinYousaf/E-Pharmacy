﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_adminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["adminID"] == null)
       {
           Response.Redirect("../AdminLogin.aspx");
       }
    }
}
