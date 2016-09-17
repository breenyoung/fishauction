using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Components.Entities;
using Microsoft.ApplicationBlocks.Data;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for TripBcl.
	/// </summary>
	public class TripDal
	{

        private static readonly string TABLE_NAME = "Trips" ;
        private static readonly string SP_GETBYID = "TripsGetById";
        private static readonly string SP_GETBYLOTID = "TripsGetByLotId";
        private static readonly string SP_GETBYVESSELID = "TripsGetByVesselId";
        private static readonly string SP_GETOPENTRIPS = "TripsGetOpenTrips";
        private static readonly string SP_CREATE = "TripsCreate";
        private static readonly string SP_UPDATE = "TripsUpdate";
        private static readonly string SP_DELETE = "TripsDelete";

        private static readonly string CS_TABLE_NAME = "TripPorts" ;
        private static readonly string SP_TP_GETBYCATCHID = "TripPortsGetByTripId";
        private static readonly string SP_TP_CREATE = "TripPortsCreate";
        private static readonly string SP_TP_UPDATE = "TripPortsUpdate";
        private static readonly string SP_TP_DELETE = "TripPortsDelete";


        private static TripDal myInstance = null;

        public static TripDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new TripDal();
            }

            return myInstance;

        }

		private TripDal()
		{
		}

        public Trip GetById(long id) 
        {

            Trip trip = new Trip();

            SqlConnection conn = null;
            try 
            {

                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@ID",id);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYID, theParams);

                if(ds != null) 
                {
                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        trip = ConstructObject(oneRow);
                        return trip;
                    } 
                }
                return null;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            } 
            finally 
            {
                if(conn != null) { conn.Close(); }
            }
        }

        public Trip GetByLotId(long lotId) 
        {

            Trip trip = new Trip();

            SqlConnection conn = null;
            try 
            {

                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@LOTID",lotId);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYLOTID, theParams);

                if(ds != null) 
                {
                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        trip = ConstructObject(oneRow);
                        return trip;
                    } 
                }
                return null;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            } 
            finally 
            {
                if(conn != null) { conn.Close(); }
            }
        }


        public ArrayList GetByVesselId(long vesselId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@VESSELID", vesselId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYVESSELID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Trip oneTrip = ConstructObject(row);
                        
                        all.Add(oneTrip);

                    }

                }

                return all;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }


        }

        public ArrayList GetOpenTrips() 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETOPENTRIPS);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        Trip oneTrip = ConstructObject(row);
                        
                        all.Add(oneTrip);

                    }

                }

                return all;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }


        }


        public ArrayList GetTripPorts(long tripId) 
        {


            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@TRIPID", tripId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_TP_GETBYCATCHID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        TripPort oneTP = ConstructTPObject(row);
                        
                        all.Add(oneTP);

                    }

                }

                return all;

            } 
            catch(Exception e) 
            {
                throw new ApplicationException(e.Message);
            }
            finally 
            {
                if(conn != null) { conn.Close(); }
            }


        }


        public void Create(Trip trip) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(false, trip);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_CREATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }

        public void CreateTripPort(TripPort tripPort) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructTPParameters(tripPort);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_TP_CREATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }


        public void Update(Trip trip) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(true, trip);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_UPDATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }



        }

        public void UpdateTripPort(TripPort tripPort) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructTPParameters(tripPort);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_TP_UPDATE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }

        }


        public void Delete(long id) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@ID", id)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_DELETE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }

        public void DeleteTripPort(long tripId,int portId) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@TRIPID", tripId),
                    new SqlParameter("@PORTID", portId)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_TP_DELETE, theParams);


                trans.Commit();
            } 
            catch(Exception e) 
            {
                trans.Rollback();
                throw new ApplicationException(e.Message);
            } 
            finally 
            {               
                if(conn != null) { conn.Close(); }
            }


        }


        private Trip ConstructObject(DataRow oneRow) 
        {

            Trip trip = new Trip();
            trip.Id = (long)oneRow["id"];
            trip.VesselId = (long)oneRow["vesselid"];
            if(!oneRow.IsNull("lotid")) 
            {
                trip.LotId = (long)oneRow["lotid"];
            }
            
            trip.HailOutDate = (DateTime)oneRow["hailoutdate"];
            if(!oneRow.IsNull("daysout")) 
            {
                trip.DaysOut = (decimal)oneRow["daysout"];
            }

            trip.Eta = (DateTime)oneRow["eta"];
            if(!oneRow["hailindate"].ToString().Equals("")) 
            {
                trip.HailInDate = (DateTime)oneRow["hailindate"];
            }
            trip.SpecialInstructions = oneRow["specialinstructions"].ToString();
            trip.Area = (int)oneRow["areaid"];

            // Get ports for trip
            ArrayList ports = GetTripPorts(trip.Id);
            trip.Ports = ports;

            return trip;
        }

        private TripPort ConstructTPObject(DataRow oneRow) 
        {

            TripPort tripPort = new TripPort();
            tripPort.TripId = (long)oneRow["tripid"];
            tripPort.PortId = (int)oneRow["portid"];
            tripPort.Alternate = (byte)oneRow["alternate"];
            tripPort.IsZone = (bool)oneRow["iszone"];

            return tripPort;
        }


        private SqlParameter[] ConstructParameters(bool isUpdate, Trip trip) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[9];
                theParams[x] = new SqlParameter("@ID", trip.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[8];
            }

            theParams[x++] = new SqlParameter("@VESSELID", trip.VesselId);
            theParams[x++] = new SqlParameter("@LOTID", trip.LotId);
            theParams[x++] = new SqlParameter("@HAILOUTDATE", trip.HailOutDate);
            theParams[x++] = new SqlParameter("@DAYSOUT", trip.DaysOut);
            theParams[x++] = new SqlParameter("@ETA", trip.Eta);
            theParams[x++] = new SqlParameter("@HAILINDATE", trip.HailInDate);
            theParams[x++] = new SqlParameter("@SPECIALINSTRUCTIONS", trip.SpecialInstructions);
            theParams[x++] = new SqlParameter("@AREAID", trip.Area);

            return theParams;

        }

        private SqlParameter[] ConstructTPParameters(TripPort tripPort) 
        {

            SqlParameter[] theParams = null;
            theParams = new SqlParameter[4];
            theParams[0] = new SqlParameter("@TRIPID", tripPort.TripId);
            theParams[1] = new SqlParameter("@PORTID", tripPort.PortId);
            theParams[2] = new SqlParameter("@ALTERNATE", tripPort.Alternate);
            theParams[3] = new SqlParameter("@ISZONE", tripPort.IsZone);

            return theParams;

        }


	}
}
