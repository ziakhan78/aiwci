using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Admin_ViewElectionDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                //if (Session["user"].ToString() == "admin")
                //    electionDate.Visible = true;
                //else
                //    electionDate.Visible = false;

                lblHeading.Text = "View Elections";
                CheckPermission();

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
            ElectionDateBll obj = new ElectionDateBll();
            obj.Id = id;

            if (obj.DeleteElectionDate() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    public void CheckPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [admin_users_tbl]";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        Label lblStatus = (Label) e.Item.FindControl("lblStatus");
        if (lblStatus != null)
        {
            int value = int.Parse(lblStatus.Text.ToString());
            if (value <= 0)
                lblStatus.Text = "Expired";
            else
                lblStatus.Text = "Continue";

        }
    }
}