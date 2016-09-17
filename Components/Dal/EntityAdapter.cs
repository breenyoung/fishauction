using System;
using System.Data.SqlClient;
using System.Collections;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for EntityAdapter.
	/// </summary>
    public interface EntityAdapter
    {
        ICollection GetResults(SqlDataReader dataReader); 
        string GetStoredProc();
        SqlParameter[] GetParams();
        QueryTypeEnum GetQueryType();
    }
}
