using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for CatchSupply.
	/// </summary>
	public class CatchSupply
	{

        #region Private Variables
        private long catchId;
        private short supplyId;
        private int cvalue;
        #endregion

        #region Getters/Setters
        public long CatchId
        {
            get { return catchId; }
            set { catchId = value; }
        }

        public short SupplyId
        {
            get { return supplyId; }
            set { supplyId = value; }
        }

        public int Value
        {
            get { return cvalue; }
            set { cvalue = value; }
        }
        #endregion


		public CatchSupply()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
