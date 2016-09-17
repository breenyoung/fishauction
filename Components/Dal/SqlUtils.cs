using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using Microsoft.ApplicationBlocks.Data;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for SqlUtils.
	/// </summary>
	public class SqlUtils
	{

        private static SqlUtils myInstance = null;

		private SqlUtils()
		{
			//
			// TODO: Add constructor logic here
			//
		}

        public static SqlUtils GetInstance() 
        {
            if( myInstance == null ) 
            {
                myInstance = new SqlUtils();
            }
            return myInstance;
        }

        public SqlConnection GetConnection() 
        {
            return DalUtils.GetInstance().getConnection();
        }

        public static void CloseConnection(SqlConnection conn) 
        {
            DalUtils.closeConnection(conn);
        }

        public static void Commit(SqlTransaction myTrans) 
        {
            if( myTrans != null ) 
            {
                myTrans.Commit();
            }
        }
        public static void Rollback(SqlTransaction myTrans) 
        {
            if(myTrans == null) 
            {
                return;
            }

            try
            {
                myTrans.Rollback();
            }
            catch (SqlException ex)
            {
                if (myTrans != null && myTrans.Connection != null)
                {
                    Console.WriteLine("An exception of type " + ex.GetType() +
                        " was encountered while attempting to roll back the transaction.");
                }
            }
        }

        public ICollection Execute(SqlConnection conn, EntityAdapter adapter) 
        {
            return Execute(conn, null, adapter);
        }

        public ICollection Execute(SqlTransaction myTrans, EntityAdapter adapter) 
        {
            return Execute(null, myTrans, adapter);
        }

        private ICollection Execute(SqlConnection conn, SqlTransaction myTrans, EntityAdapter adapter) 
        {

            if( adapter.GetQueryType().Equals(QueryTypeEnum.RETURN)) 
            {
                if( myTrans == null ) 
                {
                    return ExecuteReturn(conn, adapter);
                }
                else 
                {
                    return ExecuteReturn(myTrans, adapter);
                }
            }
            else if( adapter.GetQueryType().Equals(QueryTypeEnum.NONQUERY))
            {
                if( myTrans == null ) 
                {
                    ExecuteNonQuery(conn, adapter);
                }
                else 
                {
                    ExecuteNonQuery(myTrans, adapter);
                }
                return null;
            }
            else 
            {
                throw new Exception("QueryType unrecognised.");
            }
        }

        private ICollection ExecuteReturn(SqlConnection conn, EntityAdapter adapter) 
        {


            SqlDataReader dataReader = null;
            ICollection results = new ArrayList();
            try 
            {
                dataReader = SqlHelper.ExecuteReader(conn, adapter.GetStoredProc(), adapter.GetParams());
                return adapter.GetResults(dataReader);
            }
            finally 
            {
                DalUtils.closeReader(dataReader);
            }

        }

        private ICollection ExecuteReturn(SqlTransaction myTrans, EntityAdapter adapter) 
        {


            SqlDataReader dataReader = null;
            ICollection results = new ArrayList();
            try 
            {
                dataReader = SqlHelper.ExecuteReader(myTrans, adapter.GetStoredProc(), adapter.GetParams());
                return adapter.GetResults(dataReader);
            }
            finally 
            {
                DalUtils.closeReader(dataReader);
            }

        }

        private void ExecuteNonQuery(SqlConnection conn, EntityAdapter adapter) 
        {
            SqlHelper.ExecuteNonQuery(conn, adapter.GetStoredProc(), adapter.GetParams());
        }

        private void ExecuteNonQuery(SqlTransaction myTrans, EntityAdapter adapter) 
        {
            SqlHelper.ExecuteNonQuery(myTrans, adapter.GetStoredProc(), adapter.GetParams());
        }


	}
}
