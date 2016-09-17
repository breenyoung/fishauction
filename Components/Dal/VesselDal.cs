using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Components.Entities;
using Microsoft.ApplicationBlocks.Data;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for VesselDal.
	/// </summary>
	public class VesselDal
	{

        private static readonly string TABLE_NAME = "Vessels" ;
        private static readonly string SP_GETBYID = "VesselGetById";
        private static readonly string SP_GETBYCFV = "VesselGetByCfv";
        private static readonly string SP_GETBYNAME = "VesselGetByName";
        private static readonly string SP_GETALL = "VesselGetAll";
        private static readonly string SP_CREATE = "VesselCreate";
        private static readonly string SP_UPDATE = "VesselUpdate";
        private static readonly string SP_DELETE = "VesselDelete";


        private static VesselDal myInstance = null;

        public static VesselDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new VesselDal();
            }

            return myInstance;

        }


		private VesselDal()
		{
		}

        public Vessel GetById(long id) 
        {

            Vessel vessel = new Vessel();

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID",id);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYID, theParams);
                
                if(ds != null) 
                {
                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        vessel = ConstructObject(oneRow);
                        return vessel;
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


        public Vessel GetByCfv(int cfv) 
        {

            Vessel vessel = new Vessel();

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@CFV",cfv);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYCFV, theParams);
            

                if(ds != null) 
                {                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {

                        DataRow oneRow = ds.Tables[0].Rows[0];
                        vessel = ConstructObject(oneRow);
                        return vessel;
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
                if(conn != null) {  conn.Close(); }
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
                        Vessel oneVessel = ConstructObject(row);
                        
                        all.Add(oneVessel);

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


        public ArrayList GetByName(string name) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@NAME",name);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYNAME, theParams);


                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Vessel oneVessel = ConstructObject(row);
                        
                        all.Add(oneVessel);

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




        public void Create(Vessel vessel) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams 
                    = ConstructParameters(false, vessel);


                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CREATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }

        public void Update(Vessel vessel) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams 
                    = ConstructParameters(true, vessel);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_UPDATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }

        }

        public void Delete(long id) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@ID", id)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_DELETE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }

        private Vessel ConstructObject(DataRow oneRow) 
        {

            Vessel vessel = new Vessel();

            vessel.Id = (long)oneRow["id"];
            vessel.Name = oneRow["name"].ToString();
            vessel.Cfv = (int)oneRow["cfv"];
            vessel.Captain = oneRow["captain"].ToString();
            vessel.Phone1 = oneRow["phone1"].ToString();
            vessel.Phone2 = oneRow["phone2"].ToString();
            vessel.Phone3 = oneRow["phone3"].ToString();
            vessel.Email1 = oneRow["email"].ToString();
            vessel.Email2 = oneRow["email2"].ToString();
            vessel.Email3 = oneRow["email3"].ToString();
            vessel.Capacity = (int)oneRow["capacity"];

            int stowId = (int)oneRow["stowid"];
            vessel.Stow = StowDal.GetInstance().GetById(stowId);

            vessel.Active = (bool)oneRow["active"];

            return vessel;

        }

        private SqlParameter[] ConstructParameters(bool isUpdate, Vessel vessel) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[13];
                theParams[x] = new SqlParameter("@ID", vessel.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[12];
            }

            theParams[x++] = new SqlParameter("@NAME", vessel.Name);
            theParams[x++] = new SqlParameter("@CFV", vessel.Cfv);
            theParams[x++] = new SqlParameter("@CAPTAIN", vessel.Captain);
            theParams[x++] = new SqlParameter("@PHONE1", vessel.Phone1);
            theParams[x++] = new SqlParameter("@PHONE2", vessel.Phone2);
            theParams[x++] = new SqlParameter("@PHONE3", vessel.Phone3);
            theParams[x++] = new SqlParameter("@EMAIL1", vessel.Email1);
            theParams[x++] = new SqlParameter("@EMAIL2", vessel.Email2);
            theParams[x++] = new SqlParameter("@EMAIL3", vessel.Email3);
            theParams[x++] = new SqlParameter("@CAPACITY", vessel.Capacity);
            
            Stow stow = (Stow)vessel.Stow;
            int stowId = stow.Id;
            theParams[x++] = new SqlParameter("@STOWID", stowId);

            theParams[x++] = new SqlParameter("@ACTIVE", vessel.Active);

            return theParams;

        }


	}
}
