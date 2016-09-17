using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Processor.
	/// </summary>
	public class Processor
	{

        #region Private Variables
        private int id;
        private string name;
        private string location;
        private int zoneId;
        private decimal minBalance;
        private decimal accountBalance;
        private bool isTrading;
        private decimal demand;
        private string phone;
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

        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        public int ZoneId
        {
            get { return zoneId; }
            set { zoneId = value; }
        }

        public decimal MinBalance
        {
            get { return minBalance; }
            set { minBalance = value; }
        }


        public decimal AccountBalance
        {
            get { return accountBalance; }
            set { accountBalance = value; }
        }

        public bool IsTrading
        {
            get { return isTrading; }
            set { isTrading = value; }
        }

        public decimal Demand
        {
            get { return demand; }
            set { demand = value; }
        }

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        #endregion

		public Processor()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
