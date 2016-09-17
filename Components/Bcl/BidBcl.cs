using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for BidBcl.
	/// </summary>
	public class BidBcl
	{

        private static BidBcl myInstance = null;

        public static BidBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new BidBcl();
            }

            return myInstance;

        }


		private BidBcl()
		{
		}

        public Bid GetBidById(long id) 
        {
            Bid oneBid = BidDal.GetInstance().GetById(id);
            return oneBid;
        }

        public Bid GetHighBidInfo(long auctionId) 
        {
            Bid oneBid = BidDal.GetInstance().GetByHighBidInfo(auctionId);
            return oneBid;
        }


        public bool IsHighBid(long auctionId, float bidPrice) 
        {

            float currentHighBid 
                = GetHighBidForAuction(auctionId);

            if(currentHighBid != 0) 
            {
                if(bidPrice > currentHighBid) 
                {
                    return true;
                } 
                else 
                {
                    return false;
                }
            } 
            else 
            {
                // No bids yet, return true
                return true;
            }
        }

        public float GetHighBidForAuction(long auctionId) 
        {
            float highBid 
                = BidDal.GetInstance().GetCurrentHighBid(auctionId);

            return highBid;
        }

        public int GetProcForHighBid(long auctionId) 
        {
            int procId 
                = BidDal.GetInstance().GetCurrentHighBidProc(auctionId);

            return procId;
        }


        public ArrayList GetNextHighBidForAuction(long auctionId, float highBid) 
        {
            ArrayList nextHighest 
                = BidDal.GetInstance().GetNextHighestBid(auctionId, highBid);

            return nextHighest;
        }


        public ArrayList GetBidsForAuction(long auctionId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetBidsByAuction(auctionId);

            return bids;

        }

        public ArrayList GetBidsForBuyer(long buyerId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetBidsByBuyer(buyerId);

            return bids;

        }

        public ArrayList GetWinningBidsForBuyer(long buyerId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetWinningBidsByBuyer(buyerId);

            return bids;

        }

        public ArrayList GetWinningBidsForProcessor(int procId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetWinningBidsByProcessor(procId);

            return bids;

        }

        public ArrayList GetLosingBidsForBuyer(long buyerId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetLosingBidsByBuyer(buyerId);

            return bids;

        }

        public ArrayList GetLosingBidsForProcessor(int procId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetLosingBidsByProcessor(procId);

            return bids;

        }

        public ArrayList GetWonAuctionsForBuyer(long buyerId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetWonAuctionsByBuyer(buyerId);

            return bids;

        }

        public ArrayList GetWonAuctionsForProcessor(int procId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetWonAuctionsByProcessor(procId);

            return bids;

        }


        public ArrayList GetBidsByBuyerAuction(long buyerId, long auctionId) 
        {
            ArrayList bids 
                = BidDal.GetInstance().GetBidsByBuyerAuction(buyerId, auctionId);

            return bids;
        }

        public bool CreateBid(Bid bid) 
        {
            bool result = BidDal.GetInstance().Create(bid);
            return result;
        }

        public void UpdateBid(Bid bid) 
        {
            BidDal.GetInstance().Update(bid);
        }

        public void DeleteBid(long id) 
        {
            BidDal.GetInstance().Delete(id);
        }

	}
}
