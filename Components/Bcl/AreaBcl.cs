using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for AreaBcl.
	/// </summary>
	public class AreaBcl
	{
        private static AreaBcl myInstance = null;

        public static AreaBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AreaBcl();
            }

            return myInstance;

        }


		private AreaBcl()
		{
		}

        public Area GetAreaById(int id) 
        {
            Area area = AreaDal.GetInstance().GetById(id);
            return area;
        }

        public ArrayList GetAllAreas() 
        {
            ArrayList all = AreaDal.GetInstance().GetAll();
            return all;
        }

	}
}
