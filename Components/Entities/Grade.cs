using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Grade.
	/// </summary>
	public class Grade
	{
        
        public static readonly int SMALL = 1;
        public static readonly int MEDIUM = 2;
        public static readonly int LARGE = 3;
        public static readonly int XLARGE = 4;
        


        #region Private Variables
        private int id;
        private string name;
        private int speciesId;
        private string abbr;
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

        public int SpeciesId
        {
            get { return speciesId; }
            set { speciesId = value; }
        }

        public string Abbr
        {
            get { return abbr; }
            set { abbr = value; }
        }
        #endregion

		public Grade()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
