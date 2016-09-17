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
	/// Summary description for BidDal.
	/// </summary>
	public class BidDal
	{

        private static readonly string TABLE_NAME = "Bids" ;
        private static readonly string SP_GETBYID = "BidsGetById";
        private static readonly string SP_GETBYAUCTIONID = "BidsGetByAuctionId";
        private static readonly string SP_GETBYBUYERID = "BidsGetByBuyerId";
        private static readonly string SP_GETWINNINGBYBUYERID = "BidsGetWinningByBuyerId";
        private static readonly string SP_GETLOSINGBYBUYERID = "BidsGetLosingByBuyerId";
        private static readonly string SP_GETWONBYBUYERID = "BidsGetWonByBuyerId";
        private static readonly string SP_GETWINNINGBYPROCID = "BidsGetWinningByProcId";
        private static readonly string SP_GETLOSINGBYPROCID = "BidsGetLosingByProcId";
        private static readonly string SP_GETWONBYPROCID = "BidsGetWonByProcId";


        private static readonly string SP_GETBYBUYERAUCTION = "BidsGetByBuyerAuction";
        private static readonly string SP_GETHIGHBID = "BidsGetHighBid";
        private static readonly string SP_GETHIGHBIDPROC = "BidsGetHighBidProc";
        private static readonly string SP_GETHIGHBIDINFO = "BidsGetHighBidInfo";
        private static readonly string SP_GETNEXTHIGHESTBIG = "BidsGetNextHighest";
        private static readonly string SP_CREATE = "BidsCreate";
        private static readonly string SP_UPDATE = "BidsUpdate";
        private static readonly string SP_DELETE = "BidsDelete";

        private static BidDal myInstance = null;

        public static BidDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new BidDal();
            }

            return myInstance;

        }


		private BidDal()
		{
		}
        
        public Bid GetById(long id) 
        {

            Bid bid = new Bid();

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
                        bid = ConstructObject(oneRow);
                        return bid;
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

        public ArrayList GetBidsByAuction(long auctionId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@AUCTIONID", auctionId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYAUCTIONID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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

        public float GetCurrentHighBid(long auctionId) 
        {

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@LOTID", auctionId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETHIGHBID,theParams);


                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        float highBid = float.Parse(oneRow["amount"].ToString());
                        return highBid;

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

        public int GetCurrentHighBidProc(long auctionId) 
        {

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@LOTID", auctionId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETHIGHBIDPROC,theParams);


                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        int procId = Int32.Parse(oneRow["processorid"].ToString());
                        return procId;

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


        public ArrayList GetNextHighestBid(long auctionId, float highBid) 
        {

            SqlConnection conn = null;
            ArrayList returnVals = new ArrayList(2);
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@LOTID", auctionId);
                theParams[1] = new SqlParameter("@HIGHBID", highBid);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETNEXTHIGHESTBIG,theParams);

                if(ds != null) 
                {                    
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        if(oneRow["amount"] != null) 
                        {                            
                            float nextHighest = float.Parse(oneRow["avgperlb"].ToString());
                            decimal nextHighestTotal = decimal.Parse(oneRow["amount"].ToString());
                            int procId = int.Parse(oneRow["processorid"].ToString());

                            returnVals.Add(nextHighest);
                            returnVals.Add(nextHighestTotal);
                            returnVals.Add(procId);
                            //return nextHighest;
                        } 
                        else 
                        {
                            returnVals.Add(float.Parse("0.000"));
                            returnVals.Add(decimal.Parse("0.00"));
                            returnVals.Add(int.Parse("0"));
                            //return 0;
                        }

                    } 

                }
                return returnVals;

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


        public ArrayList GetBidsByBuyer(long buyerId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYBUYERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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

        public ArrayList GetWinningBidsByBuyer(long buyerId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[1] = new SqlParameter("@NOW",currentDT);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETWINNINGBYBUYERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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

        public ArrayList GetWinningBidsByProcessor(int procId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@PROCID", procId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[1] = new SqlParameter("@NOW",currentDT);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETWINNINGBYPROCID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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


        public ArrayList GetLosingBidsByBuyer(long buyerId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[1] = new SqlParameter("@NOW",currentDT);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETLOSINGBYBUYERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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


        public ArrayList GetLosingBidsByProcessor(int procId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@PROCID", procId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                theParams[1] = new SqlParameter("@NOW",currentDT);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETLOSINGBYPROCID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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


        public ArrayList GetWonAuctionsByBuyer(long buyerId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[3];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                DateTime yesterday = currentDT.Subtract(new TimeSpan(1,0,0,0));

                theParams[1] = new SqlParameter("@NOW",currentDT);
                theParams[2] = new SqlParameter("@YESTERDAY",yesterday);


                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETWONBYBUYERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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

        public ArrayList GetWonAuctionsByProcessor(int procId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[3];
                theParams[0] = new SqlParameter("@PROCID", procId);
                
                DateTime currentDT = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                DateTime yesterday = currentDT.Subtract(new TimeSpan(1,0,0,0));

                theParams[1] = new SqlParameter("@NOW",currentDT);
                theParams[2] = new SqlParameter("@YESTERDAY",yesterday);


                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETWONBYPROCID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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


        public ArrayList GetBidsByBuyerAuction(long buyerId, long auctionId) 
        {

            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[2];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);
                theParams[1] = new SqlParameter("@LOTID", auctionId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYBUYERAUCTION,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Bid oneBid = ConstructObject(row);
                        
                        all.Add(oneBid);

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

        public Bid GetByHighBidInfo(long auctionId) 
        {

            Bid bid = new Bid();

            SqlConnection conn = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@LOTID", auctionId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETHIGHBIDINFO,theParams);

                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        bid = ConstructObject(oneRow);
                        return bid;
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


        public bool Create(Bid bid) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(false, bid);
/*
                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CREATE, theParams);
*/

                DataSet ds = SqlHelper.ExecuteDataset(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CREATE, theParams);

            
                bool result = false;
                if(ds != null) 
                {
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        byte returnCode = (byte)oneRow["theresult"];
                        if(returnCode == 0) 
                        {
                            result = false;
                        } 
                        else 
                        {
                            result = true;
                        }
                        
                    } 

                }
    

                trans.Commit();

                return result;
                
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

        public void Update(Bid bid) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(true, bid);
                /*
                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@ID", bid.Id),
                    new SqlParameter("@BUYERID", bid.BuyerId),
                    new SqlParameter("@BIDPRICE", bid.BidPrice),
                    new SqlParameter("@BIDDATE", bid.BidDate),
                    new SqlParameter("@LOTID", bid.AuctionId)
                };
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

        private Bid ConstructObject(DataRow oneRow) 
        {
            
            Bid bid = new Bid();

            bid.Id = (long)oneRow["id"];
            bid.AuctionId = (long)oneRow["lotid"];
            bid.BidDate = (DateTime)oneRow["biddate"];
            bid.BidPrice = (decimal)oneRow["amount"];
            bid.BuyerId = (long)oneRow["buyerid"];
            bid.SelectedPort = (int)oneRow["selectedport"];
            bid.SmallGrade = float.Parse(oneRow["sgrade"].ToString());
            bid.MediumGrade = float.Parse(oneRow["mgrade"].ToString());
            bid.LargeGrade = float.Parse(oneRow["lgrade"].ToString());
            bid.XLGrade = float.Parse(oneRow["xlgrade"].ToString());
            bid.AvgPerLb = float.Parse(oneRow["avgperlb"].ToString());

            return bid;
        }

        private SqlParameter[] ConstructParameters(bool isUpdate, Bid bid) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[11];
                theParams[x] = new SqlParameter("@ID", bid.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[10];
            }

            theParams[x++] = new SqlParameter("@BUYERID", bid.BuyerId);
            theParams[x++] = new SqlParameter("@AMOUNT", bid.BidPrice);
            theParams[x++] = new SqlParameter("@BIDDATE", bid.BidDate);
            theParams[x++] = new SqlParameter("@LOTID", bid.AuctionId);
            theParams[x++] = new SqlParameter("@SELECTEDPORT", bid.SelectedPort);
            theParams[x++] = new SqlParameter("@SGRADE", bid.SmallGrade);
            theParams[x++] = new SqlParameter("@MGRADE", bid.MediumGrade);
            theParams[x++] = new SqlParameter("@LGRADE", bid.LargeGrade);
            theParams[x++] = new SqlParameter("@XLGRADE", bid.XLGrade);
            theParams[x++] = new SqlParameter("@AVGPERLB", bid.AvgPerLb);

//            theParams[x++] = new SqlParameter("@RETURNCODE", -1);


            return theParams;
        }

	}
}
