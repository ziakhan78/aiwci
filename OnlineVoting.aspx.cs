using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnlineVoting : System.Web.UI.Page
{
    string candidateId = string.Empty;
    private string elecName = string.Empty;
    private string elecYears = string.Empty;
    private string elecDistrict = string.Empty;
    DateTime eDt;
    int electionId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Voter"] != null)
            {
                if (!IsPostBack)
                {
                    string[] arrElecId = ConfigurationManager.AppSettings["ElectionId"].ToString().Split(',');
                    electionId = int.Parse(arrElecId[0]);
                    string nextElectionId = arrElecId[1];
                    Session["ElecId"] = electionId;
                    bool b = CheckVotingDate();
                    if (b == true)
                    {
                        divDtMsg.Visible = false;

                       // BindCandidates(electionId);
                         BindCandidates(electionId, nextElectionId);
                        BindSecondPostOnBtn(int.Parse(nextElectionId));
                    }
                    else
                    {
                        GetVotingDate();
                        divDtMsg.Visible = true;
                    }
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception ex) { Response.Redirect("Login.aspx"); }
    }


    //private void BindCandidates(int electionId, string nextElectionId)
    //private void BindCandidates(int electionId)
    private void BindCandidates(int electionId, string nextElectionId)
    {
        CandidatesBll obj = new CandidatesBll();
        DataTable dt = new DataTable();
        obj.ElectionId = electionId;
        dt = obj.GetCandidateByElection();
        if (dt.Rows.Count > 0)
        {
            btnElection.Attributes.Add("ElectionId", nextElectionId + "," + electionId);

            lblElecTitle.Text = "Inner Wheel " + dt.Rows[0]["elec_district"].ToString() + " Election - " + dt.Rows[0]["election_name"].ToString() + " " + dt.Rows[0]["elec_year"].ToString();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                bool b = CheckVotingDate();
                if (b == true)
                {
                    divDtMsg.Visible = false;
                    try
                    {
                        RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
                        Label lblCandidateId = (Label)item.FindControl("lblCandidateId");
                        int candidateId = int.Parse(lblCandidateId.Text);
                        Label lblCandidate = (Label)item.FindControl("lblCandidate");
                        SubmitVote(candidateId, lblCandidate.Text.Trim());
                    }
                    catch
                    {
                        Session.Abandon();
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    GetVotingDate();
                    divDtMsg.Visible = true;
                }
            }
        }
        catch
        { }
    }
    private void SubmitVote(int candidateId, string candidate)
    {
        try
        {
            int voterId = 0;
            voterId = int.Parse(Session["VoterId"].ToString().Trim());
            string email = Session["EmailId"].ToString().Trim();

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            VoteBll obj = new VoteBll();
            obj.VoterId = voterId;
            obj.CandidateId = candidateId;
            obj.Ipaddress = ipaddress;

            int i = obj.SubmitVote();

            if (i > 0)
            {
                SendMailtoClient(email, candidate, ipaddress);
                Session.Abandon();
                //  showmsg("You Have Successfully Submited Your Vote.", "Default.aspx");

                lblMsg.Text = "You Have Successfully Submited Your Vote.";
                showmsg("You Have Successfully Submited Your Vote.");
            }
        }
        catch (Exception ex)
        { showmsg("Server Error: Please Try Again!", "Login.aspx"); }
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            electionId = int.Parse(Session["ElecId"].ToString());
            DataTable dt = new DataTable();
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "select * from View_CandidatesWithVotes where voter_id='" + int.Parse(Session["VoterId"].ToString()) + "' and election_id='" + electionId + "'";
            //obj.SetCommandQry = "select * from View_CandidatesWithVotes where voter_id='" + int.Parse(Session["VoterId"].ToString()) + "'";
            // obj.SetCommandQry = "select * from View_CandidatesWithVotes where years='" + years + "' and voter_id='" + int.Parse(Session["VoterId"].ToString()) + "'";
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
        catch
        {
            args.IsValid = true;
        }
    }

    private void SendMailtoClient(string email, string candidate, string ipaddress)
    {
        try
        {
            string clubName = Session["ClubName"].ToString().Trim();
            string districtNo = Session["DistrictNo"].ToString().Trim();
            string president = Session["AdminUserName"].ToString().Trim();
            MailMessage mail = new MailMessage();

            mail.From = new MailAddress("mail@aiwcivoting.in");
            mail.To.Add(email);
           // mail.To.Add("ziakhan78@gmail.com");
            mail.Bcc.Add("aiwcivoting@gmail.com");
            // mail.Bcc.Add("zia@goradiainfotech.com");
            mail.Subject = "E-Vote Receipt for "+ elecName;

            mail.IsBodyHtml = true;
            string pathVal = Server.MapPath("~");
            string readFileName = pathVal + "/Mail/VotingReceipt.htm";
            string strMessage = "";
            StreamReader sr1 = new StreamReader(readFileName);

            strMessage = sr1.ReadToEnd();

            strMessage = strMessage.Replace("XXXPresident", president);
            strMessage = strMessage.Replace("XXXDistrict", districtNo);
            strMessage = strMessage.Replace("XXXElecName", elecName);
            strMessage = strMessage.Replace("XXXElecYear", elecYears);
            strMessage = strMessage.Replace("XXXClub", clubName);
            strMessage = strMessage.Replace("XXXCandidate", candidate);
            strMessage = strMessage.Replace("XXXDate", DateTime.Now.ToString("dd MMMM, yyyy  h:mm tt"));
            strMessage = strMessage.Replace("XXXIpaddress", ipaddress);
              

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

            //string jv = "<script>alert('Mail has been sent successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);



        }
        catch (Exception ex)
        {
            string ss = ex.ToString();
        }
    }
    public void showmsg(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    private void GetVotingDate()
    {
        electionId = int.Parse(Session["ElecId"].ToString());
        ElectionDateBll obj = new ElectionDateBll();
        //obj.DistrictNo = districtNo;
        //obj.Years = years;
        obj.Id = electionId;
        DataTable dt = new DataTable();
        //dt = obj.GetElectionDates();
        dt = obj.GetElectionDateById();
        if (dt.Rows.Count > 0)
        {
            string date = "";
            DateTime startDate, endDate;
            startDate = DateTime.Parse(dt.Rows[0]["start_date"].ToString());
            endDate = DateTime.Parse(dt.Rows[0]["end_date"].ToString());
            string days = dt.Rows[0]["voting_days"].ToString();

            date = startDate.ToString("dddd 'the' dd MMMM yyyy") + " to " + endDate.ToString("dddd 'the' dd MMMM yyyy");

            lblDate.Text = "Online voting is valid for " + days + " days only.<br /><br />" + "Voting period will start from " + date + " only.";
        }
    }
    private bool CheckVotingDate()
    {
        electionId = int.Parse(Session["ElecId"].ToString());
        bool b = false;
        int status = 0;
        DataTable dt = new DataTable();
        ElectionDateBll obj = new ElectionDateBll();
        //obj.Years = years;
        //obj.DistrictNo = districtNo;
        obj.ElectionId = electionId;
        dt = obj.CheckElectionDateValidity();

        if (dt.Rows.Count > 0)
        {
            status = int.Parse(dt.Rows[0]["status"].ToString());
            eDt = DateTime.Parse(dt.Rows[0]["end_date"].ToString());
            elecName = dt.Rows[0]["election_name"].ToString().Trim();
            elecDistrict = dt.Rows[0]["district_no"].ToString().Trim();
            elecYears = dt.Rows[0]["years"].ToString().Trim();
        }

        if (status > 0)
            b = true;
        else
            b = false;

        return b;
    }

    private void BindSecondPostOnBtn(int electionId)
    {
        CandidatesBll obj = new CandidatesBll();
        DataTable dt = new DataTable();
        obj.ElectionId = electionId;
        dt = obj.GetCandidateByElection();
        if (dt.Rows.Count > 0)
        {
            btnElection.Text = "Vote for " + dt.Rows[0]["election_name"].ToString();
        }
    }


    protected void btnElection_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string[] arrElecId = btn.Attributes["ElectionId"].ToString().Split(',');
        btnElection.Attributes.Add("ElectionId", arrElecId[1] + "," + arrElecId[0]);
        electionId = int.Parse(arrElecId[0]);
        Session["ElecId"] = electionId;
        BindCandidates(int.Parse(arrElecId[0]), arrElecId[1]);
        BindSecondPostOnBtn(int.Parse(arrElecId[1]));
    }
}