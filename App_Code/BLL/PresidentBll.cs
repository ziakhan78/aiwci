using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for PresidentBll
/// </summary>
public class PresidentBll
{
	public PresidentBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    
  
    public int Id { set; get; }
    public string DistrictNo { set; get; }
    public string ClubName { set; get; }
    public string FirstName { set; get; }
    public string LastName { set; get; }   
    public string Email { set; get; }
    public string Mobile { set; get; }
    public string Password { set; get; }
    public string Ipaddress { set; get; }

    public string DesiType { set; get; }

    #endregion

    #region --- Add ---

    public int AddPresident()
    {             
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddPresident";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@first_name", this.FirstName);
        obj.AddParam("@last_name", this.LastName);        
        obj.AddParam("@email", this.Email);
        obj.AddParam("@mobile", this.Mobile);
        obj.AddParam("@password", this.Password);
        obj.AddParam("@ipaddress", this.Ipaddress);
        obj.AddParam("@desig_type", this.DesiType);

        i = obj.ExecuteNonQuery();
        return i;
    }



    #endregion

    #region --- Update ---

    public int UpdatePresident()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdatePresident";
        obj.AddParam("@id", this.Id);
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@first_name", this.FirstName);
        obj.AddParam("@last_name", this.LastName);
        obj.AddParam("@email", this.Email);
        obj.AddParam("@mobile", this.Mobile);
        //obj.AddParam("@desi_type", this.DesiType);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---


    public DataTable GetPresidentById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetPresident";
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetPresidentByDistNo()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetPresidentsByDistNo";
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetExecutiveCommittee()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDistCommitteeByDistNo";
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetPresidentReport()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetPresidentsReport";
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAllPresidentReport()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllPresidentsReport";
       
        dt = obj.ExecuteTable();
        return dt;
    }



    public DataTable GetPresidentList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_PresidentList";
      
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetDesiForSendMail()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDesiForSendMail";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@desig_type", this.DesiType);
        dt = obj.ExecuteTable();
        return dt;
    }
    #endregion

    #region --- Delete ---

    public int DeletePresident()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeletePresident";
        obj.AddParam("@id", this.Id);
        i = obj.ExecuteNonQuery();
        return i;
    }    
  
    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}