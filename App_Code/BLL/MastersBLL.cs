using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;

/// <summary>
/// Summary description for MastersBLL
/// </summary>
public class MastersBLL
{
	public MastersBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---

    private decimal dollorRate;
    private string material = "";

    private int id, districtNo = 0; 
    public int Id { set { id = value; } get { return id; } }
    public int DistrictNo { set { districtNo = value; } get { return districtNo; } }

    public decimal DollorRate { set { dollorRate = value; } get { return dollorRate; } }

    #endregion

    #region --- Add ---
       
    public int AddDistrictNo()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddDistrictNo";
        obj.AddParam("@district_no", this.districtNo);
        i = obj.ExecuteNonQuery();
        return i;
    }


    public int AddDollorRate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddDollorRate";
        obj.AddParam("@dollor_rate", this.dollorRate);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Update ---

    public int UpdateColors()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateDistrictNo";
        obj.AddParam("@id", this.id);
        obj.AddParam("@district_no", this.districtNo);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateDollorRate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateDollorRate";
        obj.AddParam("@id", this.id);
        obj.AddParam("@dollor_rate", this.dollorRate);

        i = obj.ExecuteNonQuery();
        return i;
    }   
      

    #endregion

    #region --- Get ---


    public DataTable GetDistrictNo()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDistrictNo";
        obj.AddParam("@id", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetDistrictNoList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDistrictNoList";       
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetElectionNameList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetElectionNameList";
        dt = obj.ExecuteTable();
        return dt;
    }



    #endregion

    #region --- Delete ---

    public int DeleteDistrictNo()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteDistrictNo";
        obj.AddParam("@id", this.id);
        i = obj.ExecuteNonQuery();
        return i;
    }    
  
    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}