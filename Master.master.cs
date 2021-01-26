using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //HtmlGenericControl listitem = (HtmlGenericControl)Master.FindControl("HowToVote");
        //listitem.Attributes.Add("nav-item", "active");

        string pageName = Page.ToString().Replace("ASP.", "").Replace("_", ".");

        if (pageName == "default.aspx")
        {
            home.Attributes.Add("class", "nav-item active");
        }

        if (pageName == "howtovote.aspx")
        {
            HowToVote.Attributes.Add("class", "nav-item active");
        }

        if (pageName == "candidate.aspx")
        {
            candidate.Attributes.Add("class", "nav-item active");
        }

        if (pageName == "onlinevoting.aspx")
        {
            onlinevoting.Attributes.Add("class", "nav-item active");
        }

        if (pageName == "faqs.aspx")
        {
            faqs.Attributes.Add("class", "nav-item active");
        }

        if (pageName == "contact.aspx")
        {
            contact.Attributes.Add("class", "nav-item active");
        }

        ////if (Page.TemplateControl.AppRelativeVirtualPath == "~/Contact.aspx")
        ////{
        ////    // your code here
        ////}
        ///

        if (!IsPostBack)
        {
            btnLogout.Visible = false;
            btnLogin.Visible = true;
            if (Session["Voter"] != null)
            {
                lblUser.Text = "Welcome: " + Session["AdminUserName"].ToString();
                btnLogout.Visible = true;
                btnLogin.Visible = false;
            }
            else
            {
                btnLogout.Visible = false;
                btnLogin.Visible = true;
            }
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

}
