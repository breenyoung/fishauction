using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Components.Entities;
using Microsoft.ApplicationBlocks.Data;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for CatchDal.
	/// </summary>
	public class CatchDal
	{

        private static readonly string TABLE_NAME = "Catches" ;
        private static readonly string SP_GETBYID = "CatchesGetById";
        private static readonly string SP_GETBYTRIPID = "CatchesGetByTripId";
        private static readonly string SP_CREATE = "CatchesCreate";
        private static readonly string SP_UPDATE = "CatchesUpdate";
        private static readonly string SP_DELETE = "CatchesDelete";

        private static readonly string CS_TABLE_NAME = "CatchSupplies" ;
        private static readonly string SP_CS_GETBYCATCHID = "CatchSuppliesGetByCatchId";
        private static readonly string SP_CS_CREATE = "CatchSuppliesCreate";
        private static readonly string SP_CS_UPDATE = "CatchSuppliesUpdate";
        private static readonly string SP_CS_DELETE = "CatchSuppliesDelete";

        private static readonly string CG_TABLE_NAME = "CatchGrades" ;
        private static readonly string SP_CG_GETBYCATCHID = "CatchGradesGetByCatchId";
        private static readonly string SP_CG_CREATE = "CatchGradesCreate";
        private static readonly string SP_CG_UPDATE = "CatchGradesUpdate";
        private static readonly string SP_CG_DELETE = "CatchGradesDelete";

        private static readonly string CB_TABLE_NAME = "CatchBreakdowns" ;
        private static readonly string SP_CB_GETBYCATCHID = "CatchBreakdownsGetByCatchId";
        private static readonly string SP_CB_CREATE = "CatchBreakdownsCreate";
        private static readonly string SP_CB_UPDATE = "CatchBreakdownsUpdate";
        private static readonly string SP_CB_DELETE = "CatchBreakdownsDelete";


        private static CatchDal myInstance = null;

        public static CatchDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new CatchDal();
            }

            return myInstance;

        }

        
        
        private CatchDal()
		{
		}

        public Catch GetById(long id) 
        {

            Catch objCatch = new Catch();

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
                        objCatch = ConstructObject(oneRow);
                        return objCatch;
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

        public Catch GetByTripId(long tripId) 
        {

            Catch objCatch = new Catch();

            SqlConnection conn = null;
            try 
            {

                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@TRIPID",tripId);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYTRIPID, theParams);

                if(ds != null) 
                {
                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        objCatch = ConstructObject(oneRow);
                        return objCatch;

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


        public ArrayList GetCatchSupplies(long catchId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@CATCHID", catchId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_CS_GETBYCATCHID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        CatchSupply oneCS = ConstructCSObject(row);
                        
                        all.Add(oneCS);

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


        public ArrayList GetCatchGrades(long catchId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@CATCHID", catchId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_CG_GETBYCATCHID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        CatchGrade oneCG = ConstructCGObject(row);
                        
                        all.Add(oneCG);

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

        public ArrayList GetCatchBreakdowns(long catchId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@CATCHID", catchId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_CB_GETBYCATCHID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        CatchBreakdown oneCB = ConstructCBObject(row);
                        
                        all.Add(oneCB);

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



        public void Create(Catch objCatch) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(false, objCatch);

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

        public void CreateCatchSupply(CatchSupply catchSupply) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCSParameters(catchSupply);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CS_CREATE, theParams);


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


        public void CreateCatchGrade(CatchGrade catchGrade) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCGParameters(catchGrade);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CG_CREATE, theParams);


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


        public void CreateCatchBreakdown(CatchBreakdown catchBreakdown) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCBParameters(catchBreakdown);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CB_CREATE, theParams);


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


        public void Update(Catch objCatch) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(true, objCatch);

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

        public void UpdateCatchSupply(CatchSupply catchSupply) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCSParameters(catchSupply);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CS_UPDATE, theParams);


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

        public void UpdateCatchGrade(CatchGrade catchGrade) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCGParameters(catchGrade);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CG_UPDATE, theParams);


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


        public void UpdateCatchBreakdown(CatchBreakdown catchBreakdown) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructCBParameters(catchBreakdown);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CB_UPDATE, theParams);


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


        public void DeleteCatchSupply(long catchId,short supplyId) 
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
                    new SqlParameter("@CATCHID", catchId),
                    new SqlParameter("@SUPPLYID", supplyId)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CS_DELETE, theParams);


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

        public void DeleteCatchGrade(long catchId,int gradeId) 
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
                    new SqlParameter("@CATCHID", catchId),
                    new SqlParameter("@GRADEID", gradeId)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CG_DELETE, theParams);


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


        public void DeleteCatchBreakdown(long catchId,short day) 
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
                    new SqlParameter("@CATCHID", catchId),
                    new SqlParameter("@DAY", day)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CB_DELETE, theParams);


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


        private Catch ConstructObject(DataRow oneRow) 
        {

            Catch objCatch = new Catch();
            objCatch.Id = (long)oneRow["id"];
            objCatch.TripId = (long)oneRow["tripid"];
            objCatch.SpeciesId = (int)oneRow["speciesid"];
            objCatch.Quantity = (int)oneRow["quantity"];
            //objCatch.CatchDate = (DateTime)oneRow["catchdate"];
            objCatch.StowId = (int)oneRow["stowid"];

            // Get catch supplies for catch
            ArrayList catchSupplies = GetCatchSupplies(objCatch.Id);
            objCatch.CatchSupplies = catchSupplies;

            // Get catch grades for catch
            ArrayList catchGrades = GetCatchGrades(objCatch.Id);
            objCatch.CatchGrades = catchGrades;

            // Get catch breakdowns for catch
            ArrayList catchBreakdowns = GetCatchBreakdowns(objCatch.Id);
            objCatch.CatchBreakdowns = catchBreakdowns;

            return objCatch;
        }

        private CatchSupply ConstructCSObject(DataRow oneRow) 
        {

            CatchSupply catchSupply = new CatchSupply();
            catchSupply.CatchId = (long)oneRow["catchid"];
            catchSupply.SupplyId = (short)oneRow["supplyid"];
            catchSupply.Value = (int)oneRow["value"];

            return catchSupply;
        }

        private CatchGrade ConstructCGObject(DataRow oneRow) 
        {

            CatchGrade catchGrade = new CatchGrade();
            catchGrade.CatchId = (long)oneRow["catchid"];
            catchGrade.GradeId = (int)oneRow["gradeid"];
            catchGrade.Value = (int)oneRow["value"];

            return catchGrade;
        }

        private CatchBreakdown ConstructCBObject(DataRow oneRow) 
        {

            CatchBreakdown catchBreakdown = new CatchBreakdown();
            catchBreakdown.CatchId = (long)oneRow["catchid"];
            catchBreakdown.Day = (short)oneRow["day"];
            catchBreakdown.Value = (int)oneRow["value"];

            return catchBreakdown;
        }


        private SqlParameter[] ConstructParameters(bool isUpdate, Catch objCatch) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[5];
                theParams[x] = new SqlParameter("@ID", objCatch.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[4];
            }

            theParams[x++] = new SqlParameter("@TRIPID", objCatch.TripId);
            theParams[x++] = new SqlParameter("@SPECIESID", objCatch.SpeciesId);
            theParams[x++] = new SqlParameter("@QUANTITY", objCatch.Quantity);
            theParams[x++] = new SqlParameter("@CATCHDATE", objCatch.CatchDate);

            return theParams;

        }

        private SqlParameter[] ConstructCSParameters(CatchSupply catchSupply) 
        {

            SqlParameter[] theParams = null;
            theParams = new SqlParameter[3];
            theParams[0] = new SqlParameter("@CATCHID", catchSupply.CatchId);
            theParams[1] = new SqlParameter("@SUPPLYID", catchSupply.SupplyId);
            theParams[2] = new SqlParameter("@VALUE", catchSupply.Value);

            return theParams;

        }

        private SqlParameter[] ConstructCGParameters(CatchGrade catchGrade) 
        {

            SqlParameter[] theParams = null;
            theParams = new SqlParameter[3];
            theParams[0] = new SqlParameter("@CATCHID", catchGrade.CatchId);
            theParams[1] = new SqlParameter("@GRADEID", catchGrade.GradeId);
            theParams[2] = new SqlParameter("@VALUE", catchGrade.Value);

            return theParams;

        }

        private SqlParameter[] ConstructCBParameters(CatchBreakdown catchBreakdown) 
        {

            SqlParameter[] theParams = null;
            theParams = new SqlParameter[3];
            theParams[0] = new SqlParameter("@CATCHID", catchBreakdown.CatchId);
            theParams[1] = new SqlParameter("@GRADEID", catchBreakdown.Day);
            theParams[2] = new SqlParameter("@VALUE", catchBreakdown.Value);

            return theParams;

        }



	}
}
