using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_EligibleVoters : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHeading.Text = "Add Clubwise Eligible Voters";
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetDistrictNo(id);
            }
        }
    }
    private void GetDistrictNo(int id)
    {
        MastersBLL obj = new MastersBLL();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetDistrictNo();
        if (dt.Rows.Count > 0)
        {
            lblHeading.Text = "Edit Clubwise Eligible Voters";
            txtName.Text = dt.Rows[0]["district_no"].ToString();
        }

    }
    private void AddDistrictNo()
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.DistrictNo = int.Parse(txtName.Text.Trim().ToString());
            int i = obj.AddDistrictNo();

            if (i > 0)
            {              

                Clear();
                string jv = "<script>alert('Eligible Voters Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateDistrictNo(int id)
    {
        try
        {
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
            obj.DistrictNo = int.Parse(txtName.Text.Trim().ToString());
            int i = obj.UpdateColors();

            if (i > 0)
            {               
                Clear();
                //showmsg("District No. Has Been Updated Successfully", "view_district_no.aspx");
                string jv = "<script>alert('Eligible Voters Has Been Updated Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtName.Text = "";
    }
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDistrictNo(id);
            }
            else
            {
                AddDistrictNo();
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
                obj.SetCommandQry = "select district_no from district_no_tbl where district_no='" + txtName.Text.Trim().ToString() + "'";
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