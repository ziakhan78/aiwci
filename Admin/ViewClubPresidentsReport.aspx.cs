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

using System.Configuration;


using Telerik.Web.UI;
using xi = Telerik.Web.UI.ExportInfrastructure;
using Telerik.Web.UI.GridExcelBuilder;

public partial class Admin_ViewClubPresidentsReport : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        btnExporttoExcel.Visible = false;
        ddlDistNo.Visible = true;
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "President Reports";
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
        //ddlDistNo.Items.Insert(0, "All");
    }
        
    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        string districtNo = "";
        try
        {
            if (rbtnType.SelectedValue == "0")
            {
                districtNo = ddlDistNo.SelectedItem.Text.Trim();
            }
            else
            {
                districtNo = "All";
            }
            
            //string alternateText = (sender as ImageButton).AlternateText;
            RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
            RadGrid1.ExportSettings.FileName = districtNo + "_PresidentReport_"+ DateTime.Now; 
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




    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        PresidentBll obj = new PresidentBll();
        obj.DistrictNo = ddlDistNo.SelectedItem.Text.Trim();
        DataTable dt = new DataTable();
        dt = obj.GetPresidentReport();
        if (dt.Rows.Count > 0)
        {
            btnExporttoExcel.Visible = true;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }

    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDistNo.SelectedIndex = 0;
        RadGrid1.Visible = false;
        btnExporttoExcel.Visible = false;
        if(rbtnType.SelectedValue=="0")
        {            
            ddlDistNo.Visible = true;

        }
        else
        {
            GetAllPresident();
            ddlDistNo.Visible = false;

        }
    }

    private void GetAllPresident()
    {
        PresidentBll obj = new PresidentBll();       
        DataTable dt = new DataTable();
        dt = obj.GetAllPresidentReport();
        if (dt.Rows.Count > 0)
        {
            btnExporttoExcel.Visible = true;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }

    int total = 0;
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
      
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = e.Item as GridDataItem;
            int fieldValue = Convert.ToInt32(dataItem["active_members"].Text.Trim());
            total += fieldValue; // find total value(of cell 'Amount')for each item
        }
        if (e.Item is GridFooterItem)
        {
            GridFooterItem footerItem = (GridFooterItem)e.Item;
            footerItem["active_members"].Text = total.ToString(); //insert result in the footer of corresponding column
        }
    }
}