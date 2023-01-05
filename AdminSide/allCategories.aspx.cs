using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_allCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillCategories();
        GVCategories.UseAccessibleHeader = true;
        GVCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void FillCategories()
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var categories = db.GetAllCategories().ToList();
            GVCategories.DataSource = categories;
            GVCategories.DataBind();
        }
    }
    protected void GVCategories_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GVCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GVCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       if(e.CommandName == "edit")
       {
           Response.Redirect("CategoriesSetup.aspx?catid=" + e.CommandArgument);
       }
       else
       {
           using (EPharmacy027Entities db = new EPharmacy027Entities())
           {
               int catId = Convert.ToInt32(e.CommandArgument);
               db.CategoryDelete(catId);
           }
           FillCategories();
       }
    }
}