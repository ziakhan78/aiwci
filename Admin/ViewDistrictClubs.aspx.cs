
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewDistrictClubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "District Clubs List";
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

    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {        
        ddlDistNo.SelectedIndex = 0;
        ddlDistNo.Visible = true;
        RadGrid1.Visible = false;

        //if (rbtnType.SelectedValue == "0")
        //{
                      
        //}
        //else
        //{           
        //    ddlDistNo.Visible = false;

        //}
    }

    private void GetDistrictClub(int districtNo, string votingEligibility)
    {
        ClubsBll obj = new ClubsBll();
        DataTable dt = new DataTable();
        obj.DistrictNo = districtNo;
        obj.VotingEligibility = votingEligibility;
        dt = obj.GetDistrictClub();
        if (dt.Rows.Count > 0)
        {
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }

    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        string votingEligibility = "";        
        ddlDistNo.Visible = true;
        if (rbtnType.SelectedValue == "0")
        {            
            votingEligibility = "Yes";
        }
        else
        {           
            votingEligibility = "No";
        }

        RadGrid1.Visible = false;
        lblMsg.Visible = false; 
      
        string districtNo = ddlDistNo.SelectedItem.Text.Trim();
        if (districtNo == "Select District No.")
            return;

        if (districtNo == "All")
            districtNo = "1";

        GetDistrictClub(int.Parse(districtNo), votingEligibility);
    }
}