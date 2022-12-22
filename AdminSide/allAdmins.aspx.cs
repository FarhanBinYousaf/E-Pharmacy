using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_allAdmins : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillAdmins();
    }
    protected void FillAdmins()
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var allAdmins = db.GetAdmins().ToList();
            gvAdmins.DataSource = allAdmins;
            gvAdmins.DataBind();
        }
    }
    protected void gvAdmins_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gvAdmins_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("AdminSetup.aspx?adminId=" + e.CommandArgument);
        }
        else
        {
            using (EPharmacy027Entities db = new EPharmacy027Entities())
            {
                int id = Convert.ToInt32(e.CommandArgument);
                db.DoAdminDelete(id);
            }
            FillAdmins();
        }
    }
}