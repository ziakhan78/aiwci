using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;


public partial class Admin_Candidates : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindYears();
                candidateImage.Visible = false;
                lblBiodataLink.Text = "";

                BindElectionName();
                BindDistrictNo();
                lblHeading.Text = "Add Candidate's Details";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetCandidate(id);
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

    private void GetCandidate(int id)
    {
        CandidatesBll obj = new CandidatesBll();
        obj.Id = id;
        DataTable dt = new DataTable();
        dt = obj.GetCandidateById();
        if (dt.Rows.Count > 0)
        { 
            lblHeading.Text = "Edit Candidate's Details";
            
            BindElectionName();
            ddlElectionName.SelectedItem.Text = dt.Rows[0]["election_name"].ToString();
            ddlElectionName.SelectedValue = dt.Rows[0]["election_id"].ToString();
            ddlDistNo.SelectedItem.Text = dt.Rows[0]["district_no"].ToString();
            int distNo = int.Parse(dt.Rows[0]["district_no"].ToString());
            BindClubByDistId(distNo);

            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();

            ddlClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            txtName.Text = dt.Rows[0]["name"].ToString();
            joiningDate.Text = dt.Rows[0]["joining_date"].ToString();
            txtClassification.Text = dt.Rows[0]["classification"].ToString();
            txtMemberShipNo.Text = dt.Rows[0]["membership_no"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            txtMobile.Text = dt.Rows[0]["mobile"].ToString();
            birthday.DbSelectedDate = dt.Rows[0]["birthday"].ToString();

            txtDesc.Content = dt.Rows[0]["description"].ToString();

            string strImg = dt.Rows[0]["photo"].ToString();
            if (strImg != "")
            {
                Session["Image"] = strImg;
                candidateImage.Visible = true;
                candidateImage.ImageUrl = "../CandidatesImage/" + strImg;
                
            }

            string strBiodata = dt.Rows[0]["biodata"].ToString();
            if (strBiodata != "")
            {
                Session["Biodata"] = strBiodata;
                cadBio.Visible = true;                
                cadBio.HRef = "../CandidatesBiodata/" + strBiodata;
                lblBiodataLink.Text = "../CandidatesBiodata/" + strBiodata;
            }
        }

    }
    private void AddCandidate()
    {
        try
        {
            string bioData = "";
            string photo = "";

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            CandidatesBll obj = new CandidatesBll();

            obj.ElectionId = int.Parse(ddlElectionName.SelectedValue.ToString());
            obj.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
            obj.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            obj.ClubName = ddlClubName.SelectedItem.Text.Trim().ToString();
            obj.Name = txtName.Text.Trim().ToString();
            obj.JoiningDate = joiningDate.Text.Trim();

            ////try
            ////{
            ////    obj.JoiningDate = DateTime.Parse(joiningDate.SelectedDate.ToString());
            ////}
            ////catch { obj.JoiningDate = nullDate; }

            obj.Classification = txtClassification.Text.Trim().ToString();
            try
            {
                obj.MembershipNo = int.Parse(txtMemberShipNo.Text.Trim().ToString());
            }
            catch { obj.MembershipNo = 0; }

            obj.Email = txtEmail.Text.Trim().ToString();

            obj.Mobile = txtMobile.Text.Trim().ToString();
            try
            {
                obj.Birthday = DateTime.Parse(birthday.SelectedDate.ToString());
            }
            catch { obj.Birthday = nullDate; }

            try
            {
                obj.Photo = Session["Image"].ToString();
            }
            catch { obj.Photo = ""; }

            try
            {
                obj.BioData = Session["Biodata"].ToString();
            }
            catch { obj.BioData = ""; }


            obj.Description = txtDesc.Content;
            obj.Ipaddress = ipaddress;
             

            int i = obj.AddCandidate();

            if (i > 0)
            {             

                Clear();
                string jv = "<script>alert('Candidates Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch (Exception ex){ string s = ex.Message; }
    }
    private void UpdateCandidate(int id)
    {
        try
        {
            string bioData = "";
            string photo = "";

            System.Data.SqlTypes.SqlDateTime nullDate;
            nullDate = SqlDateTime.Null;

            CandidatesBll obj = new CandidatesBll();
            obj.Id = id;
            obj.ElectionId = int.Parse(ddlElectionName.SelectedValue.ToString());
            obj.DistrictNo = int.Parse(ddlDistNo.SelectedItem.Text.Trim().ToString());
            obj.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            obj.ClubName = ddlClubName.SelectedItem.Text.Trim().ToString();
            obj.Name = txtName.Text.Trim().ToString();
            obj.JoiningDate = joiningDate.Text.Trim();

            //try
            //{
            //    obj.JoiningDate = DateTime.Parse(joiningDate.SelectedDate.ToString());
            //}
            //catch { obj.JoiningDate = nullDate; }

            obj.Classification = txtClassification.Text.Trim().ToString();
            try
            {
                obj.MembershipNo = int.Parse(txtMemberShipNo.Text.Trim().ToString());
            }
            catch { obj.MembershipNo = 0; }
            obj.Email = txtEmail.Text.Trim().ToString();
            obj.Mobile = txtMobile.Text.Trim().ToString();
            try
            {
                obj.Birthday = DateTime.Parse(birthday.SelectedDate.ToString());
            }
            catch { obj.Birthday = nullDate; }

            try
            {
                obj.Photo = Session["Image"].ToString();
            }
            catch { obj.Photo = ""; }

            try
            {
                obj.BioData = Session["Biodata"].ToString();
            }
            catch { obj.BioData = ""; }

            obj.Description = txtDesc.Content;

            int i = obj.UpdateCandidate();

            if (i > 0)
            {               
                Clear();
                showmsg("Candidates Has Been Updated Successfully", "ViewCandidates.aspx");
                //string jv = "<script>alert('Candidates Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtClassification.Text = "";
        txtDesc.Content = "";
        txtEmail.Text = "";
        txtMemberShipNo.Text = "";
        txtMobile.Text = "";
        txtName.Text = "";

        // joiningDate.Clear();
        joiningDate.Text = "";
        birthday.Clear();

        ddlDistNo.SelectedIndex = 0;
        ddlClubName.SelectedIndex = 0;
        ddlElectionName.SelectedIndex = 0;
        DDLYears.SelectedIndex = 0;

        Session["Image"] = null;
        Session["Biodata"] = null;
       
    }
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateCandidate(id);
            }
            else
            {
                AddCandidate();
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
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "CandidatesImage";

            string fileName, strFileName = "";
            string ext = "";

            strFileName = txtName.Text.Trim().Replace(" ", "").ToString() + "_" + ddlClubName.SelectedItem.Text.Trim().Replace(" ", "").ToString();

            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = strFileName + "_" + strDate + ext;           
            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["Image"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
    }
    protected void RadAsyncUpload2_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        try
        {
            string strPath = "CandidatesBiodata";

            string fileName, strFileName = "";
            string ext = "";

            strFileName = txtName.Text.Trim().Replace(" ", "").ToString() + "_" + ddlClubName.SelectedItem.Text.Trim().Replace(" ", "").ToString();

            fileName = e.File.FileName;
            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
            string strDate = System.DateTime.Now.ToString();
            strDate = strDate.Replace("/", "");
            strDate = strDate.Replace("-", "");
            strDate = strDate.Replace(":", "");
            strDate = strDate.Replace(" ", "");
            ext = fileName.Substring(fileName.LastIndexOf("."));
            fileName = strFileName + "_Biodata" + strDate + ext;
            string path = Server.MapPath("~/" + strPath + "/" + fileName);
            Session["Biodata"] = fileName;
            e.File.SaveAs(path);
        }
        catch
        {
        }
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
                obj.SetCommandQry = "select name from candidates_tbl where name='" + txtName.Text.Trim().ToString() + "' and district_no='" + ddlDistNo.SelectedItem.Text.Trim().ToString() + "' and club_name='" + ddlClubName.SelectedItem.Text.Trim().ToString() + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                  //  FailureText.Text = "";
                }
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }

}