using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for VoteBll
/// </summary>
public class VoteBll
{
    public VoteBll()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region --- Declared Variables ---    

    public int Id { set; get; }
    public int ElectionId { set; get; }
    public string Years { set; get; }
    public int DistrictNo { set; get; }
    public int VoterId { set; get; }
    public int CandidateId { set; get; }
    public int VotePrefrence { set; get; }
    public int Preference { set; get; }    
    public int TotalVote { set; get; }
    public int VotingEligibility { set; get; }
    public string Status { set; get; }
    public string Ipaddress { set; get; }


    #endregion

    #region --- Add ---

    public int SubmitVote()
    {         
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_SubmitVote";
        obj.AddParam("@voter_id", this.VoterId);
        obj.AddParam("@candidate_id", this.CandidateId);
      //  obj.AddParam("@preference", this.Preference);
       // obj.AddParam("@vote_prefrence", this.VotePrefrence);
       // obj.AddParam("@voting_eligibility", this.VotingEligibility);
       // obj.AddParam("@total_vote", this.TotalVote);
        obj.AddParam("@ipaddress", this.Ipaddress);
       // obj.AddParam("@status", this.Status);


        i = obj.ExecuteNonQuery();
        return i;
    }


    #endregion
   
    public DataTable GetPollVote()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetCandidates";
        obj.AddParam("@id", this.Id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVoteResultByPref1()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByPrefrence1";

      //  obj.AddParam("@years", this.Years);
        obj.AddParam("@election_id", this.ElectionId);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVoteResultByPref2()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByPrefrence2";
        obj.AddParam("@years", this.Years);
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVoteResultByPref3()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByPrefrence3";
        obj.AddParam("@years", this.Years);
        obj.AddParam("@district_no", this.DistrictNo);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVoteResultByPrefReport()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByPrefrenceReport";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }


    public DataTable GetVotedClubs()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotedClubs";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@election_id", this.ElectionId);
        // obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetNotVotedClubs()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetNotVotedClubs";
        obj.AddParam("@district_no", this.DistrictNo);
        //obj.AddParam("@desi_type", this.DesiType);
        obj.AddParam("@election_id", this.ElectionId);
        // obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }


    //public DataTable GetVotedClubs()
    //{
    //    DBconnection obj = new DBconnection();
    //    DataTable dt = new DataTable();
    //    obj.SetCommandSP = "z_GetVotedClubs";
    //    obj.AddParam("@district_no", this.DistrictNo);
    //   // obj.AddParam("@years", this.Years);
    //    dt = obj.ExecuteTable();
    //    return dt;
    //}

    //public DataTable GetNotVotedClubs()
    //{
    //    DBconnection obj = new DBconnection();
    //    DataTable dt = new DataTable();
    //    obj.SetCommandSP = "z_GetNotVotedClubs";
    //    obj.AddParam("@district_no", this.DistrictNo);
    //   // obj.AddParam("@years", this.Years);
    //    dt = obj.ExecuteTable();
    //    return dt;
    //}

    public DataTable GetVoteResultByClubwise()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByClubWise";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVotingResultDistrictWise()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByDistrictWise";
        obj.AddParam("@election_id", this.ElectionId);
        obj.AddParam("@district_no", this.DistrictNo);
       
        dt = obj.ExecuteTable();
        return dt;
    }

    

    public DataTable GetVoteResultByNonePref2()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByNonePref2";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetVoteResultByNonePref3()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetVotingResultByNonePref3";
        obj.AddParam("@district_no", this.DistrictNo);
        obj.AddParam("@years", this.Years);
        dt = obj.ExecuteTable();
        return dt;
    }



   

}