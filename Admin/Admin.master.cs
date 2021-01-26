using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblwelcome.Text = "Welcome : " + Session["AdminUserName"].ToString();

                if (Session["user"].ToString() == "admin")
                {
                    AdminUser.Visible = true;
                   // VotedClub.Visible = true;
                  //  NotVotedClub.Visible = true;
                }
                else
                {
                    AdminUser.Visible = false;
                   // VotedClub.Visible = false;
                   // NotVotedClub.Visible = false;
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
}
