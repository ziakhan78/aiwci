using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;

/// <summary>
/// Summary description for ClubsBll
/// </summary>
public class ClubsBll
{
	public ClubsBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    
  
    public int Id { set; get; }
    public int DistrictNo { set; get; }
    public int ClubNo { set; get; }
    public int ActiveMem { set; get; }
    public int HonoraryMem { set; get; }
    public int EligibleVotes { set; get; }
    public string VotingEligibility { set; get; }
    public string ClubName { set; get; }
    public string Ipaddress { set; get; }


    #endregion

    #region --- Add ---

    public int AddClub()
    {        
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddClub";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@club_no", this.ClubNo);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@active_members", this.ActiveMem);
        obj.AddParam("@honorary_members", this.HonoraryMem);
        obj.AddParam("@eligible_votes", this.EligibleVotes);
        obj.AddParam("@voting_eligibility", this.VotingEligibility);
        
        obj.AddParam("@ipaddress", this.Ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }


    #endregion

    #region --- Update ---

    public int UpdateClub()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateClub";
        obj.AddParam("@id", this.Id);
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@club_no", this.ClubNo);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@active_members", this.ActiveMem);
        obj.AddParam("@honorary_members", this.HonoraryMem);
        obj.AddParam("@eligible_votes", this.EligibleVotes);
        obj.AddParam("@voting_eligibility", this.VotingEligibility);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---


    public DataTable GetClubById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubById";
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetClubByDistNo()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubByDistNo";
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetClubList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetClubList";
      
        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    #region --- Delete ---

    public int DeleteClub()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteClub";
        obj.AddParam("@id", this.Id);
        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion


    public DataTable GetDistrictClub()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetDistClub";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@voting_eligibility", this.VotingEligibility);
        dt = obj.ExecuteTable();
        return dt;
    }

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}