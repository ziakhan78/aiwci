using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Page.SetFocus("txtUsername");
            if (!IsPostBack)
            {
                if (Session["uname"] != null)
                {
                    Response.Redirect("~/Vote.aspx");
                }
                Response.Cache.SetNoStore();
                Response.Buffer = true;
                Response.ExpiresAbsolute = System.DateTime.Now;
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now);

                //string email = Request.Form["txtUsername"];
                //string psw = Request.Form["txtPassword"];
                //string remember = Request.Form["ckremember"];
                //Page.SetFocus("txtUsername");
                //if (email != null)
                //{
                //    txtUsername.Text = email.Trim();
                //    txtPassword.Attributes.Add("value", psw.Trim());
                //    if (remember == "on")
                //    {
                //        ckremember.Checked = true;
                //    }
                //    else
                //    {
                //        ckremember.Checked = false;
                //    }
                //}
                //else
                //{
                //    if (Request.Cookies["UserCook1"] != null)
                //    {
                //        ckremember.Checked = true;
                //        HttpCookie cook = Request.Cookies["UserCook1"];
                //        txtUsername.Text = cook["AdminUserName"].ToString();
                //        //txtpsw.Text = cook["pass"].ToString();
                //        txtPassword.Attributes.Add("value", cook["AdminPass"].ToString());
                //    }
                //}
            }
        }
        catch { }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string districtNo = ConfigurationManager.AppSettings["District"];
            DBconnection con = new DBconnection();
            DataTable objdt = new DataTable();
            con.SetCommandSP = "z_VoterLogin";
            con.AddParam("@email", txtLoginUsername.Text.Trim().ToString());
            con.AddParam("@password", txtLoginPassword.Text.Trim().ToString());
           // con.AddParam("@district_no", districtNo);
            
            objdt = con.ExecuteTable();
            if (objdt.Rows.Count > 0)
            {
                // LblInvalid.Visible = false;

                Session["user"] = txtLoginUsername.Text;
                Session["Voter"] = txtLoginUsername.Text;
                Session["AdminUserName"] = objdt.Rows[0]["first_name"].ToString() + " " + objdt.Rows[0]["last_name"].ToString();
                Session["VoterId"] = objdt.Rows[0]["id"].ToString();
               // Session["VotingEligibility"] = objdt.Rows[0]["voting_eligibility"].ToString();
              //  Session["EligibleVotes"] = objdt.Rows[0]["eligible_votes"].ToString();
                Session["ClubId"] = objdt.Rows[0]["club_id"].ToString();
                Session["ClubName"] = objdt.Rows[0]["club_name"].ToString();
                Session["DistrictNo"] = objdt.Rows[0]["district_no"].ToString();
                Session["EmailId"] = objdt.Rows[0]["email"].ToString();

                Response.Redirect("OnlineVoting.aspx");

            }
            else
            {
                //LblInvalid.Visible = true;
                string msg = "Invalid Username or Password";
                showmsg(msg);
            }
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtLoginUsername.Text = "";
        txtLoginPassword.Text = "";
        //LblInvalid.Visible = false;
    }
    public void showmsg(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
}