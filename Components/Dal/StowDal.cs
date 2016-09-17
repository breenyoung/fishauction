using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for StowDal.
	/// </summary>
	public class StowDal
	{

        private static readonly string TABLE_NAME = "Stowage" ;
        private static readonly string SP_GETBYID = "StowageGetById";
        private static readonly string SP_GETALL = "StowageGetAll";

        private static StowDal myInstance = null;

        public static StowDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new StowDal();
            }

            return myInstance;

        }

		private StowDal()
		{
		}

        public Stow GetById(int id) 
        {

            Stow stow = new Stow();

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID", id);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYID,theParams);

                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        stow = ConstructObject(oneRow);
                        return stow;
                    } 

                }
                return null;

            }
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }

        }
    
        public ArrayList GetAll() 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETALL);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Stow oneStow = ConstructObject(row);
                        
                        all.Add(oneStow);

                    }

                }

                return all;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }

        }


        private Stow ConstructObject(DataRow oneRow) 
        {

            Stow oneStow = new Stow();

            oneStow.Id = (int)oneRow["id"];
            oneStow.Name = oneRow["name"].ToString();

            return oneStow;

        }

	}
}
