using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;

/// <summary>
/// Summary description for ElectionDateBll
/// </summary>
public class ElectionDateBll
{
	public ElectionDateBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    
  
    public int Id { set; get; }
    public string ElectionName { set; get; }

    public int ElectionId { set; get; }
    public int DistrictNo { set; get; }
    public string Years { set; get; }
    public DateTime StartDate { set; get; }
    public DateTime EndDate { set; get; }
    public string IpAddress { set; get; }


    #endregion

    #region --- Add ---

    public int AddElectionDate()
    {        
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddElectionDate";
        obj.AddParam("@election_name", this.ElectionName);
        obj.AddParam("@years", this.Years);
        obj.AddParam("@start_date", this.StartDate);
        obj.AddParam("@end_date", this.EndDate);
        obj.AddParam("@ipaddress", this.IpAddress);


        i = obj.ExecuteNonQuery();
        return i;
    }


    #endregion

    #region --- Update ---

    public int UpdateElectionDate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateElectionDate";
        obj.AddParam("@id", this.Id);
        obj.AddParam("@election_name", this.ElectionName);
        obj.AddParam("@years", this.Years);
        obj.AddParam("@start_date", this.StartDate);
        obj.AddParam("@end_date", this.EndDate);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---


    public DataTable GetElectionDateById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetElectionDate";
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

  

    #endregion

    #region --- Delete ---

    public int DeleteElectionDate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteElectionDate";
        obj.AddParam("@id", this.Id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    public DataTable CheckElectionDateValidity()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_CheckElectionDateValidity";
        obj.AddParam("@election_id", this.ElectionId);
       
        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}