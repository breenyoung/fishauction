using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Species.
	/// </summary>
    public class Species
    {
        public static readonly int SHRIMP = 1;

        #region Private Variables
        private int id;
        private string name;
        #endregion

        #region Getters/Setters
        public int Id
        {
            get { return id; }
            set { id = value; }
        }


        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        #endregion

		public Species()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
