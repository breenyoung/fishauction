using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Auction.
	/// </summary>
	public class Auction
	{

        #region Private Variables
        private long id;
        private DateTime startDate;
        private DateTime endDate;
        private bool active;
        private decimal startPrice;
        private AuctionStatusType status;
        private AuctionStatusReason reason;
        private bool confirmed;
        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        public DateTime StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }

        public DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public bool Active
        {
            get { return active; }
            set { active = value; }
        }

        public decimal StartPrice
        {
            get { return startPrice; }
            set { startPrice = value; }
        }

        public AuctionStatusType Status
        {
            get { return status; }
            set { status = value; }
        }

        public AuctionStatusReason Reason
        {
            get { return reason; }
            set { reason = value; }
        }

        public bool Confirmed
        {
            get { return confirmed; }
            set { confirmed = value; }
        }


        #endregion

		public Auction()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
