using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for ProvinceDal.
	/// </summary>
	public class ProvinceDal
	{

        private static readonly string TABLE_NAME = "Provinces" ;
        private static readonly string SP_GETBYID = "ProvincesGetById";
        private static readonly string SP_GETALL = "ProvincesGetAll";

        private static ProvinceDal myInstance = null;

        public static ProvinceDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new ProvinceDal();
            }

            return myInstance;

        }

        private ProvinceDal()
        {
        }

        public Province GetById(short id) 
        {

            Province province = new Province();

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
                        province = ConstructObject(oneRow);
                        return province;
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
                        Province oneProv = ConstructObject(row);
                        
                        all.Add(oneProv);

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

        private Province ConstructObject(DataRow oneRow) 
        {

            Province oneProv = new Province();

            oneProv.Id = (short)oneRow["id"];
            oneProv.Name = oneRow["name"].ToString();

            return oneProv;

        }

	}
}
