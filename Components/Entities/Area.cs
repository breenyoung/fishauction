using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Area.
	/// </summary>
	public class Area
	{

        #region Private Variables
        private short id;
        private string name;
        private string abbr;
        #endregion

        #region Getters/Setters
        public short Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Abbr
        {
            get { return abbr; }
            set { abbr = value; }
        }

        #endregion

		public Area()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
