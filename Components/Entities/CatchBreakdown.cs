using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for CatchBreakdown.
	/// </summary>
	public class CatchBreakdown
	{

        #region Private Variables
        private long catchId;
        private short day;
        private int cvalue;
        #endregion

        #region Getters/Setters
        public long CatchId
        {
            get { return catchId; }
            set { catchId = value; }
        }

        public short Day
        {
            get { return day; }
            set { day = value; }
        }

        public int Value
        {
            get { return cvalue; }
            set { cvalue = value; }
        }
        #endregion

		public CatchBreakdown()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
