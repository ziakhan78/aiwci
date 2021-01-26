using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for CandidatesBll
/// </summary>
public class CandidatesBll
{
	public CandidatesBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    
  
    public int Id { set; get; }
    public string CandidatesId { set; get; }

    public int ElectionId { set; get; }
    public string ElectionName { set; get; }
    public int DistrictNo { set; get; }
    public string Years { set; get; }
    public string ClubName { set; get; }
    public string Name { set; get; }
    public string JoiningDate { set; get; }
    public string Classification { set; get; }
    public int MembershipNo { set; get; }
    public string Email { set; get; } 
    public string Mobile { set; get; }
    public SqlDateTime Birthday { set; get; }
    public string Description { set; get; }
    public string Photo { set; get; }
    public string BioData { set; get; }
    public string Ipaddress { set; get; }


    #endregion

    #region --- Add ---

    public int AddCandidate()
    {             
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddCandidates";
        obj.AddParam("@election_id", this.ElectionId);
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@name", this.Name);
        obj.AddParam("@joining_date", this.JoiningDate);
        obj.AddParam("@classification", this.Classification);
        obj.AddParam("@membership_no", this.MembershipNo);
        obj.AddParam("@email", this.Email);
        obj.AddParam("@mobile", this.Mobile);
        obj.AddParam("@birthday", this.Birthday);
        obj.AddParam("@description", this.Description);
        obj.AddParam("@photo", this.Photo);
        obj.AddParam("@biodata", this.BioData);
        obj.AddParam("@ipaddress", this.Ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }


    #endregion

    #region --- Update ---

    public int UpdateCandidate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateCandidates";
        obj.AddParam("@id", this.Id);
        obj.AddParam("@election_id", this.ElectionId);
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@name", this.Name);
        obj.AddParam("@joining_date", this.JoiningDate);
        obj.AddParam("@classification", this.Classification);
        obj.AddParam("@membership_no", this.MembershipNo);
        obj.AddParam("@email", this.Email);
        obj.AddParam("@mobile", this.Mobile);
        obj.AddParam("@birthday", this.Birthday);
        obj.AddParam("@description", this.Description);
        obj.AddParam("@photo", this.Photo);
        obj.AddParam("@biodata", this.BioData);

        i = obj.ExecuteNonQuery();
        return i;
    }

    #endregion

    #region --- Get ---


    public DataTable GetCandidateById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidates";
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetCandidateByElection()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidatesByElection";
        obj.AddParam("@election_id", this.ElectionId);
       
        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetCandidateByDistNo()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidatesByDistNo";
        obj.AddParam("@years", this.Years);
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetCandidateList()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_CandidatesList";
      
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetCandidatesByElectionName()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidatesByElectionName";
        obj.AddParam("@election_name", this.ElectionName);

        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetCandidateInPref()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidatesInPref";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetCandidateInPref2()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidatesInPref2";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@candidate_id", this.CandidatesId);
        dt = obj.ExecuteTable();
        return dt;
    }

    #endregion

    #region --- Delete ---

    public int DeleteCandidate()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_DeleteCandidates";
        obj.AddParam("@id", this.Id);
        i = obj.ExecuteNonQuery();
        return i;
    }    
  
    #endregion

    public string ToTitleCase(string str) { return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower()); }

}