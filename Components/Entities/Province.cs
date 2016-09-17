using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Province.
	/// </summary>
	public class Province
	{

        #region Private Variables
        private short id;
        private string name;
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
        #endregion

		public Province()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
