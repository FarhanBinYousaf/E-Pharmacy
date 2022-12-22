using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_CategoriesSetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
            using (EPharmacy027Entities db = new EPharmacy027Entities())
            {
                if (Request.QueryString["catid"] != null)
                {
                    int CategoryId = Convert.ToInt32(Request.QueryString["catid"]);
                    tblCategory category = db.tblCategories.FirstOrDefault(catId => catId.CategoryID == CategoryId);
                    txtCatName.Text = category.CategoryName;
                }
            }
        }
        
    }
    protected void btnAddCat_Click(object sender, EventArgs e)
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if(Request.QueryString["catid"] != null)
            {
                int CategoryId = Convert.ToInt32(Request.QueryString["catid"]);
                tblCategory category = db.tblCategories.FirstOrDefault(catId => catId.CategoryID == CategoryId);
                category.CategoryName = txtCatName.Text;
                db.SaveChanges();
                lblMsg.Text = "Category Updated Successfully";
            }
            else
            {
                tblCategory category = new tblCategory();
                category.CategoryName = txtCatName.Text;
                db.tblCategories.Add(category);
                db.SaveChanges();
                lblMsg.Text = "Category Added Successfully";
            }
            
        }
    }
}