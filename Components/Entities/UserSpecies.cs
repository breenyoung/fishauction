using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for UserSpecies.
	/// </summary>
	public class UserSpecies
	{

        #region Private Variables
        private int id;
        private long buyerId;
        private int speciesId;
        #endregion

        #region Getters/Setters
        public int Id
        {
            get { return id; }
            set { id = value; }
        }


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

		public UserSpecies()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
