using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Telerik.Web.UI;

public partial class Admin_ViewVotingResult : System.Web.UI.Page
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
    //private void BindDistrictNo()
    //{
    //    MastersBLL obj = new MastersBLL();
    //    DataTable dt = new DataTable();
    //    dt = obj.GetDistrictNoList();

    //    ddlDistNo.DataTextField = "district_no";
    //    ddlDistNo.DataValueField = "id";

    //    ddlDistNo.DataSource = dt;
    //    ddlDistNo.DataBind();      
    //}



    //protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int districtNo = int.Parse(ddlDistNo.SelectedItem.Text.ToString());
    //    BindVoteResultByPref1(districtNo);
    //    BindVoteResultByPref2(districtNo);
    //    BindVoteResultByPref3(districtNo);
    //}
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

    protected void ddlElectionName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int electionId = int.Parse(ddlElectionName.SelectedValue.Trim().ToString());
        BindVoteResultByPref1(electionId);
        //bool b = CheckVotingDate(electionId);
        //if (b == false)
        //{
        //    RadGrid1.Visible = false;
        //    lblMessage.Visible = true;
        //    // lblMessage.Text = "E-Voting results will be displayed only after the elections are over! <br />You will be able to see the E-Voting results from " + eDt.ToString("dd MMM yyyy") + "";
        //    lblMessage.Text = "Result not found!";
        //}
        //else
        //{
        //    lblMessage.Visible = false;
        //    BindVoteResultByPref1(int.Parse(ddlElectionName.SelectedValue.Trim().ToString()));
        //}

    }

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
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = e.Item as GridDataItem;
            int fieldValue = Convert.ToInt32(dataItem["vote"].Text.Trim());
            total += fieldValue; // find total value(of cell 'Amount')for each item
        }
        if (e.Item is GridFooterItem)
        {
            GridFooterItem footerItem = (GridFooterItem)e.Item;
            footerItem["vote"].Text = total.ToString(); //insert result in the footer of corresponding column
        }
    }
}