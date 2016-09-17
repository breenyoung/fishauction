using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for ProcessorDal.
	/// </summary>
	public class ProcessorDal
	{

        private static readonly string TABLE_NAME = "Processors" ;
        private static readonly string SP_GETBYID = "ProcessorsGetById";
        private static readonly string SP_GETALL = "ProcessorsGetAll";

        private static ProcessorDal myInstance = null;

        public static ProcessorDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new ProcessorDal();
            }

            return myInstance;

        }

        private ProcessorDal()
        {
        }

        public Processor GetById(int id) 
        {

            Processor processor = new Processor();

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
                        processor = ConstructObject(oneRow);
                        return processor;
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
                        Processor oneProcessor = ConstructObject(row);
                        
                        all.Add(oneProcessor);

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

        private Processor ConstructObject(DataRow oneRow) 
        {

            Processor oneProcessor = new Processor();

            oneProcessor.Id = (int)oneRow["id"];
            oneProcessor.Name = oneRow["name"].ToString();
            oneProcessor.Location = oneRow["location"].ToString();
            oneProcessor.ZoneId = (int)oneRow["zoneid"];
            oneProcessor.AccountBalance = (decimal)oneRow["accountbalance"];
            oneProcessor.IsTrading = (bool)oneRow["istrading"];
            oneProcessor.Demand = (decimal)oneRow["demand"];
            oneProcessor.MinBalance = (decimal)oneRow["minbalance"];
            oneProcessor.Phone = oneRow["phone"].ToString();

            return oneProcessor;

        }


	}
}
