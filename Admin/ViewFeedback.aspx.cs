using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewFeedback : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
               // lblHeading.Text = "View District No.";

            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    } 
  
}