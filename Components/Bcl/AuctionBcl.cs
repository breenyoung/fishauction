using System;
using System.Collections;

using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for AuctionBcl.
	/// </summary>
	public class AuctionBcl
	{

        private static AuctionBcl myInstance = null;

        public static AuctionBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AuctionBcl();
            }

            return myInstance;

        }

		private AuctionBcl()
		{
		}

        public Auction GetAuctionById(long id) 
        {
            Auction oneAuction = AuctionDal.GetInstance().GetById(id);
            return oneAuction;
        }

        public ArrayList GetActiveAuctions() 
        {
            ArrayList auctions = AuctionDal.GetInstance().GetActiveAuctions();
            return auctions;
        }

        public ArrayList GetAuctionsByStatus(int statusId) 
        {
            ArrayList auctions = AuctionDal.GetInstance().GetAuctionsByStatus(statusId);
            return auctions;
        }

        public ArrayList GetAuctionsByActiveFlag(bool flag) 
        {
            ArrayList auctions = AuctionDal.GetInstance().GetAuctionsByActiveFlag(flag);
            return auctions;
        }


        public ArrayList GetAuctionsByStartDate(DateTime startDate) 
        {
            ArrayList auctions = AuctionDal.GetInstance().GetAuctionsByStartDate(startDate);
            return auctions;
        }

        public ArrayList GetAuctionsClosedToday() 
        {
            ArrayList auctions = AuctionDal.GetInstance().GetAuctionsClosedToday();
            return auctions;
        }

        public int GetActiveAuctionCount() 
        {
            int count = AuctionDal.GetInstance().GetActiveAuctionCount();
            return count;
        }

        public void CreateAuction(Auction auction) 
        {    
            AuctionDal.GetInstance().Create(auction);
        }

        public void UpdateAuction(Auction auction) 
        {    
            AuctionDal.GetInstance().Update(auction);
        }

        public void UpdateAuctionActiveFlag(long id, bool active) 
        {    
            AuctionDal.GetInstance().UpdateActiveFlag(id, active);
        }

        public void DeleteAuction(long id) 
        {
            AuctionDal.GetInstance().Delete(id);
        }
        

	}
}
