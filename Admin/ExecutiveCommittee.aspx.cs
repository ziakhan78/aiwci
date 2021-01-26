using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;


public partial class Admin_ExecutiveCommittee : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindDistrictNo();
                lblHeading.Text = "Add Executive Committee";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetPresident(id);
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

    private void BindClubByDistId(int distNo)
    {
        ClubsBll obj = new ClubsBll();
        DataTable dt = new DataTable();
        obj.DistrictNo = distNo;
        dt = obj.GetClubByDistNo();

        ddlClubName.DataTextField = "club_name";
        ddlClubName.DataValueField = "id";

        ddlClubName.DataSource = dt;
        ddlClubName.DataBind();
        ddlClubName.Items.Insert(0, "Select");
    }

    private void GetPresident(int id)
    {
        PresidentBll obj = new PresidentBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetPresidentById();
        if (dt.Rows.Count > 0)
        { 
            lblHeading.Text = "Edit Executive Committee's Details";
            ddlDistNo.SelectedItem.Text = dt.Rows[0]["district_no"].ToString();
            int distNo = int.Parse(dt.Rows[0]["district_no"].ToString());
            BindClubByDistId(distNo);

            ddlClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            txtFirstName.Text = dt.Rows[0]["first_name"].ToString();
            txtLastName.Text = dt.Rows[0]["last_name"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            txtMobile.Text = dt.Rows[0]["mobile"].ToString();
            //txtPassword.Text = dt.Rows[0]["password"].ToString();

        }

    }
    private void AddPresident()
    {
        try
        {
            string strClubName = string.Empty;
            strClubName= ddlClubName.SelectedItem.Text.Trim().ToString();
            if (strClubName == "Select")
                strClubName = "";
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/
                      

            PresidentBll obj = new PresidentBll();

            string password = MakePassword(8);

            obj.DistrictNo = ddlDistNo.SelectedItem.Text.Trim().ToString();
            obj.ClubName = strClubName;
            obj.FirstName = txtFirstName.Text.Trim().ToString();
            obj.LastName = txtLastName.Text.Trim().ToString();
            obj.Email = txtEmail.Text.Trim().ToString();
            obj.Mobile = txtMobile.Text.Trim().ToString();
            obj.Password = password;
            obj.Ipaddress = ipaddress;
            obj.DesiType = "Executive Committee";            

            int i = obj.AddPresident();

            if (i > 0)
            {             

                Clear();
                string jv = "<script>alert('Executive Committee Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception ex){ string s = ex.Message; }
    }
    private void UpdatePresident(int id)
    {
        try
        {
            PresidentBll obj = new PresidentBll();
            obj.Id = id;

            obj.DistrictNo = ddlDistNo.SelectedItem.Text.Trim().ToString();
            obj.ClubName = ddlClubName.SelectedItem.Text.Trim().ToString();
            obj.FirstName = txtFirstName.Text.Trim().ToString();
            obj.LastName = txtLastName.Text.Trim().ToString();
            obj.Email = txtEmail.Text.Trim().ToString();
            obj.Mobile = txtMobile.Text.Trim().ToString();
           // obj.DesiType = "Executive Committee";
           // obj.Password = txtPassword.Text.Trim().ToString();

            int i = obj.UpdatePresident();

            if (i > 0)
            {               
                Clear();
                showmsg("Executive Committee Has Been Updated Successfully", "ViewExecutiveCommittee.aspx");
                //string jv = "<script>alert('Candidates Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtMobile.Text = "";    
        txtEmail.Text = "";       
        txtFirstName.Text = "";
        txtLastName.Text = "";
        ddlDistNo.SelectedIndex = 0;
        ddlClubName.SelectedIndex = 0;
    }
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdatePresident(id);
            }
            else
            {
                AddPresident();
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
   
    protected void ddlDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        int distNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
        BindClubByDistId(distNo);
    }
   
    protected void CVCandidate_ServerValidate(object source, ServerValidateEventArgs args)
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
                obj.SetCommandQry = "select first_name from club_presidents_tbl where first_name='" + txtFirstName.Text.Trim().ToString() + "' and district_no='" + ddlDistNo.SelectedItem.Text.Trim().ToString() + "' and club_name='" + ddlClubName.SelectedItem.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                    FailureText.Text = "";
                }
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }

    private string MakePassword(int length)
    {
        Random ran = new Random(DateTime.Now.Second);
        char[] password = new char[length];

        for (int i = 0; i < length; i++)
        {
            int[] n = { ran.Next(48, 57), ran.Next(65, 90), ran.Next(97, 122), ran.Next(35, 38) };
            int picker = ran.Next(0, 4);
            if (picker == 4)//if i make the maxvalue 2 it "never" appears... dunno whats going on there 
                picker = 3;
            password[i] = (char) n[picker];
        }

        return new string(password);

    }
}