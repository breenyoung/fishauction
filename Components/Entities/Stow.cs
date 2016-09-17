using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Stow.
	/// </summary>
	public class Stow
	{

        public static readonly int BAGS = 1;
        public static readonly int PANS = 2;
        public static readonly int ICONTAINERS = 3;
        public static readonly int BAGSANDPANS = 4;
        public static readonly int BAGSANDICONTAINERS = 5;
        public static readonly int PANSANDICONTAINERS = 6;

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

		public Stow()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
