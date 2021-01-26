using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewCandidates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {              

                //if (Session["user"].ToString() == "admin")
                //    addCandidate.Visible = true;
                //else
                //    addCandidate.Visible = false;

                lblHeading.Text = "Candidates List";
                //  BindYears();
                //  BindDistrictNo();
                BindElectionName();
                CheckPermission();
                

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

    ////private void BindDistrictNo()
    ////{
    ////    MastersBLL obj = new MastersBLL();
    ////    DataTable dt = new DataTable();
    ////    dt = obj.GetDistrictNoList();

    ////    ddlDistNo.DataTextField = "district_no";
    ////    ddlDistNo.DataValueField = "district_no";

    ////    ddlDistNo.DataSource = dt;
    ////    ddlDistNo.DataBind();
    ////    // ddlDistNo.Items.Insert(0, "0");
    ////}
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            CandidatesBll obj = new CandidatesBll();
            obj.Id = id;
           
            if (obj.DeleteCandidate() > 0)
            {
                //RadGrid1.DataBind();
                BindGrid(ddlElectionName.SelectedItem.Text.Trim().ToString());
            }
        }
    }
    public void CheckPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [admin_users_tbl]";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }


    protected void ddlElectionName_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid(ddlElectionName.SelectedItem.Text.Trim().ToString());
    }

    private void BindGrid(string electionName)
    {
        CandidatesBll obj = new CandidatesBll();
        obj.ElectionName = electionName;
        DataTable dt = new DataTable();
        dt = obj.GetCandidatesByElectionName();
        if (dt.Rows.Count > 0)
        {
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }
}