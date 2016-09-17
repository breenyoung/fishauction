using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using Components.Entities;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for GradeDal.
	/// </summary>
	public class GradeDal
	{

        private static readonly string TABLE_NAME = "Grades" ;
        private static readonly string SP_GETBYID = "GradesGetById";
        private static readonly string SP_GETALL = "GradesGetAll";

        private static GradeDal myInstance = null;

        public static GradeDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new GradeDal();
            }

            return myInstance;

        }

		private GradeDal()
		{
		}

        public Grade GetById(int id) 
        {

            Grade grade = new Grade();

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
                        grade = ConstructObject(oneRow);
                        return grade;
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
                        Grade oneGrade = ConstructObject(row);
                        
                        all.Add(oneGrade);

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

        private Grade ConstructObject(DataRow oneRow) 
        {

            Grade oneGrade = new Grade();

            oneGrade.Id = (int)oneRow["id"];
            oneGrade.Name = oneRow["name"].ToString();
            oneGrade.SpeciesId = (int)oneRow["speciesid"];
            oneGrade.Abbr = oneRow["abbr"].ToString();

            return oneGrade;

        }


	}
}
