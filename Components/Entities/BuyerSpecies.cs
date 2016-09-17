using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for BuyerSpecies.
	/// </summary>
	public class BuyerSpecies
	{

        #region Private Variables
        private long buyerId;
        private int speciesId;
        #endregion

        #region Getters/Setters
        public long BuyerId
        {
            get { return buyerId; }
            set { buyerId = value; }
        }

        public int SpeciesId
        {
            get { return speciesId; }
            set { speciesId = value; }
        }
        #endregion



		public BuyerSpecies()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
