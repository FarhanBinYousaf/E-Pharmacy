﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSide_ProductsSetup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack == false)
        {
            using (EPharmacy027Entities db = new EPharmacy027Entities())
            {
                var categories = db.GetCategories().ToList();
                ddlCategory.DataSource = categories;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));

                var companies = db.GetCompanies().ToList();
                ddlCompany.DataSource = companies;
                ddlCompany.DataTextField = "CompanyName";
                ddlCompany.DataValueField = "CompanyID";
                ddlCompany.DataBind();

                if(Request.QueryString["pid"] != null)
                {
                    string imgUrl = "ProductsImages/";
                    int productId = Convert.ToInt32(Request.QueryString["pid"]);
                    tblProduct products = db.tblProducts.FirstOrDefault(id => id.ProductID == productId);
                    txtName.Text = products.ProductName;
                    txtDesc.Text = products.ProductDescription;
                    img.ImageUrl = imgUrl + products.ProductImageName;
                    ddlCategory.SelectedValue = products.CategoryID.ToString();
                    ddlCompany.SelectedValue = products.CompanyID.ToString();
                    txtMG.Text = products.ProductMG;
                    txtQuantity.Text = products.ProductQuantity.ToString();
                    txtUses.Text = products.ProductUses;
                    txtIngredients.Text = products.ProductIngredients;
                    txtBenefits.Text = products.ProductBenefits;
                    txtMFG.Text = products.ProductMFG;
                    txtEXP.Text = products.ProductEXP;
                    txtFormat.Text = products.ProductFormat;
                    txtSideEffects.Text = products.ProductSideEffects;
                    txtPrecautions.Text = products.ProductPrecautions;
                    txtAgeLimit.Text = products.ProductAgeLimit.ToString();
                    txtFormula.Text = products.ProductFormula;
                    txtManipulation.Text = products.ProductManipulations;
                    txtPrice.Text = products.ProductPrice.ToString();
                }
            }
        }
        
    }
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {

            if (Request.QueryString["pid"] != null)
            {

                int productId = Convert.ToInt32(Request.QueryString["pid"]);
                tblProduct products = db.tblProducts.FirstOrDefault(id => id.ProductID == productId);

                string ImageName = ProductImage.FileName;
                string ImagePath = Server.MapPath("ProductsImages/");
                
                if(ProductImage.HasFile)
                {
                    ProductImage.SaveAs(ImagePath + ImageName);
                }
                products.ProductName = txtName.Text;
                products.ProductDescription = txtDesc.Text;
                
                if(!ProductImage.HasFile)
                {
                    products.ProductImageName = products.ProductImageName;
                }
                else
                {
                    products.ProductImageName = ImageName;
                }
                products.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
                products.CompanyID = Convert.ToInt32(ddlCompany.SelectedValue);
                products.ProductMG = txtMG.Text;
                products.ProductQuantity = int.Parse(txtQuantity.Text);
                products.ProductUses = txtUses.Text;
                products.ProductIngredients = txtIngredients.Text;
                products.ProductBenefits = txtBenefits.Text;
                products.ProductMFG = txtMFG.Text;
                products.ProductEXP = txtEXP.Text;
                products.ProductFormat = txtFormat.Text;
                products.ProductSideEffects = txtSideEffects.Text;
                products.ProductPrecautions = txtPrecautions.Text;
                products.ProductAgeLimit = int.Parse(txtAgeLimit.Text);
                products.ProductFormula = txtFormula.Text;
                products.ProductManipulations = txtManipulation.Text;
                products.ProductPrice = decimal.Parse(txtPrice.Text);
                db.SaveChanges();
                Response.Redirect("allProducts.aspx");
                lblAddMsg.Text = "Updated Successfully";
            }
            else
            {
                tblProduct products = new tblProduct();

                string ImageName = ProductImage.FileName;
                string ImagePath = Server.MapPath("ProductsImages/");
                if(ProductImage.HasFile)
                {
                    ProductImage.SaveAs(ImagePath + ImageName);
                }

                products.ProductName = txtName.Text;
                products.ProductDescription = txtDesc.Text;
                products.ProductImageName = ImageName;
                products.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
                products.CompanyID = Convert.ToInt32(ddlCompany.SelectedValue);
                products.ProductMG = txtMG.Text;
                products.ProductQuantity = int.Parse(txtQuantity.Text);
                products.ProductUses = txtUses.Text;
                products.ProductIngredients = txtIngredients.Text;
                products.ProductBenefits = txtBenefits.Text;
                products.ProductMFG = txtMFG.Text;
                products.ProductEXP = txtEXP.Text;
                products.ProductFormat = txtFormat.Text;
                products.ProductSideEffects = txtSideEffects.Text;
                products.ProductPrecautions = txtPrecautions.Text;
                products.ProductAgeLimit = int.Parse(txtAgeLimit.Text);
                products.ProductFormula = txtFormula.Text;
                products.ProductManipulations = txtManipulation.Text;
                products.ProductPrice = decimal.Parse(txtPrice.Text);
                db.tblProducts.Add(products);
                db.SaveChanges();
                Response.Redirect("allProducts.aspx");
                lblAddMsg.Text = "Added Successfully";
            }
        }
    }
}