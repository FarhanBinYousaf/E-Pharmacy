using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_ManageCompanies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
            using(EPharmacy027Entities db =  new EPharmacy027Entities())
            {
                if(Request.QueryString["comId"] != null)
                {
                    int CompanyId = Convert.ToInt32(Request.QueryString["comId"]);
                    tblCompany company = db.tblCompanies.FirstOrDefault(id => id.CompanyID == CompanyId);
                    txtCompanyName.Text = company.CompanyName;
                }
            }
            
        }
    }
    protected void btnCompany_Click(object sender, EventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {

            if (Request.QueryString["comId"] != null)
            {
                int CompanyId = Convert.ToInt32(Request.QueryString["comId"]);
                tblCompany company = db.tblCompanies.FirstOrDefault(id => id.CompanyID == CompanyId);
                company.CompanyName = txtCompanyName.Text;
                db.SaveChanges();
                Response.Redirect("allCompanies.aspx");
                lblMsg.Text = "Company Updated Successfully";
            }
            else
            {
                tblCompany company = new tblCompany();
                company.CompanyName = txtCompanyName.Text;
                db.tblCompanies.Add(company);
                db.SaveChanges();
                Response.Redirect("allCompanies.aspx");
                lblMsg.Text = "Company Added Successfully";
            }
            
        }
    }
}