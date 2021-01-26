using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBconnection
/// </summary>
public class DBconnection
{
    private string constring = "";
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataAdapter da;
    private DataSet ds;
    private DataTable dt;

    public DBconnection()
	{
        try
        {
            constring = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString.ToString();
            //constring = ConfigurationManager.ConnectionStrings[1].ConnectionString.ToString();
            con = new SqlConnection(constring);
            cmd = new SqlCommand();
            cmd.Connection = con;
            ds = new DataSet();
            dt = new DataTable();
        }
        catch 
        {
            throw;
        }
        
	}
    public DBconnection(string constr)
    {
        try
        {

            //constring = ConfigurationManager.ConnectionStrings[constr].ConnectionString.ToString();
            constring = ConfigurationManager.AppSettings[constr];
            con = new SqlConnection(constring);
            cmd = new SqlCommand();
            cmd.Connection = con;
            dt = new DataTable();
            ds = new DataSet();
        }
        catch
        {
            throw;
        }

    }

    public string SetConnString
    {
        set 
        { constring = value;
        this.con.ConnectionString = constring;
        }
        get { return this.con.ConnectionString; }
    }
    public void open()
    {
        try
        {
            this.cmd.Connection.Open();
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
            throw;
        }
    }
    
    public void close()
    {
        try
        {

            this.cmd.Connection.Close();
            this.con.Dispose();
            this.cmd.Parameters.Clear();
            this.cmd.Dispose();
        }
        catch
        {
            throw;
        }
    }
    public string SetCommandSP
    {
        set
        {
            try
            {
                this.cmd.CommandType = CommandType.StoredProcedure;
                this.cmd.CommandText = value;

            }
            catch
            {
                throw;
            }
        }
        get
        {
            return this.cmd.CommandText;

        }
    }

    public string SetCommandQry
    {
        set
        {
            try
            {
                this.cmd.CommandType = CommandType.Text;
                this.cmd.CommandText = value;
            }
            catch
            {
                throw;
            }
        }
        get { return this.cmd.CommandText; }

    }
    
    
    public void AddParam(string param_name, object param)
    {
        try
        {
            SqlParameter param1 = new SqlParameter(param_name, param);

            this.cmd.Parameters.Add(param1);
        }
        catch
        {
            throw;
        }

    }
    public void AddParam(string  param)
    {
        try
        {

            SqlParameter par = new SqlParameter();
            par.ParameterName = param;
            par.Direction = ParameterDirection.Output;
            par.SqlDbType = SqlDbType.Int;
            this.cmd.Parameters.Add(par);
        }
        catch { throw; }

    }
    public void AddParam(SqlParameter par)
    {
        try
        {
            
            this.cmd.Parameters.Add(par);
        }
        catch
        {
            throw;
        }

    }
    public object retunrParam(string paramname)
    { 
        object obj=null;

        try
        {
            if(this.cmd.Parameters.Count!=0)
            obj = this.cmd.Parameters[paramname].SqlValue;

        }
        catch
        {
            obj = null;
            throw;
        }

        return obj;
    }
    
    public SqlParameter GetParam(string paramname)
    {
        SqlParameter param= new SqlParameter();
        try
        {
            if (this.cmd.Parameters.Count != 0)
            param = this.cmd.Parameters[paramname];
            
        }
        catch 
        {
            throw;
        
        }
       return param;
    }
    public int ExecuteNonQuery()
    {
        int i = 0;
        try
        {
            this.con.Open();
            i = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
            throw;
        }
        finally
        {
            this.con.Close();
        }
        return i;
    }
    
    public object ExecuteScalar()
    {
        object Value = null;
        try
        {
           this.con.Open();
           Value = cmd.ExecuteScalar();                       
        }
        catch { throw; }
        finally
        {
            this.con.Close();
        }
        return Value;
    }    
   
    public DataTable ExecuteTable()
    {        
        try
        {
            this.con.Open();
            this.da = new SqlDataAdapter(null, con);
            this.da.SelectCommand = this.cmd;
            da.Fill(dt);
            
        }
        catch(Exception ex)
        {
            string ss = ex.Message;
            throw;
        }
        finally
        {

            this.con.Close();
        }
        return dt;        
    }   

  
    public SqlDataReader ExecuteReader()
    {
        try
        {
            this.con.Open();
            return this.cmd.ExecuteReader();
        }
        catch  { throw; }

    }
    public DataSet ExecuteDataSet()
    {
        DataSet ds = new DataSet();
        try
        {
            this.con.Open();
            da = new SqlDataAdapter(null, con);
            da.SelectCommand = this.cmd;
            da.Fill(ds);
           
        }
        catch  { throw; }
        finally 
        {
            this.con.Close();
        }
        return ds;
    }
}



