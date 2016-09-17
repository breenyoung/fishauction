using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Port.
	/// </summary>
	public class Port
	{


        #region Private Variables
        private int id;
        private string name;
        private int zoneId;
        private byte active;
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

        public byte Active
        {
            get { return active; }
            set { active = value; }
        }

        
        #endregion

		public Port()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
