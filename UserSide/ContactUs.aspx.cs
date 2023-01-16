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
public partial class UserSide_ContactUs : System.Web.UI.Page
{
    public string Msg;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnContactUs_Click(object sender, EventArgs e)
    {
        SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
        using(EPharmacy027Entities db = new EPharmacy027Entities())
        {
            tblContact contact = new tblContact();
            contact.Name = txtName.Text;
            contact.Email = txtEmail.Text;
            contact.Subject = txtSubject.Text;
            contact.Message = txtMessage.InnerText;
            db.tblContacts.Add(contact);
            db.SaveChanges();
            lblMsg.Style.Add("display", "block");
            lblMsg.InnerText = "We have received your message, will respond you back soon. Check your Email for detail.";
            //Msg = 
            using (MailMessage mm = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                mm.Subject = txtEmail.Text.Trim();
                mm.IsBodyHtml = true;
                string htmlString = @"<html>
                <body>
                    <h2>Thanks to contact us</h2>
                    <p>We have received your message, will respond you back soon.</p>
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
        }
    }
}