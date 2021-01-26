using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Telerik.Web.UI;
using xi = Telerik.Web.UI.ExportInfrastructure;
using Telerik.Web.UI.GridExcelBuilder;


public partial class Admin_ViewNotVotedClubsReport : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblMessage.Visible = false;
               // BindYears();
                btnExporttoExcel.Visible = false;
                RadGrid4.Visible = false;
                lblMsg.Visible = false;
               BindDistrictNo();
                BindElectionName();


            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
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
        ddlDistNo.DataValueField = "id";

        ddlDistNo.DataSource = dt;
        ddlDistNo.DataBind();

    }

    private void BindElectionName()
    {
        MastersBLL obj = new MastersBLL();
        DataTable dt = new DataTable();
        dt = obj.GetElectionNameList();
        if (dt.Rows.Count > 0)
        {
            RadGrid4.Visible = true;
            ddlElectionName.DataTextField = "election_name";
            ddlElectionName.DataValueField = "id";

            ddlElectionName.DataSource = dt;
            ddlElectionName.DataBind();
            ddlElectionName.Items.Insert(0, "Select");
        }
        else
        {
            ddlElectionName.Items.Clear();
            ddlElectionName.Items.Insert(0, "Select");
            RadGrid4.Visible = false;
        }
    }

    protected void ddlElectionName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlDistNo.SelectedIndex = 0;
            RadGrid4.Visible = false;
            btnExporttoExcel.Visible = false;
            lblMessage.Visible = false;
            //int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
            //int electionId = int.Parse(ddlElectionName.SelectedValue.ToString());

            //BindVoteResultByPrefReport(electionId, districtNo);

        }
        catch { }
    }
    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid4.Visible = false;
        lblMsg.Visible = false;
       // DDLYears.SelectedIndex = 0;
        btnExporttoExcel.Visible = false;
        lblMessage.Visible = false;
        string strElectionId = ddlElectionName.SelectedValue.ToString();       
        if (strElectionId == "Select")
            return;
        string districtNo = ddlDistNo.SelectedItem.Text.Trim();
        if (districtNo == "Select")
            return;

        if (districtNo == "All")
            districtNo = "1";
        BindVoteResultByPrefReport(int.Parse(districtNo), int.Parse(strElectionId));
    }


    private void BindVoteResultByPrefReport(int districtNo, int electionId)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.DistrictNo = districtNo;
        obj.ElectionId = electionId;
        // obj.Years = years;

        dt = obj.GetNotVotedClubs();
        if (dt.Rows.Count > 0)
        {
            btnExporttoExcel.Visible = true;
            lblMsg.Visible = false;
            RadGrid4.Visible = true;

            RadGrid4.DataSource = dt;
            RadGrid4.DataBind();
        }
        else
        {
            btnExporttoExcel.Visible = false;
            lblMsg.Visible = true;
            RadGrid4.Visible = false;
        }
    }

    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
       // string year = DDLYears.SelectedItem.Text;
       // year = year.Replace(" ", "");
        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid4.ExportSettings.Excel.Format = (GridExcelExportFormat) Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid4.ExportSettings.FileName = ddlDistNo.SelectedItem.Text.Trim() + "_Clubs_ThatHaveNotVoted_"+ DateTime.Now; 
        // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
        RadGrid4.ExportSettings.ExportOnlyData = true;
        RadGrid4.ExportSettings.OpenInNewWindow = true;
        RadGrid4.MasterTableView.ExportToExcel();
    }

    #region [ EXCELML FORMAT ]
    protected void RadGrid4_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {

        foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
        {
            row.Cells[0].StyleValue = "Style1";
        }

        StyleElement style = new StyleElement("Style1");
        style.InteriorStyle.Pattern = InteriorPatternType.Solid;
        style.InteriorStyle.Color = System.Drawing.Color.LightGray;

        e.WorkBook.Styles.Add(style);

    }

    #endregion

    DateTime eDt;
    //protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string years = DDLYears.SelectedItem.Text.ToString();
    //    int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());

    //    if (Session["user"].ToString() != "admin")
    //    {
    //        bool b = CheckVotingDate(districtNo, years);
    //        if (b == true)
    //        {
    //            btnExporttoExcel.Visible = false;
    //            lblMsg.Visible = false;
    //            RadGrid4.Visible = false;

    //            lblMessage.Visible = true;
    //            lblMessage.Text = "E-Voting results will be displayed only after the elections are over! <br />You will be able to see the E-Voting results for RID " + districtNo + " for " + years + " from " + eDt.ToString("dd MMM yyyy") + "";
    //        }
    //        else
    //        {
    //            lblMessage.Visible = false;
    //            BindVoteResultByPrefReport(districtNo, years);
    //        }
    //    }
    //    else
    //    {
    //        lblMessage.Visible = false;
    //        BindVoteResultByPrefReport(districtNo, years);
    //    }
    //}
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