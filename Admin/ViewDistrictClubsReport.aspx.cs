
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Telerik.Web.UI.GridExcelBuilder;

public partial class Admin_ViewDistrictClubsReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "District Clubs Report";
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
            ClubsBll obj = new ClubsBll();
            obj.Id = id;
           
            if (obj.DeleteClub() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }

    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
       
        try
        {
            string districtNo = ddlDistNo.SelectedItem.Text.Trim();
            if (districtNo == "All")
                districtNo = "1";          
            
            //string alternateText = (sender as ImageButton).AlternateText;
            RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
            RadGrid1.ExportSettings.FileName = ddlDistNo.SelectedItem.Text.Trim() + "_ClubReport_" + DateTime.Now;
            // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            RadGrid1.MasterTableView.ExportToExcel();
        }
        catch { }

    }

    #region [ EXCELML FORMAT ]
    protected void RadGrid1_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {

        //if (CheckBox2.Checked)
        // {
        foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
        {
            row.Cells[0].StyleValue = "Style1";
        }

        StyleElement style = new StyleElement("Style1");
        style.InteriorStyle.Pattern = InteriorPatternType.Solid;
        style.InteriorStyle.Color = System.Drawing.Color.LightGray;
        e.WorkBook.Styles.Add(style);
        // }
    }

    #endregion
}