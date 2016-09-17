using System;
using System.Collections;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Trip.
	/// </summary>
	public class Trip
	{

        #region Private Variables
        private long id;
        private long vesselId;
        private long lotId;
        private DateTime hailOutDate;
        private DateTime hailInDate;
        private decimal daysOut;
        private DateTime eta;
        private string specialInstructions;
        private ArrayList ports;
        private int area;
        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        public long VesselId
        {
            get { return vesselId; }
            set { vesselId = value; }
        }

        public long LotId
        {
            get { return lotId; }
            set { lotId = value; }
        }

        public DateTime HailOutDate
        {
            get { return hailOutDate; }
            set { hailOutDate = value; }
        }

        public DateTime HailInDate
        {
            get { return hailInDate; }
            set { hailInDate = value; }
        }

        public decimal DaysOut
        {
            get { return daysOut; }
            set { daysOut = value; }
        }

        public DateTime Eta
        {
            get { return eta; }
            set { eta = value; }
        }

        public string SpecialInstructions
        {
            get { return specialInstructions; }
            set { specialInstructions = value; }
        }

        public ArrayList Ports
        {
            get { return ports; }
            set { ports = value; }
        }

        public int Area
        {
            get { return area; }
            set { area = value; }
        }

        #endregion


		public Trip()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
