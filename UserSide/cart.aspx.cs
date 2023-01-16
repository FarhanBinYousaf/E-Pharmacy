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
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            if(Request.Cookies["UserCookieValue"] != null)
            {
                var unique = Request.Cookies["UserCookieValue"]["rand"];
                var items = db.CartedProducts(long.Parse(unique)).ToList();
                gvCartedItems.DataSource = items;
                gvCartedItems.DataBind();
                foreach(var itemIterator in items)
                {
                    var eachPrice = itemIterator.ProductPrice;
                    price = price + eachPrice;
                    //Response.Write(price);
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
                tblOrderDetail OrderDetail = new tblOrderDetail();
                OrderDetail.ProductID = BuyedItems.ProID;
                OrderDetail.ProductPrice = BuyedItems.ProductPrice;
                OrderDetail.OrderID = OrderId;
                db.tblOrderDetails.Add(OrderDetail);
                db.SaveChanges();
            }
            lblOrdrCmplt.Text = "Youu order has been confirmed successfully. Check your mail for confirmation";
            using (MailMessage mm = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                mm.Subject = txtEmail.Text.Trim();
                mm.IsBodyHtml = true;
                string htmlString = @"<html>
                <body>
                    <h2>Thanks for Shopping with Pharmacel</h2>
                    <p>Your order has been confirmed successfully</p>
            </body>
            </html>";
                mm.Body = htmlString;
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
}