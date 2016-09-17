using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for TripPort.
	/// </summary>
	public class TripPort
	{

        #region Private Variables
        private int portId;
        private long tripId;
        private byte alternate;
        private bool isZone;
        #endregion

        #region Getters/Setters
        public int PortId
        {
            get { return portId; }
            set { portId = value; }
        }

        public long TripId
        {
            get { return tripId; }
            set { tripId = value; }
        }

        public byte Alternate
        {
            get { return alternate; }
            set { alternate = value; }
        }

        public bool IsZone
        {
            get { return isZone; }
            set { isZone = value; }
        }

        #endregion

		public TripPort()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
