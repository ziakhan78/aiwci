using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_DistrictClubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "Add District Club";
                BindDistrictNo();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetClub(id);
                }
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
        ddlDistNo.DataValueField = "id";

        ddlDistNo.DataSource = dt;
        ddlDistNo.DataBind();
        ddlDistNo.Items.Insert(0, "Select");
    }
    private void GetClub(int id)
    {
        ClubsBll obj = new ClubsBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetClubById();
        if (dt.Rows.Count > 0)
        {
            BindDistrictNo();

            lblHeading.Text = "Edit District No.";
            ddlDistNo.SelectedItem.Text = dt.Rows[0]["district_no"].ToString();
            txtClubNo.Text = dt.Rows[0]["club_no"].ToString();
            txtClubName.Text = dt.Rows[0]["club_name"].ToString();
            txtActiveMem.Text = dt.Rows[0]["active_members"].ToString();
           // txtHonoraryMem.Text = dt.Rows[0]["honorary_members"].ToString();

            string strEV = dt.Rows[0]["voting_eligibility"].ToString();
            if (strEV == "Yes")
                rbtnVEligibility.SelectedIndex = 0;
            else
                rbtnVEligibility.SelectedIndex = 1;         

           

        }
    }
    private void AddClub()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            // Look for a proxy address first
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            // If there is no proxy, get the standard remote address
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            ClubsBll obj = new ClubsBll();
            obj.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
            obj.ClubNo = int.Parse(txtClubNo.Text.Trim().ToString());
            obj.ClubName = txtClubName.Text.Trim().ToString();
            obj.ActiveMem = int.Parse(txtActiveMem.Text.Trim().ToString());
            obj.HonoraryMem = 0;
            obj.EligibleVotes = 0;
            obj.VotingEligibility = rbtnVEligibility.SelectedItem.Text.Trim().ToString();
            obj.Ipaddress = ipaddress;
            int i = obj.AddClub();

            if (i > 0)
            {              

                Clear();
                string jv = "<script>alert('District Club Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch(Exception ex) { }
    }
    private void UpdateClub(int id)
    {
        try
        {
            ClubsBll obj = new ClubsBll();
            obj.Id = id;
            obj.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
            obj.ClubNo = int.Parse(txtClubNo.Text.Trim().ToString());
            obj.ClubName = txtClubName.Text.Trim().ToString();
            obj.ActiveMem = int.Parse(txtActiveMem.Text.Trim().ToString());
            obj.HonoraryMem = 0;
            obj.EligibleVotes = 0;
            obj.VotingEligibility = rbtnVEligibility.SelectedItem.Text.Trim().ToString();
            int i = obj.UpdateClub();

            if (i > 0)
            {               
                Clear();
                showmsg("District Club Has Been Updated Successfully", "ViewDistrictClubs.aspx");
                //string jv = "<script>alert('District Club Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch(Exception ex) { }
    }
    private void Clear()
    {
        ddlDistNo.SelectedIndex = 0;
        txtClubNo.Text = "";
        txtClubName.Text = "";
        txtActiveMem.Text = "";       
        rbtnVEligibility.SelectedIndex = 0;

    }
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateClub(id);
            }
            else
            {
                AddClub();
            }
        }
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void CVDistNo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
           // CVDistNo.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select club_name from district_clubs_tbl where club_name='" + txtClubName.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }


  

}