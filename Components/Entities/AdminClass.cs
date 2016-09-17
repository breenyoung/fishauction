using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for AdminClass.
	/// </summary>
	public class AdminClass
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


		public AdminClass()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
