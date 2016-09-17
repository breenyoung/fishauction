using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for SupplyBcl.
	/// </summary>
	public class SupplyBcl
	{

        private static SupplyBcl myInstance = null;

        public static SupplyBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new SupplyBcl();
            }

            return myInstance;

        }

		private SupplyBcl()
		{
		}

        public Supply GetSupplyById(short id) 
        {
            Supply supply = SupplyDal.GetInstance().GetById(id);
            return supply;
        }

        public ArrayList GetAllSupplies() 
        {
            ArrayList all = SupplyDal.GetInstance().GetAll();
            return all;
        }



	}
}
