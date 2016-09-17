using System;
using System.Collections;

using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for VesselBcl.
	/// </summary>
	public class VesselBcl
	{

        private static VesselBcl myInstance = null;

        public static VesselBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new VesselBcl();
            }

            return myInstance;

        }

		private VesselBcl()
		{
		}

        public Vessel GetVesselById(long id) 
        {
            Vessel oneVessel = VesselDal.GetInstance().GetById(id);
            return oneVessel;
        }

        public Vessel GetVesselByCfv(int cfv) 
        {
            Vessel oneVessel = VesselDal.GetInstance().GetByCfv(cfv);
            return oneVessel;
        }

        public ArrayList GetVesselByName(string name) 
        {
            ArrayList vessels = VesselDal.GetInstance().GetByName(name);
            return vessels;
        }


        public void CreateVessel(Vessel vessel) 
        {
            VesselDal.GetInstance().Create(vessel);
        }

        public void UpdateVessel(Vessel vessel) 
        {
            VesselDal.GetInstance().Update(vessel);
        }

        public void DeleteVessel(long vesselId) 
        {
            VesselDal.GetInstance().Delete(vesselId);
        }



	}
}
