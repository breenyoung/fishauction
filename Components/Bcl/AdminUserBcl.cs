using System;
using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for AdminUserBcl.
	/// </summary>
	public class AdminUserBcl
	{

        private static AdminUserBcl myInstance = null;

        public static AdminUserBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AdminUserBcl();
            }

            return myInstance;

        }

		private AdminUserBcl()
		{
		}

        public AdminUser GetUserById(int id) 
        {
            AdminUser oneUser = AdminUserDal.GetInstance().GetById(id);
            return oneUser;

        }

        public AdminUser GetUserByUsername(string username) 
        {
            AdminUser oneUser 
                = AdminUserDal.GetInstance().GetByUsername(username);
            return oneUser;

        }

        public void CreateAdminUser(AdminUser adminUser) 
        {
    
            AdminUserDal.GetInstance().Create(adminUser);

        }

        public void UpdateAdminUser(AdminUser adminUser) 
        {
    
            AdminUserDal.GetInstance().Update(adminUser);

        }

        public void DeleteAdminUser(long id) 
        {
            AdminUserDal.GetInstance().Delete(id);
        }

	}
}
