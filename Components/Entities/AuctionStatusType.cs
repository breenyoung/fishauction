using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for AuctionStatusType.
	/// </summary>
	public class AuctionStatusType
	{

        public static AuctionStatusType OPEN = new AuctionStatusType(1);
        public static AuctionStatusType COMPLETED = new AuctionStatusType(2);
        public static AuctionStatusType ALL = new AuctionStatusType(3);


        private int id ;

        public AuctionStatusType()
        {
            //
            // TODO: Add constructor logic here
            //
        }


		public AuctionStatusType(int id)
		{
            this.id = id;
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
