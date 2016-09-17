using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for Vessel.
	/// </summary>
	public class Vessel
	{

        #region Private Variables
        private long id;
        private string name;
        private int cfv;
        private string captain;
        private string phone1;
        private string phone2;
        private string phone3;
        private string email1;
        private string email2;
        private string email3;
        private int capacity;
        private Stow stow;
        private bool active;
        #endregion

        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int Cfv
        {
            get { return cfv; }
            set { cfv = value; }
        }

        public string Captain
        {
            get { return captain; }
            set { captain = value; }
        }

        public string Phone1
        {
            get { return phone1; }
            set { phone1 = value; }
        }

        public string Phone2
        {
            get { return phone2; }
            set { phone2 = value; }
        }

        public string Phone3
        {
            get { return phone3; }
            set { phone3 = value; }
        }

        public string Email1
        {
            get { return email1; }
            set { email1 = value; }
        }

        public string Email2
        {
            get { return email2; }
            set { email2 = value; }
        }

        public string Email3
        {
            get { return email3; }
            set { email3 = value; }
        }

        public int Capacity
        {
            get { return capacity; }
            set { capacity = value; }
        }
        public Stow Stow
        {
            get { return stow; }
            set { stow = value; }
        }

        public bool Active
        {
            get { return active; }
            set { active = value; }
        }

        #endregion

 

		public Vessel()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
