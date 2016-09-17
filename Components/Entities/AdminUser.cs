using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for AdminUser.
	/// </summary>
	public class AdminUser
	{

        #region Private Variables
        private long id ;
        private int classId;
        private string name;
        private string description;
        private string username;
        private string password;
        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }


        public int ClassId
        {
            get { return classId; }
            set { classId = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        #endregion


		public AdminUser()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
