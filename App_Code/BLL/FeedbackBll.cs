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
public class FeedbackBll
{
	public FeedbackBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region --- Declared Variables ---    
  
    public int Id { set; get; }
    public string Name { set; get; }  
    public string ClubName { set; get; }
    public string Mobile { set; get; }
    public string EmailId { set; get; }
    public string Comments { set; get; }
    public string Ipaddress { set; get; }


    #endregion

    #region --- Add ---

    public int AddFeedback()
    {             
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddFeedback";       
        obj.AddParam("@name", this.Name);
        obj.AddParam("@emailid", this.EmailId);
        obj.AddParam("@club_name", this.ClubName);
        obj.AddParam("@mobile", this.Mobile); 
        obj.AddParam("@comments", this.Comments);
        obj.AddParam("@ipaddress", this.Ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }


    #endregion
   
    #region --- Get ---


    public DataTable GetFeedback()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetFeedback";       
        dt = obj.ExecuteTable();
        return dt;
    } 

    #endregion
    
}