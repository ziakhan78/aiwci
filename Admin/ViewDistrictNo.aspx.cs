using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewDistrictNo : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
               lblHeading.Text = "District No. List";

            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    } 
  
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            MastersBLL obj = new MastersBLL();
            obj.Id = id;
           
            if (obj.DeleteDistrictNo() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
}