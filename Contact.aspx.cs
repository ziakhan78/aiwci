using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            AddFeedback();
        }
    }
    private void AddFeedback()
    {
        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        FeedbackBll obj = new FeedbackBll();
        obj.Name = name.Value.Trim().ToString();
        obj.EmailId = email.Value.Trim().ToString();
        obj.ClubName = clubName.Value.Trim().ToString();
        obj.Mobile = mobile.Value.Trim().ToString();
        obj.Comments = txtComments.Text.ToString();
        obj.Ipaddress = ipaddress;
        int exe = obj.AddFeedback();

        if (exe > 0)
        {
            SendMailtoClient();
            txtComments.Text = "";
            name.Value = "";
            email.Value = "";
            clubName.Value = "";
            mobile.Value = "";
        }
    }

    private void SendMailtoClient()
    {
        try
        {
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("mail@aiwcivoting.in");
            mail.To.Add(email.Value.Trim().ToString());
            mail.To.Add("aiwcivoting@gmail.com");
            // mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "Feedback Enquiry";

            mail.IsBodyHtml = true;
            string pathVal = Server.MapPath("~");
            string readFileName = pathVal + "/Mail/Feedback.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(readFileName);

            strMessage = sr1.ReadToEnd();

            strMessage = strMessage.Replace("xxxName", name.Value.Trim().ToString());
            strMessage = strMessage.Replace("xxxEmail", email.Value.Trim().ToString());
            strMessage = strMessage.Replace("xxxClub", clubName.Value.Trim().ToString());
            strMessage = strMessage.Replace("xxxMobile", mobile.Value.Trim().ToString());
            strMessage = strMessage.Replace("xxxComments", txtComments.Text.ToString());

            mail.Body = strMessage;
            sr1.Close();

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@aiwcivoting.in", "d2G%C3gv@");

            emailClient.Port = 25;
            emailClient.Host = "mail.aiwcivoting.in";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);

            //emailClient.Port = 587;
            ////emailClient.Host = "smtp.zoho.com";
            //emailClient.Host = "smtp.gmail.com";
            //emailClient.EnableSsl = true;
            //emailClient.Send(mail);

            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);



        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }
}