using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewVotingResultNonePref : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindYears();
                lblMsg.Visible = false;               
                RadGrid1.Visible = false;
                RadGrid2.Visible = false;
                lblPref2Head.Visible = false;
                lblPref3Head.Visible = false;

                BindDistrictNo();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void BindYears()
    {

        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt + 2); i >= 2017; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLYears.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void BindDistrictNo()
    {
        MastersBLL obj = new MastersBLL();
        DataTable dt = new DataTable();
        dt = obj.GetDistrictNoList();

        ddlDistNo.DataTextField = "district_no";
        ddlDistNo.DataValueField = "id";

        ddlDistNo.DataSource = dt;
        ddlDistNo.DataBind();
      
    }

    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {       
        lblPref2Head.Visible = false;
        lblPref3Head.Visible = false;
        RadGrid1.Visible = false;
        RadGrid2.Visible = false;
        lblMsg.Visible = false;
        DDLYears.SelectedIndex = 0;

        lblMessage.Visible = false;
    }
    private void BindVoteResultByNonePref2(int districtNo, string years)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.DistrictNo = districtNo;
        obj.Years = years;

        dt = obj.GetVoteResultByNonePref2();
        if (dt.Rows.Count > 0)
        {
            lblPref2Head.Visible = true;
            lblMsg.Visible = false;           
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblPref2Head.Visible = false;
            lblMsg.Visible = true;           
            RadGrid1.Visible = false;
        }
    }

    private void BindVoteResultByNonePref3(int districtNo, string years)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.DistrictNo = districtNo;
        obj.Years = years;

        dt = obj.GetVoteResultByNonePref3();
        if (dt.Rows.Count > 0)
        {
            lblPref3Head.Visible = true;
           // lblMsg.Visible = false;           
            RadGrid2.Visible = true;
            RadGrid2.DataSource = dt;
            RadGrid2.DataBind();
        }
        else
        {
            lblPref3Head.Visible = false;
           // lblMsg.Visible = true;          
            RadGrid2.Visible = false;
        }
    }
    DateTime eDt;
    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        string years = DDLYears.SelectedItem.Text.ToString();
        int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());

        if (Session["user"].ToString() != "admin")
        {

            bool b = CheckVotingDate(districtNo, years);
            if (b == true)
            {
                lblMsg.Visible = false;
                RadGrid1.Visible = false;
                RadGrid2.Visible = false;
                lblPref2Head.Visible = false;
                lblPref3Head.Visible = false;

                lblMessage.Visible = true;
                lblMessage.Text = "E-Voting results will be displayed only after the elections are over! <br />You will be able to see the E-Voting results for RID " + districtNo + " for " + years + " from " + eDt.ToString("dd MMM yyyy") + "";
            }
            else
            {
                lblMessage.Visible = false;
                BindVoteResultByNonePref2(districtNo, years);
                BindVoteResultByNonePref3(districtNo, years);
            }
        }
        else
        {
            lblMessage.Visible = false;
            BindVoteResultByNonePref2(districtNo, years);
            BindVoteResultByNonePref3(districtNo, years);
        }
    }
    private bool CheckVotingDate(int districtNo, string years)
    {

        bool b = false;
        int status = 0;
        DataTable dt = new DataTable();
        ElectionDateBll obj = new ElectionDateBll();
        obj.Years = years;
        obj.DistrictNo = districtNo;
        dt = obj.CheckElectionDateValidity();

        if (dt.Rows.Count > 0)
        {
            status = int.Parse(dt.Rows[0]["status"].ToString());
            eDt = DateTime.Parse(dt.Rows[0]["end_date"].ToString());
        }

        if (status > 0)
            b = true;
        else
            b = false;

        return b;
    }
}