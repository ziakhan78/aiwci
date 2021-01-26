using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;


public partial class Admin_AdminUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblHeading.Text = "Add Admin Users";
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetUser(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetUser(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetUser";
            obj.AddParam("@UID", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtConfirmPassword.TextMode = TextBoxMode.SingleLine;
                txtUsername.Text = dt.Rows[0]["UserName"].ToString();
                txtPassword.Text = dt.Rows[0]["Password"].ToString();
                txtConfirmPassword.Text = dt.Rows[0]["Password"].ToString();
                txtFirstName.Text = dt.Rows[0]["FName"].ToString();
                txtLastName.Text = dt.Rows[0]["LName"].ToString();
                txtDesignation.Text = dt.Rows[0]["Designation"].ToString();

                string uAdd = dt.Rows[0]["UAdd"].ToString();
                if (uAdd == "True")
                {
                    UAddCheckBox.Checked = true;
                }
                string uEdit = dt.Rows[0]["UEdit"].ToString();

                if (uEdit == "True")
                {
                    UEditCheckBox.Checked = true;
                }
                string uDelete = dt.Rows[0]["UDelete"].ToString();

                if (uDelete == "True")
                {
                    UDeleteCheckBox.Checked = true;
                }

                string uView = dt.Rows[0]["UView"].ToString();

                if (uView == "True")
                {
                    UViewCheckBox.Checked = true;
                }

                txtEmail.Text = dt.Rows[0]["Email"].ToString();
               // txtMobCC.Text = dt.Rows[0]["MobileCC"].ToString();
                txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
               // txtPhCC.Text = dt.Rows[0]["Phone_CC"].ToString();
               // txtPhAC.Text = dt.Rows[0]["Phone_AC"].ToString();
               // txtPhone.Text = dt.Rows[0]["Phone"].ToString();

               // txtCity.Text = dt.Rows[0]["City"].ToString();
              //  txtState.Text = dt.Rows[0]["State"].ToString();
               // txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
              //  txtAddress2.Text = dt.Rows[0]["Address2"].ToString();

            }
        }
        catch { }
    }

    private void AddUser()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddUser";
        obj.AddParam("@UserName", txtUsername.Text.Trim());
        obj.AddParam("@Password", txtPassword.Text.Trim());
        obj.AddParam("@FName", txtFirstName.Text.Trim());
        obj.AddParam("@LName", txtLastName.Text.Trim());
        obj.AddParam("@Designation", txtDesignation.Text.Trim());
        if (UAddCheckBox.Checked)
        {
            obj.AddParam("@UAdd", 1);
        }
        else
        {
            obj.AddParam("@UAdd", 0);
        }

        if (UEditCheckBox.Checked)
        {
            obj.AddParam("@UEdit", 1);
        }
        else
        {
            obj.AddParam("@UEdit", 0);
        }

        if (UDeleteCheckBox.Checked)
        {
            obj.AddParam("@UDelete", 1);
        }
        else
        {
            obj.AddParam("@UDelete", 0);
        }

        if (UViewCheckBox.Checked)
        {
            obj.AddParam("@UView", 1);
        }
        else
        {
            obj.AddParam("@UView", 0);
        }



        obj.AddParam("@Email", txtEmail.Text.Trim());
       // obj.AddParam("@MobileCC", txtMobCC.Text.Trim());
        obj.AddParam("@Mobile", txtMobile.Text.Trim());
       // obj.AddParam("@Phone_CC", txtPhCC.Text.Trim());
      //  obj.AddParam("@Phone_AC", txtPhAC.Text.Trim());
      //  obj.AddParam("@Phone", txtPhone.Text.Trim());

      //  obj.AddParam("@City", txtCity.Text.Trim());
      //  obj.AddParam("@State", txtState.Text.Trim());
      //  obj.AddParam("@Address1", txtAddress1.Text.Trim());
      //  obj.AddParam("@Address2", txtAddress2.Text.Trim());


        if (obj.ExecuteNonQuery() > 0)
        {
            Clear();
            string jv = "<script>alert('User Has Been Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }
    private void UpdateUser(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateUser";
        obj.AddParam("@UID", id);
        obj.AddParam("@UserName", txtUsername.Text.Trim());
        obj.AddParam("@Password", txtPassword.Text.Trim());
        obj.AddParam("@FName", txtFirstName.Text.Trim());
        obj.AddParam("@LName", txtLastName.Text.Trim());
        obj.AddParam("@Designation", txtDesignation.Text.Trim());
        if (UAddCheckBox.Checked)
        {
            obj.AddParam("@UAdd", 1);
        }
        else
        {
            obj.AddParam("@UAdd", 0);
        }

        if (UEditCheckBox.Checked)
        {
            obj.AddParam("@UEdit", 1);
        }
        else
        {
            obj.AddParam("@UEdit", 0);
        }

        if (UDeleteCheckBox.Checked)
        {
            obj.AddParam("@UDelete", 1);
        }
        else
        {
            obj.AddParam("@UDelete", 0);
        }

        if (UViewCheckBox.Checked)
        {
            obj.AddParam("@UView", 1);
        }
        else
        {
            obj.AddParam("@UView", 0);
        }



        obj.AddParam("@Email", txtEmail.Text.Trim());
       // obj.AddParam("@MobileCC", txtMobCC.Text.Trim());
        obj.AddParam("@Mobile", txtMobile.Text.Trim());
       // obj.AddParam("@Phone_CC", txtPhCC.Text.Trim());
       // obj.AddParam("@Phone_AC", txtPhAC.Text.Trim());
      //  obj.AddParam("@Phone", txtPhone.Text.Trim());

      //  obj.AddParam("@City", txtCity.Text.Trim());
     //   obj.AddParam("@State", txtState.Text.Trim());
      //  obj.AddParam("@Address1", txtAddress1.Text.Trim());
      //  obj.AddParam("@Address2", txtAddress2.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            //string jv = "<script>alert('User Updated Successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            showmsg("User Has Been Updated Successfully", "ViewAdminUsers.aspx");
        }
    }
    protected void cvuname_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if (Request.QueryString["id"] != null)
        {
            cvUsername.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select UserName from admin_users_tbl where UserName='" + txtUsername.Text.Trim().ToString() + "'";
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
    protected void cvemail_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if (Request.QueryString["id"] != null)
        {
            cvemail.Enabled = false;
        }
        else
        {

            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select Email from admin_users_tbl where Email='" + txtEmail.Text.Trim().ToString() + "'";
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
    protected void Submit(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdateUser(id);
                }
                else
                {
                    AddUser();
                }
            }

            catch (Exception ex)
            {

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
    protected void txtLastName_TextChanged(object sender, EventArgs e)
    {
        txtUsername.Text = txtFirstName.Text.Trim().ToLower().ToString() + "_" + txtLastName.Text.Trim().ToLower().ToString();
    }

    private void Clear()
    {
        //txtAddress1.Text = "";
       // txtAddress2.Text = "";
       // txtCity.Text = "";
        txtConfirmPassword.Text = "";
        txtDesignation.Text = "";
        txtEmail.Text = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
       // txtMobCC.Text = "";
        txtMobile.Text = "";
        txtPassword.Text = "";
      //  txtPhAC.Text = "";
      //  txtPhCC.Text = "";
      //  txtPhone.Text = "";
      //  txtState.Text = "";
        txtUsername.Text = "";
        UViewCheckBox.Checked = false;
        UEditCheckBox.Checked = false;
        UDeleteCheckBox.Checked = false;
        UAddCheckBox.Checked = false;
    }
   
}