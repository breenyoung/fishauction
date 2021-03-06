using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for User.
	/// </summary>
	public class User
	{

        #region Private Variables
        private long id ;
        private string firstName;
        private string lastName;
        private string username;
        private string password;
        private string address1;
        private string address2;
        private string city;
        private int province;
        private string postalCode;
        private string phone1;
        private string phone2;
        private string fax;
        private string cellPhone;
        private string email;
        private int processorId;
        #endregion


        #region Getters/Setters
        public long Id
        {
            get { return id; }
            set { id = value; }
        }


        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
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

        public string Address1
        {
            get { return address1; }
            set { address1 = value; }
        }

        public string Address2
        {
            get { return address2; }
            set { address2 = value; }
        }

        public string City
        {
            get { return city; }
            set { city = value; }
        }

        public int Province
        {
            get { return province; }
            set { province = value; }
        }

        public string PostalCode
        {
            get { return postalCode; }
            set { postalCode = value; }
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

        public string CellPhone
        {
            get { return cellPhone; }
            set { cellPhone = value; }
        }

        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public int ProcessorId
        {
            get { return processorId; }
            set { processorId = value; }
        }
        #endregion

        public User()
        {
            //
            // TODO: Add constructor logic here
            //
        }


	}
}
