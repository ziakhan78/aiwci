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


public partial class Admin_SendLogin : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                Session["AllPresidents"] = null;
                RadGrid1.Visible = false;
                btnSendLoginPass.Visible = false;
                btnSendTestLoginPass.Visible = false;
                lblMsg.Visible = false;

               // BindYears();
               // lblHeading.Text = "Send Login";
                BindDistrictNo();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    protected void ddlDesi_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            RadGrid1.Visible = false;
            RadGrid1.CurrentPageIndex = 0;
            lblMsg.Visible = false;

            // DDLYears.SelectedIndex = 0;
            int districtNo = 0;
            string strDistrictNo = ddlDistNo.SelectedItem.Text.ToString();
            string strDesi = ddlDesi.SelectedItem.Text.ToString();
            if (strDesi == "Executive Committee" && strDistrictNo == "Select District No.")
                districtNo = 0;
            else
                districtNo = int.Parse(strDistrictNo);

                BindPresidents(districtNo, strDesi);
        }
        catch { }
    }

    //private void BindYears()
    //{

    //    try
    //    {
    //        int dt = DateTime.Now.Year;
    //        int m = DateTime.Now.Month;
    //        if (m > 6 && m <= 12)
    //            dt = dt + 1;

    //        for (Int32 i = Convert.ToInt32(dt + 2); i >= 2017; i--)
    //        {
    //            string dtt = i + " - " + (i + 1);
    //            DDLYears.Items.Add(dtt.ToString());
    //        }

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}
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
    protected void btnSendLoginPass_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DateTime sDt, eDt;
            int id = 0;
            string email, password, clubName, presidentName, distNo, years = "";
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {
                try
                {
                    CheckBox chkbox = (CheckBox) item.FindControl("chkActive");
                    Label lblMemId = (Label) item.FindControl("lblMemId");

                    if (chkbox.Checked)
                    {
                        id = Int32.Parse(lblMemId.Text.ToString());

                        try
                        {
                            DBconnection con = new DBconnection();
                            // con.SetCommandQry = "select * from club_presidents_tbl where  id='" + id + "'";
                            distNo = ddlDistNo.SelectedItem.Text.Trim().ToString();
                            years = "";//DDLYears.SelectedItem.Text.Trim().ToString();

                            con.SetCommandQry = "select * from club_presidents_tbl where  id='" + id + "'";

                            DataTable dt = con.ExecuteTable();
                            email = dt.Rows[0]["email"].ToString();
                            password = dt.Rows[0]["password"].ToString();
                            clubName = dt.Rows[0]["club_name"].ToString();
                            presidentName = dt.Rows[0]["first_name"].ToString() + " " + dt.Rows[0]["last_name"].ToString();
                            //distNo = dt.Rows[0]["district_no"].ToString();

                            //sDt = DateTime.Parse(dt.Rows[0]["start_date"].ToString());

                            //eDt = DateTime.Parse(dt.Rows[0]["end_date"].ToString());

                            SendMailtoClient(presidentName, clubName, email, password, distNo, years);
                        }
                        catch(Exception ex) { }

                    }
                    chkbox.Checked = false;
                }
                catch { }
            }
        }        
    }
    private void SendMailtoClient(string presidentName, string clubName, string email, string password, string distNo, string years)
    {
        try
        {

            string districtNo = ddlDistNo.SelectedItem.Text.Trim();
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("mail@aiwcivoting.in");
            mail.To.Add(email.Trim().ToString());
            // mail.Bcc.Add("ziakhan78@gmail.com");           
            mail.Bcc.Add("aiwcivoting@gmail.com");
            //mail.Subject = "Login Credentials For District " + districtNo + " for AIWCI Elections";
            mail.Subject = "Login Credentials For AIWCI Elections";
            mail.IsBodyHtml = true;
            string pathVal = Server.MapPath("~");
            string readFileName = pathVal + "/Mail/PresidentLoginMail.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(readFileName);

            strMessage = sr1.ReadToEnd();

           // strMessage = strMessage.Replace("xxxDistrictNo", distNo.ToString());
          //  strMessage = strMessage.Replace("xxxYears", years);
          //  strMessage = strMessage.Replace("xxxWebsite", website);
            strMessage = strMessage.Replace("xxxPresident", presidentName);
            //strMessage = strMessage.Replace("xxxClub", clubName);
            strMessage = strMessage.Replace("xxxEmail", email);
            strMessage = strMessage.Replace("xxxPassword", password);

           // strMessage = strMessage.Replace("xxxFrom", sDt.ToString("dd MMM yyyy"));
           // strMessage = strMessage.Replace("xxxTo", eDt.ToString("dd MMM yyyy"));

            mail.Body = strMessage;
            sr1.Close();

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@aiwcivoting.in","d2G%C3gv@");

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


    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {       
        RadGrid1.CurrentPageIndex = 0;
    }
    //private void BindPresidents(int districtNo)
    //{
    //    DataTable dt = new DataTable();
    //    PresidentBll obj = new PresidentBll();
    //    obj.DistrictNo = districtNo.ToString();       

    //    dt = obj.GetPresidentByDistNo();
    //    if (dt.Rows.Count > 0)
    //    {
    //        Session["AllPresidents"] = districtNo;

    //        btnSendLoginPass.Visible = true;
    //        btnSendTestLoginPass.Visible = true;
    //        lblMsg.Visible = false;           
    //        RadGrid1.Visible = true;
    //        RadGrid1.DataSource = dt;
    //        RadGrid1.DataBind();
    //    }
    //    else
    //    {
    //        lblMsg.Visible = true;           
    //        RadGrid1.Visible = false;
    //    }
    //}

    private void BindPresidents(int districtNo, string designation)
    {
        DataTable dt = new DataTable();
        PresidentBll obj = new PresidentBll();
        obj.DistrictNo = districtNo.ToString();
        obj.DesiType = designation.ToString();

        dt = obj.GetDesiForSendMail();
        if (dt.Rows.Count > 0)
        {
            Session["AllPresidents"] = districtNo;
            btnSendLoginPass.Visible = true;
            btnSendTestLoginPass.Visible = true;
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["AllPresidents"] != null)
            {
                // string years = DDLYears.SelectedItem.Text.ToString();
                int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
                string strDesi = ddlDesi.SelectedItem.Text.ToString();
                BindPresidents(districtNo, strDesi);
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }


        }
        catch { }
    }

    protected void RadGrid1_PageIndexChanged(object sender, GridPageChangedEventArgs e)
    {
        ManageGrid();
    }

    protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }

    protected void RadGrid1_SortCommand(object sender, GridSortCommandEventArgs e)
    {
        ManageGrid();
    }

    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            RadGrid1.Visible = false;
            RadGrid1.CurrentPageIndex = 0;
            lblMsg.Visible = false;

            // DDLYears.SelectedIndex = 0;

            int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            string strDesi = ddlDesi.SelectedItem.Text.ToString();
            BindPresidents(districtNo, strDesi);
        }
        catch { }
    }

    protected void btnSendTestLoginPass_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {        
            int id = 0;
            string email="";
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {
                try
                {
                    CheckBox chkbox = (CheckBox)item.FindControl("chkActive");
                    Label lblMemId = (Label)item.FindControl("lblMemId");

                    if (chkbox.Checked)
                    {
                        id = Int32.Parse(lblMemId.Text.ToString());

                        try
                        {
                            DBconnection con = new DBconnection();
                            con.SetCommandQry = "select * from club_presidents_tbl where  id='" + id + "'";
                            DataTable dt = con.ExecuteTable();
                            email = dt.Rows[0]["email"].ToString();                        

                            SendTestMailtoClient(email);
                        }
                        catch (Exception ex) { }

                    }
                    chkbox.Checked = false;
                }
                catch { }
            }
        }
    }

    private void SendTestMailtoClient(string email)
    {
        try
        {
          
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("mail@aiwcivoting.in");
            mail.To.Add(email.Trim().ToString());                    
            mail.Bcc.Add("aiwcivoting@gmail.com");
            mail.Subject = "Test Mail for AIWCI Elections";

            mail.IsBodyHtml = true;
            string pathVal = Server.MapPath("~");
            string readFileName = pathVal + "/Mail/TestLoginMail.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(readFileName);

            strMessage = sr1.ReadToEnd();           
            mail.Body = strMessage;
            sr1.Close();

            SmtpClient emailClient = new SmtpClient();
            emailClient.Credentials = new NetworkCredential("mail@aiwcivoting.in", "d2G%C3gv@");

           // emailClient.Port = 587;
            //emailClient.Host = "smtp.zoho.com";
            // emailClient.Host = "smtp.gmail.com";
            // emailClient.EnableSsl = true;

            emailClient.Port = 25;
            emailClient.Host = "mail.aiwcivoting.in";
            emailClient.EnableSsl = false;
            emailClient.Send(mail);

            string jv = "<script>alert('Mail has been sent successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }

    }
}