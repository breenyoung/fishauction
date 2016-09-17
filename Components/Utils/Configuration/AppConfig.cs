using System;

namespace Components.Utils.Configuration
{
	/// <summary>
	/// Summary description for AppConfig.
	/// </summary>
	public class AppConfig
	{

        #region member variables

        private string mDbConnectionString;
        private int mPasswordMinLength;
        private int mPasswordMaxLength;
        private string mPasswordChars;

        #endregion


		public AppConfig()
		{
			//
			// TODO: Add constructor logic here
			//
		}

        #region properties

        public string DbConnectionString
        {
            get { return mDbConnectionString; }
            set { mDbConnectionString = value; }
        }

/*
        public int PasswordMinLength
        {
            get { return mPasswordMinLength; }
            set { mPasswordMinLength = value; }
        }

        public int PasswordMaxLength
        {
            get { return mPasswordMaxLength; }
            set { mPasswordMaxLength = value; }
        }

        public string PasswordChars
        {
            get { return mPasswordChars; }
            set { mPasswordChars = value; }
        }
*/

        #endregion


	}
}
