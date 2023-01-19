using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserSide_ProductsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var categories = db.GetAllCategories().ToList();
            gvCategories.DataSource = categories;
            gvCategories.DataBind();

            var products = db.GetProducts().ToList();
            lvProducts.DataSource = products;
            lvProducts.DataBind();
        }
    }
    protected void gvCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if(e.CommandName == "showProducts")
            {
                int catId = Convert.ToInt32(e.CommandArgument);      
                var products = db.GetCategoryDepProducts(catId).ToList();
                lvProducts.DataSource = products;
                lvProducts.DataBind();
            }
        }
    }


    protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if(e.CommandName == "addToCart")
            {
                int ProductId = Convert.ToInt32(e.CommandArgument);
                tblProduct n = db.tblProducts.FirstOrDefault(i => i.ProductID == ProductId);
                if (Request.Cookies["UserCookieValue"].Value != null)
                {
                    var uniqueNo = Request.Cookies["UserCookieValue"]["rand"];
                    DateTime dateTime = DateTime.Now;
                    tblTemp tempTbl = new tblTemp();
                    tempTbl.ProID = ProductId;
                    tempTbl.UniqueNo = long.Parse(uniqueNo);
                    tempTbl.DateTime = dateTime;
                    if(n.ProductQuantity == 0)
                    {
                        Response.Write("Don't have enough quantity to add in cart");
                    }
                    else
                    {
                        db.tblTemps.Add(tempTbl);
                        db.SaveChanges();
                        lblAddToCart.Text = "Item added to cart";
                    }
                    
                    //Response.Write("Item Added to cart");
                }
            }
        }

    }
}