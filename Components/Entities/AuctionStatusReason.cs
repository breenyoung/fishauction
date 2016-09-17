using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for AuctionStatusReason.
	/// </summary>
	public class AuctionStatusReason
	{

        public static AuctionStatusReason OPEN = new AuctionStatusReason(1);
        public static AuctionStatusReason COMPLETED = new AuctionStatusReason(2);
        public static AuctionStatusReason ALL = new AuctionStatusReason(3);


        private int id ;

		public AuctionStatusReason()
		{
		}

        public AuctionStatusReason(int id)
        {
            this.id = id;
        }


	}
}
