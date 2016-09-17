using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
//using ByteFX.Data.MySqlClient;
using Components.Utils.Configuration;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for DalUtils.
	/// </summary>
	public class DalUtils
	{

        private static readonly DalUtils DB_INSTANCE;
        private static readonly string CONNECTION_STRING ;

        static DalUtils()
        {
            DB_INSTANCE = new DalUtils();
            CONNECTION_STRING 
                = ConfigurationManager.getInstance().AppConfig.DbConnectionString;        }

        public static DalUtils GetInstance() 
        {
            return DB_INSTANCE;
        }


		private DalUtils()
		{
		}

        public SqlConnection getConnection() 
        //public MySqlConnection getConnection() 
        { 
            return new SqlConnection(CONNECTION_STRING);
            //return new MySqlConnection(CONNECTION_STRING);
        }

        public string getConnectionString() 
        {
            return CONNECTION_STRING;
        }

        public static void closeReader( SqlDataReader reader ) 
        {
            try 
            {
                if( reader != null ) 
                {
                    reader.Close();
                }
            }
            catch( Exception e ) 
            {
                Trace.WriteLine("Error closing reader: " + e );
            }
        }

        public static void closeConnection( SqlConnection conn ) 
        {
            try 
            {
                if( conn != null ) 
                {
                    conn.Close();
                }
            }
            catch( Exception e ) 
            {
                Trace.WriteLine("Error closing connection: " + e );
            }
        }

	}
}
