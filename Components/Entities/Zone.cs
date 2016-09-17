using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Zone.
	/// </summary>
	public class Zone
	{

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


		public Zone()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
