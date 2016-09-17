using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for PortDal.
	/// </summary>
	public class PortDal
	{

        private static readonly string TABLE_NAME = "Ports" ;
        private static readonly string SP_GETBYID = "PortsGetById";
        private static readonly string SP_GETALL = "PortsGetAll";

        private static PortDal myInstance = null;

        public static PortDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new PortDal();
            }

            return myInstance;

        }


		private PortDal()
		{
		}

        public Port GetById(int id) 
        {

            Port port = new Port();

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
                        port = ConstructObject(oneRow);
                        return port;
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
                        Port onePort = ConstructObject(row);
                        
                        all.Add(onePort);

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
        
        private Port ConstructObject(DataRow oneRow) 
        {

            Port onePort = new Port();

            onePort.Id = (int)oneRow["id"];
            onePort.Name = oneRow["name"].ToString();
            onePort.Active = (byte)oneRow["active"];
            onePort.ZoneId = (int)oneRow["zoneid"];

            return onePort;

        }


	}
}
