using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for PortType.
	/// </summary>
	public class PortType
	{

        public static readonly int PREFERED = 1;
        public static readonly int ALTERNATE = 2;

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


		public PortType()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
