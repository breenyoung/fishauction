using System;
using System.Collections;

using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for UserBcl.
	/// </summary>
	public class UserBcl
	{


        private static UserBcl myInstance = null;

        public static UserBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new UserBcl();
            }

            return myInstance;

        }

		private UserBcl()
		{
		}

        public User GetUserById(long id) 
        {
            User oneUser = UserDal.GetInstance().GetById(id);
            return oneUser;
        }

        public User GetUserByUsername(string username) 
        {
            User oneUser = UserDal.GetInstance().GetByUsername(username);
            return oneUser;
        }

        public ArrayList GetSpeciesForUser(long userId) 
        {
            ArrayList species 
                = UserDal.GetInstance().GetSpeciesForUser(userId);

            return species;
        }

        public void CreateUser(User user) 
        {
            UserDal.GetInstance().Create(user);
        }

        public void UpdateUser(User user) 
        {
            UserDal.GetInstance().Update(user);
        }

        public void DeleteUser(long userId) 
        {
            UserDal.GetInstance().Delete(userId);
        }

	}
}
