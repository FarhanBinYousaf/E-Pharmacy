﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_allProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillingProducts();

        //ProductsGV.UseAccessibleHeader = true;
        //ProductsGV.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void FillingProducts()
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            var products = db.AllProducts().ToList();
            ProductsGV.DataSource = products;
            ProductsGV.DataBind();
        }
    }
    protected void productsGV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void productsGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void productsGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "edit")
        {
            Response.Redirect("ProductsSetup.aspx?pid=" + e.CommandArgument);
        }
        else
        {
            using(EPharmacy027Entities db = new EPharmacy027Entities())
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                tblTemp t = db.tblTemps.FirstOrDefault(i => i.ProID == productId);
                if(t != null)
                {
                    lblProductKeyError.Style.Add("visibility", "true");
                    lblProductKeyError.InnerText = "Note:Sorry! You are not allowed to delete this product";
                }
                else
                {
                    db.DeleteProduct(productId);
                }
                
            }
        }
        FillingProducts();
    }
}