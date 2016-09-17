using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for SpeciesDal.
	/// </summary>
	public class SpeciesDal
	{

        private static readonly string TABLE_NAME = "Species" ;
        private static readonly string SP_GETBYID = "SpeciesGetById";
        private static readonly string SP_GETALL = "SpeciesGetAll";

        private static SpeciesDal myInstance = null;

        public static SpeciesDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new SpeciesDal();
            }

            return myInstance;

        }

		private SpeciesDal()
		{
		}

        public Species GetById(int id) 
        {

            Species species = new Species();

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
                        species = ConstructObject(oneRow);
                        return species;
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
                        Species oneSpecies = ConstructObject(row);
                        
                        all.Add(oneSpecies);

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
        
        private Species ConstructObject(DataRow oneRow) 
        {

            Species oneSpecies = new Species();

            oneSpecies.Id = (int)oneRow["id"];
            oneSpecies.Name = oneRow["name"].ToString();

            return oneSpecies;

        }
	}
}
