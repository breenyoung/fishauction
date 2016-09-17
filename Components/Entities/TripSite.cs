using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for TripSite.
	/// </summary>
	public class TripSite
	{

        #region Private Variables
        private int plantId;
        private int otherSiteId;
        private int vesselId;
        #endregion

        #region Getters/Setters
        public int PlantId
        {
            get { return plantId; }
            set { plantId = value; }
        }

        public int OtherSiteId
        {
            get { return otherSiteId; }
            set { otherSiteId = value; }
        }

        public int VesselId
        {
            get { return vesselId; }
            set { vesselId = value; }
        }
        #endregion

		public TripSite()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
