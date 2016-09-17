using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for TripBcl.
	/// </summary>
	public class TripBcl
	{

        private static TripBcl myInstance = null;

        public static TripBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new TripBcl();
            }

            return myInstance;

        }

		private TripBcl()
		{
		}

        public Trip GetTripById(long id) 
        {
            Trip oneTrip = TripDal.GetInstance().GetById(id);
            return oneTrip;
        }

        public Trip GetTripByLotId(long lotId) 
        {
            Trip oneTrip = TripDal.GetInstance().GetByLotId(lotId);
            return oneTrip;
        }

        public ArrayList GetTripByVesselId(long vesselId) 
        {
            ArrayList trips = TripDal.GetInstance().GetByVesselId(vesselId);
            return trips;
        }

        public ArrayList GetOpenTrips() 
        {
            ArrayList trips = TripDal.GetInstance().GetOpenTrips();
            return trips;
        }

        public ArrayList GetTripPorts(long tripId) 
        {
            ArrayList ports 
                = TripDal.GetInstance().GetTripPorts(tripId);

            return ports;
        }


        public void CreateTrip(Trip trip) 
        {
            TripDal.GetInstance().Create(trip);
        }

        public void UpdateTrip(Trip trip) 
        {
            TripDal.GetInstance().Update(trip);
        }

        public void DeleteTrip(long id) 
        {
            TripDal.GetInstance().Delete(id);
        }

        public void CreateTripPort(TripPort tripPort) 
        {
            TripDal.GetInstance().CreateTripPort(tripPort);
        }

        public void UpdateTripPort(TripPort tripPort) 
        {
            TripDal.GetInstance().UpdateTripPort(tripPort);
        }

        public void DeleteTripPort(long tripId, int portId) 
        {
            TripDal.GetInstance().DeleteTripPort(tripId, portId);
        }



	}
}
