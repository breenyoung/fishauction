using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for PortBcl.
	/// </summary>
	public class PortBcl
	{

        private static PortBcl myInstance = null;

        public static PortBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new PortBcl();
            }

            return myInstance;

        }


		private PortBcl()
		{
		}

        public Port GetPortById(int id) 
        {
            Port port = PortDal.GetInstance().GetById(id);
            return port;
        }

        public ArrayList GetAllPorts() 
        {
            ArrayList all = PortDal.GetInstance().GetAll();
            return all;
        }


	}
}
