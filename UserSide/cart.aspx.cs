using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Net.Configuration;
public partial class UserSide_cart : System.Web.UI.Page
{
    public decimal price=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        FillCart();
        
    }
    protected void FillCart()
    {
        using (EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if (Request.Cookies["UserCookieValue"] != null)
            {
                var unique = Request.Cookies["UserCookieValue"]["rand"];
                var items = db.CartedProducts(long.Parse(unique)).ToList();
                gvCartedItems.DataSource = items;
                gvCartedItems.DataBind();
                foreach (var itemIterator in items)
                {
                    var eachPrice = itemIterator.ProductPrice;
                    price = price + eachPrice;
                }
            }
        }
        
    }
    protected void btnChckOut_Click(object sender, EventArgs e)
    {
       using(EPharmacy027Entities db = new EPharmacy027Entities())
       {
           CnfrmOrderForm.Style.Add("visibility", "true");
       }
    }
    protected void btnCnfirm_Click(object sender, EventArgs e)
    {
        SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            tblCustomerDetail customer = new tblCustomerDetail();
            customer.FirstName = txtFName.Text;
            customer.LastName = txtLName.Text;
            customer.Email = txtEmail.Text;
            customer.ShippingAddress = txtShippingAddress.Text;
            customer.PhoneNo = txtPhoneNo.Text;
            db.tblCustomerDetails.Add(customer);
            db.SaveChanges();
            int OrderId = customer.ID;
            var UniqueNo = Request.Cookies["UserCookieValue"]["rand"];
            var PurchasedItems = db.CartedProducts(long.Parse(UniqueNo)).ToList();
            foreach(var BuyedItems in PurchasedItems)
            {
                int pid = BuyedItems.ProID;
                tblOrderDetail OrderDetail = new tblOrderDetail();
                OrderDetail.ProductID = BuyedItems.ProID;
                OrderDetail.ProductPrice = BuyedItems.ProductPrice;
                OrderDetail.OrderID = OrderId;
                db.tblOrderDetails.Add(OrderDetail);
                db.SaveChanges();
                tblProduct m = db.tblProducts.FirstOrDefault(a => a.ProductID == pid);
                m.ProductQuantity = m.ProductQuantity - 1;
                db.SaveChanges();
                //Empty cart after completing order
                db.DelCart(long.Parse(UniqueNo));
            }
            FillCart();
            lblOrdrCmplt.Text = "Your order has been confirmed successfully. Check your mail for confirmation";
            using (MailMessage mm = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                mm.Subject = txtEmail.Text.Trim();
                //mm.IsBodyHtml = true;
//                string htmlString = @"<html>
//                <body>
//                    <h2>Thanks for Shopping with Pharmacel</h2>
//                    <p>Your order has been confirmed successfully.Shipping ID is + UniqueNo + </p>
//            </body>
//            </html>";
                mm.Body = "Thanks for shopping with Pharmacel. Your shipping ID is " + UniqueNo;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = smtpSection.Network.Host;
                smtp.EnableSsl = smtpSection.Network.EnableSsl;
                NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                smtp.Credentials = networkCred;
                smtp.Port = smtpSection.Network.Port;
                try
                {
                    smtp.Send(mm);
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email sent to');", true);

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            //Response.Write("Your Order has been confirmed");
        }
    }
    protected void gvCartedItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if(e.CommandName == "delete_cartedItems")
            { 
                //Response.Write(e.CommandArgument);
                int Id = Convert.ToInt32(e.CommandArgument);
                db.DeleteTempData(Id);
                Response.Redirect("cart.aspx");
                FillCart();
            }
            
        }
    }
}