using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Bid.
	/// </summary>
	public class Bid
	{

        #region Private Variables
        private long id ;
        private long auctionId;
        private long buyerId;
        private DateTime bidDate;
        private decimal bidPrice;
        private int selectedPort;
        private float smallGrade;
        private float mediumGrade;
        private float largeGrade;
        private float xlGrade;
        private float avgPerLb;

        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        public long AuctionId
        {
            get { return auctionId; }
            set { auctionId = value; }
        }

        public long BuyerId
        {
            get { return buyerId; }
            set { buyerId = value; }
        }

        public DateTime BidDate
        {
            get { return bidDate; }
            set { bidDate = value; }
        }
        
        public decimal BidPrice
        {
            get { return bidPrice; }
            set { bidPrice = value; }
        }

        public int SelectedPort
        {
            get { return selectedPort; }
            set { selectedPort = value; }
        }


        public float SmallGrade
        {
            get { return smallGrade; }
            set { smallGrade = value; }
        }

        public float MediumGrade
        {
            get { return mediumGrade; }
            set { mediumGrade = value; }
        }
        public float LargeGrade
        {
            get { return largeGrade; }
            set { largeGrade = value; }
        }
        
        public float XLGrade
        {
            get { return xlGrade; }
            set { xlGrade = value; }
        }

        public float AvgPerLb
        {
            get { return avgPerLb; }
            set { avgPerLb = value; }
        }

        #endregion


		public Bid()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
