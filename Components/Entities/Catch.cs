using System;
using System.Collections;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Catch.
	/// </summary>
	public class Catch
	{

        #region Private Variables
        private long id;
        private long tripId;
        private int speciesId;
        private int quantity;
        private DateTime catchDate;
        private int stowId;
        private ArrayList catchSupplies;
        private ArrayList catchGrades;
        private ArrayList catchBreakdowns;
        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        public long TripId
        {
            get { return tripId; }
            set { tripId = value; }
        }

        public int SpeciesId
        {
            get { return speciesId; }
            set { speciesId = value; }
        }

        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }

        public DateTime CatchDate
        {
            get { return catchDate; }
            set { catchDate = value; }
        }

        public int StowId
        {
            get { return stowId; }
            set { stowId = value; }
        }

        public ArrayList CatchSupplies
        {
            get { return catchSupplies; }
            set { catchSupplies = value; }
        }

        public ArrayList CatchGrades
        {
            get { return catchGrades; }
            set { catchGrades = value; }
        }

        public ArrayList CatchBreakdowns
        {
            get { return catchBreakdowns; }
            set { catchBreakdowns = value; }
        }

        #endregion

		public Catch()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
