using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Supply.
	/// </summary>
	public class Supply
	{

        public static readonly int ICE = 1;
        public static readonly int BAGS = 2;
        public static readonly int PANS = 3;
        public static readonly int ICONTAINERS = 4;

        #region Private Variables
        private short id;
        private string name;
        private string unittype;
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

        public string UnitType
        {
            get { return unittype; }
            set { unittype = value; }
        }
        #endregion

		public Supply()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
