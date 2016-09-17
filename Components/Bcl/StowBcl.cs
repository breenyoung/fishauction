using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for StowBcl.
	/// </summary>
	public class StowBcl
	{

        private static StowBcl myInstance = null;

        public static StowBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new StowBcl();
            }

            return myInstance;

        }

		private StowBcl()
		{
		}

        public Stow GetStowById(int id) 
        {
            Stow stow = StowDal.GetInstance().GetById(id);
            return stow;
        }

        public ArrayList GetAllStow() 
        {
            ArrayList all = StowDal.GetInstance().GetAll();
            return all;
        }


	}
}
