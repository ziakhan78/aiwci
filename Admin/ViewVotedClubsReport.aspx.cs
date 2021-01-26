using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Telerik.Web.UI;
using xi = Telerik.Web.UI.ExportInfrastructure;
using Telerik.Web.UI.GridExcelBuilder;


public partial class Admin_ViewVotedClubsReport : System.Web.UI.Page
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
               // ddlElectionName.Items.Insert(0, "Select");

            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    ////private void BindYears()
    ////{

    ////    try
    ////    {
    ////        int dt = DateTime.Now.Year;
    ////        int m = DateTime.Now.Month;
    ////        if (m > 6 && m <= 12)
    ////            dt = dt + 1;

    ////        for (Int32 i = Convert.ToInt32(dt + 2); i >= 2017; i--)
    ////        {
    ////            string dtt = i + " - " + (i + 1);
    ////            DDLYears.Items.Add(dtt.ToString());
    ////        }

    ////    }
    ////    catch (Exception E)
    ////    {
    ////        Response.Write(E.Message.ToString());
    ////    }
    ////}
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
        RadGrid4.Visible = false;
        lblMsg.Visible = false;
        // DDLYears.SelectedIndex = 0;
        btnExporttoExcel.Visible = false;
        lblMessage.Visible = false;

        string districtNo = ddlDistNo.SelectedItem.Text.Trim();
        //if (districtNo == "Select")
        //    return;
        //BindElectionName(int.Parse(districtNo));


        RadGrid4.Visible = false;
        lblMessage.Visible = false;
        int electionId = int.Parse(ddlElectionName.SelectedValue.ToString());
        if (districtNo == "All")
            districtNo = "1";

        BindVoteResultByPrefReport(electionId, int.Parse(districtNo));

    }

    //private void BindElectionName(int districtNo)
    //{
    //    MastersBLL obj = new MastersBLL();
    //    DataTable dt = new DataTable();
    //    obj.DistrictNo = districtNo;
    //    dt = obj.GetElectionNameListByDist();
    //    if (dt.Rows.Count > 0)
    //    {
    //        ddlElectionName.DataTextField = "election_name";
    //        ddlElectionName.DataValueField = "id";

    //        ddlElectionName.DataSource = dt;
    //        ddlElectionName.DataBind();
    //        ddlElectionName.Items.Insert(0, "Select");
    //    }
    //    else
    //    {
    //        ddlElectionName.Items.Clear();
    //        ddlElectionName.Items.Insert(0, "Select");
    //        RadGrid4.Visible = false;
    //    }
    //}

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

    private void BindVoteResultByPrefReport(int electionId, int districtNo)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.DistrictNo = districtNo;
        obj.ElectionId = electionId;
        // obj.Years = years;

        dt = obj.GetVotedClubs();
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
        //string year = DDLYears.SelectedItem.Text;
        //  year = year.Replace(" ", "");
        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid4.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid4.ExportSettings.FileName = ddlDistNo.SelectedItem.Text.Trim() + "_" + ddlElectionName.SelectedItem.Text.Trim() + "_Clubs_ThatHaveVoted";
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

 

    protected void ddlElectionName_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid4.Visible = false;
        lblMessage.Visible = false;
        ddlDistNo.SelectedIndex = 0;
        btnExporttoExcel.Visible = false;
    }
}