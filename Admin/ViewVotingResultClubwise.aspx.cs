using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ViewVotingResultClubwise : System.Web.UI.Page
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
                Session["DistWiseAllClub"] = null;
                Session["AllClubs"] = null;
                Session["SingleClub"] = null;
               

                BindYears();
                rbtnSort.Visible = false;
                RadGrid1.Visible = false;

                BindDistrictNo();
                lblMsg.Visible = false;
                ddlClubName.Visible = false;
                // lblHeading.Text = "View District No.";
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
    protected void rbtnSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["DistWiseAllClub"] = null;
        Session["AllClubs"] = null;
        Session["SingleClub"] = null;

        if (rbtnSort.SelectedIndex == 0)
        {
            Session["AllClubs"] = "All";
            ddlClubName.Visible = false;
            lblMsg.Visible = false;
            string years = DDLYears.SelectedItem.Text.ToString();
            int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            BindVoteResultByClubwise(districtNo, years);
        }
        else
        {
            ddlClubName.Visible = true;
            int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            Session["DistWiseAllClub"] = districtNo;
            BindClubByDistId(districtNo);
        }
    }
    private void BindClubByDistId(int distNo)
    {
        ClubsBll obj = new ClubsBll();
        DataTable dt = new DataTable();
        obj.DistrictNo = distNo;
        dt = obj.GetClubByDistNo();

        ddlClubName.DataTextField = "club_name";
        ddlClubName.DataValueField = "id";

        ddlClubName.DataSource = dt;
        ddlClubName.DataBind();
        ddlClubName.Items.Insert(0, "Select");
    }
    protected void ddlClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string clubName = ddlClubName.SelectedItem.Text.Trim().ToString();
        Session["DistWiseAllClub"] = null;
        Session["AllClubs"] = null;
        Session["SingleClub"] = clubName;

        BindGridClubwise(clubName);
    }
    private void BindGridClubwise(string clubName)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_VotingResultClubwise where vote_prefrence!=0 and VoterClubName='" + clubName + "' order by vote_prefrence";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
           lblMsg.Visible = false;
            RadGrid1.AllowSorting = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
           lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        rbtnSort.Visible = false;
        RadGrid1.Visible = false;      
        lblMsg.Visible = false;
        ddlClubName.Visible = false;
        DDLYears.SelectedIndex = 0;
        lblMessage.Visible = false;
    }
    private void BindVoteResultByClubwise(int districtNo, string years)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.DistrictNo = districtNo;
        obj.Years = years;

        dt = obj.GetVoteResultByClubwise();
        if (dt.Rows.Count > 0)
        {
            Session["AllClubs"] = districtNo;
            lblMsg.Visible = false;
            rbtnSort.Visible = true;
            RadGrid1.Visible = true;           
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            rbtnSort.Visible = false;
            RadGrid1.Visible = false;          
        }
    }

    DateTime eDt;
    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlClubName.Visible = false;
        ddlClubName.SelectedIndex = 0;
        rbtnSort.SelectedIndex = 0;
        RadGrid1.CurrentPageIndex = 0;

        Session["DistWiseAllClub"] = null;
        Session["AllClubs"] = null;
        Session["SingleClub"] = null;

        rbtnSort.SelectedIndex = 0;
        string years = DDLYears.SelectedItem.Text.ToString();
        int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());

        if (Session["user"].ToString() != "admin")
        {

            bool b = CheckVotingDate(districtNo, years);
            if (b == true)
            {
                RadGrid1.Visible = false;
                lblMsg.Visible = false;

                lblMessage.Visible = true;
                lblMessage.Text = "E-Voting results will be displayed only after the elections are over! <br />You will be able to see the E-Voting results for RID " + districtNo + " for " + years + " from " + eDt.ToString("dd MMM yyyy") + "";
            }
            else
            {
                lblMessage.Visible = false;
                BindVoteResultByClubwise(districtNo, years);
            }
        }
        else
        {
            lblMessage.Visible = false;
            BindVoteResultByClubwise(districtNo, years);
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

    private void ManageGrid()
    {
        try
        {
            if (Session["AllClubs"] != null)
            {
                string years = DDLYears.SelectedItem.Text.ToString();
                int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
                BindVoteResultByClubwise(districtNo, years);
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }


            else if (Session["SingleClub"] != null)
            {
                BindGridClubwise(ddlClubName.SelectedItem.Text.Trim().ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

            }

            else if (Session["DistWiseAllClub"] != null)
            {

                int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
                BindClubByDistId(districtNo);
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

            }

           
        }
        catch { }
    }

    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }

    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }

    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
}