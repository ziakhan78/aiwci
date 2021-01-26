using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ElectionDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindYears();
               // BindDistrictNo();
                startDate.SelectedDate = DateTime.Now;
                endDate.SelectedDate = DateTime.Now;

                lblHeading.Text = "Add Election";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetElectionDate(id);
                }
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

            for (Int32 i = Convert.ToInt32(dt + 3); i >= 2020; i--)
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

    ////private void BindDistrictNo()
    ////{
    ////    MastersBLL obj = new MastersBLL();
    ////    DataTable dt = new DataTable();
    ////    dt = obj.GetDistrictNoList();

    ////    ddlDistNo.DataTextField = "district_no";
    ////    ddlDistNo.DataValueField = "id";

    ////    ddlDistNo.DataSource = dt;
    ////    ddlDistNo.DataBind();

    ////    ddlDistNo.Items.Insert(0, "Select");
    ////}
    private void GetElectionDate(int id)
    {
       

        ElectionDateBll obj = new ElectionDateBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetElectionDateById();
        if (dt.Rows.Count > 0)
        {
           // BindDistrictNo();

            lblHeading.Text = "Edit Election";
            txtElecName.Text = dt.Rows[0]["election_name"].ToString();
            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();
            // ddlDistNo.SelectedValue = dt.Rows[0]["district_no"].ToString();
            startDate.DbSelectedDate = dt.Rows[0]["start_date"].ToString();
            endDate.DbSelectedDate = dt.Rows[0]["end_date"].ToString();
        }

    }
    private void AddElectionDate()
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

            ElectionDateBll obj = new ElectionDateBll();
            // obj.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
            obj.ElectionName = txtElecName.Text.Trim().ToString();
            obj.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            obj.StartDate = DateTime.Parse(startDate.SelectedDate.ToString());
            obj.EndDate = DateTime.Parse(endDate.SelectedDate.ToString());
            obj.IpAddress = ipaddress;
            int i = obj.AddElectionDate();

            if (i > 0)
            {
                Clear();
                string jv = "<script>alert('Election Date Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch(Exception ex) { }
    }
    private void UpdateElectionDate(int id)
    {
        try
        {
            ElectionDateBll obj = new ElectionDateBll();
            obj.Id = id;
            obj.ElectionName = txtElecName.Text.Trim().ToString();
            obj.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            obj.StartDate = DateTime.Parse(startDate.SelectedDate.ToString());
            obj.EndDate = DateTime.Parse(endDate.SelectedDate.ToString());
            int i = obj.UpdateElectionDate();

            if (i > 0)
            {               
                Clear();
                showmsg("Election Date Has Been Updated Successfully", "ViewElectionDate.aspx");
                //string jv = "<script>alert('Election Date Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtElecName.Text = "";
        startDate.Clear();
        endDate.Clear();    
    }
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateElectionDate(id);
            }
            else
            {
                AddElectionDate();
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
    
    protected void endDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {
        try
        {
            DateTime st = DateTime.Parse(startDate.SelectedDate.ToString());
            DateTime et = DateTime.Parse(endDate.SelectedDate.ToString());

            System.TimeSpan diff = et.Subtract(st);
            System.TimeSpan diff1 = et - st;

            lblVote.Text = (et - st).TotalDays.ToString();
        }
        catch { }
    }

    protected void startDate_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {
        try
        {
            DateTime st = DateTime.Parse(startDate.SelectedDate.ToString());
            DateTime et = DateTime.Parse(endDate.SelectedDate.ToString());

            System.TimeSpan diff = et.Subtract(st);
            System.TimeSpan diff1 = et - st;

            lblVote.Text = (et - st).TotalDays.ToString();
        }
        catch
        { }
    }

   

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
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
                obj.SetCommandQry = "select * from election_date_tbl where years='" + DDLYears.SelectedItem.Text.Trim().ToString() + "' and election_name='" + txtElecName.Text.Trim().ToString() + "' and GETDATE() between start_date and end_date";
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