using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Candidate : System.Web.UI.Page
{  

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string[] arrElecId = ConfigurationManager.AppSettings["ElectionId"].ToString().Split(',');
            int electionId = int.Parse(arrElecId[0]);
            // for single election 
            // BindCandidates(electionId);

            // for two post
            string nextElectionId = arrElecId[1];
            BindCandidates(electionId, nextElectionId);
            BindSecondPostOnBtn(int.Parse(nextElectionId));

        }
    }

    //private void BindCandidates(int electionId) // for single post
    private void BindCandidates(int electionId, string nextElectionId) // for two post
    {
        CandidatesBll obj = new CandidatesBll();
        DataTable dt = new DataTable();
        obj.ElectionId = electionId;
        dt = obj.GetCandidateByElection();
        if (dt.Rows.Count > 0)
        {
            btnElection.Attributes.Add("ElectionId", nextElectionId + "," + electionId);

            lblElecTitle.Text = "Inner Wheel " + dt.Rows[0]["elec_district"].ToString() + " Election - " + dt.Rows[0]["election_name"].ToString() + " " + dt.Rows[0]["elec_year"].ToString();
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
    //private void BindCandidates()
    //{
    //    CandidatesBll obj = new CandidatesBll();
    //    DataTable dt = new DataTable();
    //    obj.ElectionId = electionId;      
    //    dt = obj.GetCandidateByElection();
    //    if (dt.Rows.Count > 0)
    //    {
    //        // cadBio.Visible = true;
    //        //int id = int.Parse(dt.Rows[0]["id"].ToString());
    //        // GetCandidate(id);
    //        lblElecTitle.Text = "Inner Wheel District " + dt.Rows[0]["elec_district"].ToString() + " Election - " + dt.Rows[0]["election_name"].ToString() + " " + dt.Rows[0]["elec_year"].ToString();
    //        Repeater1.DataSource = dt;
    //        Repeater1.DataBind();
    //    }
    //    else
    //    {
    //       // cadBio.Visible = false;
    //    }
    //}

    protected void btnElection_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        string[] arrElecId = btn.Attributes["ElectionId"].ToString().Split(',');
        // for single election
        //BindCandidates(int.Parse(arrElecId[0]));
        // for two elections
        btnElection.Attributes.Add("ElectionId", arrElecId[1] + "," + arrElecId[0]);
        BindCandidates(int.Parse(arrElecId[0]), arrElecId[1]);
        BindSecondPostOnBtn(int.Parse(arrElecId[1]));
    }

    private void BindSecondPostOnBtn(int electionId)
    {
        CandidatesBll obj = new CandidatesBll();
        DataTable dt = new DataTable();
        obj.ElectionId = electionId;
        dt = obj.GetCandidateByElection();
        if (dt.Rows.Count > 0)
        {
            btnElection.Text = "Candidates for " + dt.Rows[0]["election_name"].ToString();
        }
    }
}
