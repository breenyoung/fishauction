using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for AreaDal.
	/// </summary>
	public class AreaDal
	{

        private static readonly string TABLE_NAME = "Areas" ;
        private static readonly string SP_GETBYID = "AreasGetById";
        private static readonly string SP_GETALL = "AreasGetAll";

        private static AreaDal myInstance = null;

        public static AreaDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AreaDal();
            }

            return myInstance;

        }

		private AreaDal()
		{
		}

        public Area GetById(int id) 
        {

            Area area = new Area();

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
                        area = ConstructObject(oneRow);
                        return area;
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
                        Area oneArea = ConstructObject(row);
                        
                        all.Add(oneArea);

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

        private Area ConstructObject(DataRow oneRow) 
        {

            Area oneArea = new Area();

            oneArea.Id = short.Parse(oneRow["id"].ToString());
            oneArea.Name = oneRow["name"].ToString();
            oneArea.Abbr = oneRow["abbr"].ToString();

            return oneArea;

        }


	}
}
