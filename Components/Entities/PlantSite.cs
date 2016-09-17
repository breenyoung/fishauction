using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for PlantSite.
	/// </summary>
	public class PlantSite
	{


        #region Private Variables
        private int id;
        private string name;
        private int zoneId;
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

        public int ZoneId
        {
            get { return zoneId; }
            set { zoneId = value; }
        }
        #endregion

		public PlantSite()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
