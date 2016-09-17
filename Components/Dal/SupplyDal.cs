using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;


namespace Components.Dal
{
	/// <summary>
	/// Summary description for SupplyDal.
	/// </summary>
	public class SupplyDal
	{

        private static readonly string TABLE_NAME = "Supplies" ;
        private static readonly string SP_GETBYID = "SuppliesGetById";
        private static readonly string SP_GETALL = "SuppliesGetAll";

        private static SupplyDal myInstance = null;

        public static SupplyDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new SupplyDal();
            }

            return myInstance;

        }

		private SupplyDal()
		{
		}

        public Supply GetById(short id) 
        {

            Supply supply = new Supply();

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
                        supply = ConstructObject(oneRow);
                        return supply;
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
                        Supply oneSupply = ConstructObject(row);
                        
                        all.Add(oneSupply);

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

        private Supply ConstructObject(DataRow oneRow) 
        {

            Supply oneSupply = new Supply();

            oneSupply.Id = (short)oneRow["id"];
            oneSupply.Name = oneRow["name"].ToString();
            oneSupply.UnitType = oneRow["unittype"].ToString();

            return oneSupply;

        }


	}
}
