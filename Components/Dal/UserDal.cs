using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Components.Entities;
using Microsoft.ApplicationBlocks.Data;
//using ByteFX.Data.MySqlClient;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for UserDal.
	/// </summary>
	public class UserDal
	{

        private static readonly string TABLE_NAME = "Buyers" ;
        private static readonly string SP_GETBYID = "BuyersGetById";
        private static readonly string SP_GETBYUSERNAME = "BuyersGetByUsername";
        private static readonly string SP_GETSPECIESBYUSERID = "BuyersGetSpeciesByBuyerId";
        private static readonly string SP_CREATE = "BuyersCreate";
        private static readonly string SP_UPDATE = "BuyersUpdate";
        private static readonly string SP_DELETE = "BuyersDelete";

        private static UserDal myInstance = null;

        public static UserDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new UserDal();
            }

            return myInstance;

        }

		private UserDal()
		{
		}

        public User GetById(long id) 
        {

            User user = new User();

            //MySqlConnection conn = DalUtils.GetInstance().getConnection();
            //DataSet ds = MySqlHelper.ExecuteDataset(conn, SQL_GETBYID);

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
                        user = ConstructObject(oneRow);

                    }
                }

                return user;
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

        public User GetByUsername(string username) 
        {

            User user = new User();

            SqlConnection conn = null;
            try 
            {

                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter[] theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@USERNAME",username);
                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETBYUSERNAME, theParams);

                if(ds != null) 
                {
                
                    if(ds.Tables[0].Rows.Count > 0) 
                    {
                        DataRow oneRow = ds.Tables[0].Rows[0];
                        user = ConstructObject(oneRow);

                    }
                }

                return user;
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


        public ArrayList GetSpeciesForUser(long userId) 
        {
    
            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@BUYERID", userId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETSPECIESBYUSERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        UserSpecies oneUserSpecies = new UserSpecies();
                        oneUserSpecies.Id = (int)row["id"];
                        oneUserSpecies.BuyerId = (long)row["buyerid"];
                        oneUserSpecies.SpeciesId = (int)row["speciesid"];
                        
                        all.Add(oneUserSpecies);

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

        public void Create(User user) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(false, user);
                /*
                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@FIRSTNAME", user.FirstName),
                    new SqlParameter("@LASTNAME", user.LastName),
                    new SqlParameter("@USERNAME", user.Username),
                    new SqlParameter("@PASSWORD", user.Password),
                    new SqlParameter("@ADDRESS1", user.Address1),
                    new SqlParameter("@ADDRESS2", user.Address2),
                    new SqlParameter("@CITY", user.City),
                    new SqlParameter("@PROVINCE", user.Province),
                    new SqlParameter("@POSTALCODE", user.PostalCode),
                    new SqlParameter("@PHONE1", user.Phone1),
                    new SqlParameter("@PHONE2", user.Phone2),
                    new SqlParameter("@FAX", user.Fax),
                    new SqlParameter("@CELLPHONE", user.CellPhone),
                    new SqlParameter("@EMAIL", user.Email),
                    new SqlParameter("@PROCESSORID", user.ProcessorId)

                };
                */

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

        public void Update(User user) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(true, user);
                /*
                SqlParameter[] theParams = new SqlParameter[]
                {
                    new SqlParameter("@ID", user.Id),
                    new SqlParameter("@FIRSTNAME", user.FirstName),
                    new SqlParameter("@LASTNAME", user.LastName),
                    new SqlParameter("@USERNAME", user.Username),
                    new SqlParameter("@PASSWORD", user.Password),
                    new SqlParameter("@ADDRESS1", user.Address1),
                    new SqlParameter("@ADDRESS2", user.Address2),
                    new SqlParameter("@CITY", user.City),
                    new SqlParameter("@PROVINCE", user.Province),
                    new SqlParameter("@POSTALCODE", user.PostalCode),
                    new SqlParameter("@PHONE1", user.Phone1),
                    new SqlParameter("@PHONE2", user.Phone2),
                    new SqlParameter("@FAX", user.Fax),
                    new SqlParameter("@CELLPHONE", user.CellPhone),
                    new SqlParameter("@EMAIL", user.Email),
                    new SqlParameter("@PROCESSORID", user.ProcessorId)

                };
                */

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

        private User ConstructObject(DataRow oneRow) 
        {

            User user = new User();
            user.Id = (long)oneRow["id"];
            user.FirstName = (string)oneRow["firstname"];
            user.LastName = (string)oneRow["lastname"];
            user.Address1 = (string)oneRow["address1"];
            user.Address2 = (string)oneRow["address1"];
            user.City = (string)oneRow["city"];
            user.Province = (int)oneRow["province"];
            user.PostalCode = (string)oneRow["postalcode"];
            user.Phone1 = (string)oneRow["phone1"];
            user.Phone2 = (string)oneRow["phone2"];
            user.Fax = (string)oneRow["fax"];
            user.CellPhone = (string)oneRow["cellphone"];
            user.Email = (string)oneRow["email"];
            user.Username = (string)oneRow["username"];
            user.Password = (string)oneRow["password"];
            user.ProcessorId = (int)oneRow["processorid"];

            return user;
        }

        private SqlParameter[] ConstructParameters(bool isUpdate, User user) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[16];
                theParams[x] = new SqlParameter("@ID", user.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[15];
            }

            theParams[x++] = new SqlParameter("@FIRSTNAME", user.FirstName);
            theParams[x++] = new SqlParameter("@LASTNAME", user.LastName);
            theParams[x++] = new SqlParameter("@USERNAME", user.Username);
            theParams[x++] = new SqlParameter("@PASSWORD", user.Password);
            theParams[x++] = new SqlParameter("@ADDRESS1", user.Address1);
            theParams[x++] = new SqlParameter("@ADDRESS2", user.Address2);
            theParams[x++] = new SqlParameter("@CITY", user.City);
            theParams[x++] = new SqlParameter("@PROVINCE", user.Province);
            theParams[x++] = new SqlParameter("@POSTALCODE", user.PostalCode);
            theParams[x++] = new SqlParameter("@PHONE1", user.Phone1);
            theParams[x++] = new SqlParameter("@PHONE2", user.Phone2);
            theParams[x++] = new SqlParameter("@FAX", user.Fax);
            theParams[x++] = new SqlParameter("@CELLPHONE", user.CellPhone);
            theParams[x++] = new SqlParameter("@EMAIL", user.Email);
            theParams[x++] = new SqlParameter("@PROCESSORID", user.ProcessorId);

            return theParams;

        }


	}
}
