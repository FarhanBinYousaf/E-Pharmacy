using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_allCompanies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillCompanies();
    }
    protected void FillCompanies()
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var companies = db.GetCompanies().ToList();
            companyGV.DataSource = companies;
            companyGV.DataBind();
        }
    }
    protected void companyGV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void companyGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void companyGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("ManageCompanies.aspx?comId=" + e.CommandArgument);
        }
        else
        {
            using (EPharmacy027Entities db = new EPharmacy027Entities())
            {
                int companyId = Convert.ToInt32(e.CommandArgument);
                db.DeleteCompany(companyId);
            }
            FillCompanies();
        }
    }
}