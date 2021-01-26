using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using Telerik.Web.UI;
using System.Configuration;


public partial class Admin_ViewClubPresidents : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "Club President List";
                BindDistrictNo();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void BindDistrictNo()
    {
        MastersBLL obj = new MastersBLL();
        DataTable dt = new DataTable();
        dt = obj.GetDistrictNoList();

        ddlDistNo.DataTextField = "district_no";
        ddlDistNo.DataValueField = "district_no";

        ddlDistNo.DataSource = dt;
        ddlDistNo.DataBind();
       // ddlDistNo.Items.Insert(0, "0");
    }
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            PresidentBll obj = new PresidentBll();
            obj.Id = id;
           
            if (obj.DeletePresident() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    //protected void btnSendLoginPass_Click(object sender, EventArgs e)
    //{
    //    int id = 0;
    //    string email, password, clubName, presidentName, distNo = "";
    //    foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
    //    {
    //        try
    //        {
    //            CheckBox chkbox = (CheckBox) item.FindControl("chkActive");
    //            Label lblMemId = (Label) item.FindControl("lblMemId");

    //            if (chkbox.Checked)
    //            {
    //                id = Int32.Parse(lblMemId.Text.ToString());

    //                try
    //                {
    //                    DBconnection con = new DBconnection();
    //                    con.SetCommandQry = "select * from club_presidents_tbl where  id='" + id + "'";
    //                    DataTable dt = con.ExecuteTable();
    //                    email = dt.Rows[0]["email"].ToString();
    //                    password = dt.Rows[0]["password"].ToString();
    //                    clubName = dt.Rows[0]["club_name"].ToString();
    //                    presidentName = dt.Rows[0]["first_name"].ToString() + " " + dt.Rows[0]["last_name"].ToString();
    //                    distNo = dt.Rows[0]["district_no"].ToString();

    //                    SendMailtoClient(presidentName, clubName, email, password, distNo);                        
    //                }
    //                catch { }

    //            }
    //            chkbox.Checked = false;
    //        }
    //        catch { }
    //    }
    //   // ManageGrid();
    //}
    //private void SendMailtoClient(string presidentName, string clubName, string email, string password, string distNo)
    //{
    //    try
    //    {
    //        //string years, website = "";
    //        //if(distNo==3231)
    //        //{
    //        //    years = "2017-18";
    //        //    website = "http://rid3231evoting.com/";
    //        //}

    //        //if (distNo == 3231)
    //        //{
    //        //    years = "2017-18";
    //        //    website = "http://rid3231evoting.com/";
    //        //}

    //        //if (distNo == 3231)
    //        //{
    //        //    years = "2017-18";
    //        //    website = "http://rid3231evoting.com/";
    //        //}

    //        MailMessage mail = new MailMessage();
    //        //mail.To.Add(email);  
    //        mail.To.Add("zia@goradiainfotech.com");
    //        mail.From = new MailAddress("mail@rid3231evoting.com");            
    //       // mail.Bcc.Add("zia@goradiainfotech.com");
    //        mail.Subject = "RID" + distNo + " E-Voting  Login Information";

    //        mail.IsBodyHtml = true;
    //        string pathVal = Server.MapPath("~");
    //        string readFileName = pathVal + "/Mail/PresidentLoginMail.htm";
    //        string strMessage = "";
    //        StreamReader sr1 = new StreamReader(readFileName);

    //        strMessage = sr1.ReadToEnd();

    //        strMessage = strMessage.Replace("xxxDistrictNo", distNo.ToString());
    //        //strMessage = strMessage.Replace("xxxYears", years);
    //       // strMessage = strMessage.Replace("xxxWebsite", website);
    //        strMessage = strMessage.Replace("xxxPresident", presidentName);
    //        //strMessage = strMessage.Replace("xxxClub", clubName);
    //        strMessage = strMessage.Replace("xxxEmail", email);
    //        strMessage = strMessage.Replace("xxxPassword", password);

    //        mail.Body = strMessage;
    //        sr1.Close();

    //        SmtpClient emailClient = new SmtpClient();
    //        emailClient.Credentials = new NetworkCredential("mail@rid3231evoting.com", "G&s5h%90");
    //        emailClient.Port = 587;
    //        emailClient.Host = "smtp.zoho.com";
    //        emailClient.EnableSsl = true;
    //        emailClient.Send(mail);

    //        string jv = "<script>alert('Mail has been sent successfully');</script>";
    //        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

    //    }
    //    catch (Exception ex)
    //    {
    //        string ss = ex.ToString();
    //    }

    //}

}