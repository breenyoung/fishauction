using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

using Components.Entities;
using Components.Utils.Formatting;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for AuctionDal.
	/// </summary>
	public class AuctionDal
	{

        private static readonly string TABLE_NAME = "AuctionLots" ;
        private static readonly string SP_GETBYID = "AuctionLotsGetById";
        private static readonly string SP_GETACTIVE = "AuctionLotsGetActive";
        private static readonly string SP_GETACTIVECOUNT = "AuctionLotsGetActiveCount";
        private static readonly string SP_GETBYSTATUS = "AuctionLotsGetByStatus";
        private static readonly string SP_GETBYSTARTDATE = "AuctionLotsGetByStartDate";
        private static readonly string SP_GETBYCLOSEDTODAY = "AuctionLotsGetClosedToday";
        private static readonly string SP_GETACTIVEFLAG = "AuctionLotsGetByActiveFlag";
        private static readonly string SP_CREATE = "AuctionLotsCreate";
        private static readonly string SP_UPDATE = "AuctionLotsUpdate";
        private static readonly string SP_UPDATEACTIVE = "AuctionLotsMarkInactive";
        private static readonly string SP_DELETE = "AuctionLotsDelete";


        private static AuctionDal myInstance = null;

        public static AuctionDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AuctionDal();
            }

            return myInstance;

        }

		private AuctionDal()
		{
		}

        public Auction GetById(long id) 
        {
            Auction auction = new Auction();

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID",id);

                DataSet ds = SqlHelper.ExecuteDataset(conn,
                            System.Data.CommandType.StoredProcedure,
                            SP_GETBYID,theParams);

                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        
                        auction = ConstructObject(oneRow);

                        return auction;
                    } 
                }

                return null;

            }
            catch (Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }



        }

        public ArrayList GetAuctionsByStartDate(DateTime startDate) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@STARTDATE",startDate);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYSTARTDATE,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Auction oneAuction = ConstructObject(row);
                        all.Add(oneAuction);

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

        public ArrayList GetAuctionsClosedToday() 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                DateTime today 
                    = FormatUtils.ToNSTTime(System.DateTime.UtcNow);

                DateTime startRange = new DateTime(today.Year,today.Month,today.Day,0,0,0);
                DateTime endRange = new DateTime(today.Year,today.Month,today.Day,11,59,59);

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@STARTRANGE",startRange);
                theParams[1] = new SqlParameter("@ENDRANGE",endRange);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYCLOSEDTODAY,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Auction oneAuction = ConstructObject(row);
                        all.Add(oneAuction);

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


        public ArrayList GetAuctionsByStatus(int statusId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@STATUSID",statusId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYSTATUS,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Auction oneAuction = ConstructObject(row);
                        all.Add(oneAuction);

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

        public ArrayList GetActiveAuctions() 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[0] = new SqlParameter("@NOW",currentDT);


                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETACTIVE, theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Auction oneAuction = ConstructObject(row);

                        all.Add(oneAuction);

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

        public ArrayList GetAuctionsByActiveFlag(bool flag) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ACTIVE",flag);


                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETACTIVEFLAG, theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Auction oneAuction = ConstructObject(row);

                        all.Add(oneAuction);

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


        public int GetActiveAuctionCount() 
        {

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[0] = new SqlParameter("@NOW", currentDT);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETACTIVECOUNT,theParams);


                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        int activeCount = int.Parse(oneRow["actives"].ToString());
                        return activeCount;

                    } 

                }
                
                return 0;

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



        public void Create(Auction auction) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter []theParams = ConstructParameters(false, auction);
                /*
                SqlParameter []theParams = new SqlParameter[6];
                theParams[0] = new SqlParameter("@STARTDATE", auction.StartDate);
                theParams[1] = new SqlParameter("@ENDDATE", auction.EndDate);
                theParams[2] = new SqlParameter("@ACTIVE", auction.Active);
                theParams[3] = new SqlParameter("@STARTPRICE", auction.StartPrice);
                theParams[4] = new SqlParameter("@STATUSID", auction.Status);
                theParams[5] = new SqlParameter("@STATUSREASON", auction.Reason);
                */

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

        public void UpdateActiveFlag(long id, bool active) 
        {
            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID", id);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_UPDATEACTIVE, theParams);


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

        public void Update(Auction auction) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();


                SqlParameter []theParams = ConstructParameters(true, auction);
                /*
                SqlParameter []theParams = new SqlParameter[7];
                theParams[0] = new SqlParameter("@ID", auction.Id);
                theParams[1] = new SqlParameter("@STARTDATE", auction.StartDate);
                theParams[2] = new SqlParameter("@ENDDATE", auction.EndDate);
                theParams[3] = new SqlParameter("@ACTIVE", auction.Active);
                theParams[4] = new SqlParameter("@STARTPRICE", auction.StartPrice);
                theParams[5] = new SqlParameter("@STATUSID", auction.Status);
                theParams[6] = new SqlParameter("@STATUSREASON", auction.Reason);
                */

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

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID", id);

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

        private Auction ConstructObject(DataRow oneRow) 
        {

            Auction auction = new Auction();

            auction.Id = (long)oneRow["id"];
            auction.StartDate = (DateTime)oneRow["startdate"];
            auction.EndDate = (DateTime)oneRow["enddate"];
            auction.Active = (bool)oneRow["active"];                        
            //auction.StartPrice = (decimal)oneRow["startprice"];                        
            //int statusId = (int)oneRow["statusid"];            
            //auction.Status = new AuctionStatusType(statusId);
            auction.Confirmed = (bool)oneRow["confirmed"];

            //if(!oneRow.IsNull("statusreason"))
            //{
            //    int statusreason = (int)oneRow["statusreason"];
            //    auction.Reason = new AuctionStatusReason(statusreason);
            //}

            return auction;

        }

        private SqlParameter[] ConstructParameters(bool isUpdate, Auction auction) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[8];
                theParams[x] = new SqlParameter("@ID", auction.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[7];
            }

            theParams[x++] = new SqlParameter("@STARTDATE", auction.StartDate);
            theParams[x++] = new SqlParameter("@ENDDATE", auction.EndDate);
            theParams[x++] = new SqlParameter("@ACTIVE", auction.Active);
            theParams[x++] = new SqlParameter("@STARTPRICE", auction.StartPrice);
            theParams[x++] = new SqlParameter("@STATUSID", auction.Status);
            theParams[x++] = new SqlParameter("@STATUSREASON", auction.Reason);
            theParams[x++] = new SqlParameter("@CONFIRMED", auction.Confirmed);


            return theParams;

        }


	}
}
