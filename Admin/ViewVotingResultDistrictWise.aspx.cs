using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;

public partial class Admin_ViewVotingResultDistrictWise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                // BindYears();

                RadGrid1.Visible = false;
                lblMessage.Visible = false;
                BindElectionName();
                BindDistrictNo();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    
    private void BindElectionName()
    {
        MastersBLL obj = new MastersBLL();
        DataTable dt = new DataTable();
        dt = obj.GetElectionNameList();

        ddlElectionName.DataTextField = "election_name";
        ddlElectionName.DataValueField = "id";

        ddlElectionName.DataSource = dt;
        ddlElectionName.DataBind();
        ddlElectionName.Items.Insert(0, "Select");
    }
    private void BindVoteResultByPref1(int electionId)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.ElectionId = electionId;
        // obj.Years = years;

        dt = obj.GetVoteResultByPref1();
        if (dt.Rows.Count > 0)
        {
            lblMessage.Visible = false;
            RadGrid1.Visible = true;

            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMessage.Visible = true;
            RadGrid1.Visible = false;

        }
    }

    //protected void ddlElectionName_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int electionId = int.Parse(ConfigurationManager.AppSettings["ElectionId"]);
    //    if (Session["user"].ToString() != "admin")
    //    {
    //        bool b = CheckVotingDate(electionId);
    //        if (b == true)
    //        {
    //            RadGrid1.Visible = false;
    //            lblMessage.Visible = true;
    //            lblMessage.Text = "E-Voting results will be displayed only after the elections are over! <br />You will be able to see the E-Voting results from " + eDt.ToString("dd MMM yyyy") + "";
    //        }
    //        else
    //        {
    //            lblMessage.Visible = false;
    //            BindVoteResultByPref1(int.Parse(ddlElectionName.SelectedValue.Trim().ToString()));
    //        }
    //    }
    //    else
    //    {
    //        lblMessage.Visible = false;
    //        BindVoteResultByPref1(int.Parse(ddlElectionName.SelectedValue.Trim().ToString()));
    //    }
    //}

    DateTime eDt;
    private bool CheckVotingDate(int electionId)
    {

        bool b = false;
        int status = 0;
        DataTable dt = new DataTable();
        ElectionDateBll obj = new ElectionDateBll();

        obj.ElectionId = electionId;
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


    int total = 0;
    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        //if (e.Item is GridDataItem)
        //{
        //    GridDataItem dataItem = e.Item as GridDataItem;
        //    int fieldValue = Convert.ToInt32(dataItem["vote"].Text.Trim());
        //    total += fieldValue; // find total value(of cell 'Amount')for each item
        //}
        //if (e.Item is GridFooterItem)
        //{
        //    GridFooterItem footerItem = (GridFooterItem)e.Item;
        //    footerItem["vote"].Text = total.ToString(); //insert result in the footer of corresponding column
        //}
    }

    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid1.Visible = false;
       // lblMsg.Visible = false;
        // DDLYears.SelectedIndex = 0;
       // btnExporttoExcel.Visible = false;
        lblMessage.Visible = false;
        int electionId = int.Parse(ddlElectionName.SelectedValue.ToString());
        string districtNo = ddlDistNo.SelectedItem.Text.Trim();
        if (districtNo == "All")
            districtNo = "1";
        BindVotingResultDistrictWise(electionId, int.Parse(districtNo));
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
    private void BindVotingResultDistrictWise(int electionId,int districtNo)
    {
        DataTable dt = new DataTable();
        VoteBll obj = new VoteBll();
        obj.ElectionId = electionId;
        obj.DistrictNo = districtNo;

        dt = obj.GetVotingResultDistrictWise();
        if (dt.Rows.Count > 0)
        {
           // btnExporttoExcel.Visible = true;
          // lblMsg.Visible = false;
            RadGrid1.Visible = true;

            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
           // btnExporttoExcel.Visible = false;
          //  lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        // string year = DDLYears.SelectedItem.Text;
        // year = year.Replace(" ", "");
        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid1.ExportSettings.FileName = ddlDistNo.SelectedItem.Text.Trim() + "_VotingResult_" + DateTime.Now;
        // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.MasterTableView.ExportToExcel();
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
        ddlDistNo.SelectedIndex = 0;
        RadGrid1.Visible = false;
    }
}