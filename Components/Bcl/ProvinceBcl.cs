using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for ProvinceBcl.
	/// </summary>
	public class ProvinceBcl
	{

        private static ProvinceBcl myInstance = null;

        public static ProvinceBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new ProvinceBcl();
            }

            return myInstance;

        }

		private ProvinceBcl()
		{
		}

        public Province GetProvinceById(short id) 
        {
            Province prov = ProvinceDal.GetInstance().GetById(id);
            return prov;
        }

        public ArrayList GetAllProvinces() 
        {
            ArrayList all = ProvinceDal.GetInstance().GetAll();
            return all;
        }
	}
}
