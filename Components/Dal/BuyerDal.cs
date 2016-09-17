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
    /// Summary description for BuyerDal.
    /// </summary>
    public class BuyerDal
    {

        private static readonly string TABLE_NAME = "Buyers" ;
        private static readonly string SP_GETBYID = "BuyersGetById";
        private static readonly string SP_GETBYUSERNAME = "BuyersGetByUsername";
        private static readonly string SP_GETSPECIESBYUSERID = "BuyersGetSpeciesByBuyerId";
        private static readonly string SP_CREATE = "BuyersCreate";
        private static readonly string SP_UPDATE = "BuyersUpdate";
        private static readonly string SP_DELETE = "BuyersDelete";

        private static readonly string BS_TABLE_NAME = "BuyerSpecies" ;
        private static readonly string SP_BS_CREATE = "BuyerSpeciesCreate";
        private static readonly string SP_BS_DELETE = "BuyerSpeciesDelete";


        private static BuyerDal myInstance = null;

        public static BuyerDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new BuyerDal();
            }

            return myInstance;

        }

        private BuyerDal()
        {
        }

        public Buyer GetById(long id) 
        {

            Buyer buyer = new Buyer();

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
                        buyer = ConstructObject(oneRow);
                        return buyer;
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

        public Buyer GetByUsername(string username) 
        {

            Buyer buyer = new Buyer();

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
                        buyer = ConstructObject(oneRow);
                        return buyer;
                    } 
                    else 
                    {
                        return null;
                    }
                }

                return buyer;
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


        public ArrayList GetSpeciesForBuyer(long buyerId) 
        {
    
            ArrayList all = new ArrayList();
            SqlConnection conn = null;

            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();

                SqlParameter []theParams = new SqlParameter[1];
                theParams[0] = new SqlParameter("@BUYERID", buyerId);

                DataSet ds = SqlHelper.ExecuteDataset(conn, 
                    System.Data.CommandType.StoredProcedure,
                    SP_GETSPECIESBYUSERID,theParams);

                if(ds != null) 
                {

                    foreach (DataRow row in ds.Tables[0].Rows) 
                    {
                        BuyerSpecies oneBuyerSpecies = new BuyerSpecies();
                        oneBuyerSpecies.BuyerId = (long)row["buyerid"];
                        oneBuyerSpecies.SpeciesId = (int)row["speciesid"];
                        
                        all.Add(oneBuyerSpecies);

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

        public void Create(Buyer buyer) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(false, buyer);
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


        public void CreateBuyerSpecies(BuyerSpecies buyerSpecies) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructBSParameters(buyerSpecies);

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_BS_CREATE, theParams);


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

        
        public void Update(Buyer buyer) 
        {

            SqlConnection conn = null;
            SqlTransaction trans = null;
            try 
            {
                conn = DalUtils.GetInstance().getConnection();
                conn.Open();
                trans = conn.BeginTransaction();

                SqlParameter[] theParams = ConstructParameters(true, buyer);
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

        public void DeleteBuyerSpecies(long buyerId, int speciesId) 
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
                    new SqlParameter("@BUYERID", buyerId),
                    new SqlParameter("@SPECIESID", speciesId)
                };

                int result = SqlHelper.ExecuteNonQuery(trans, 
                    System.Data.CommandType.StoredProcedure, 
                    SP_BS_DELETE, theParams);


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

        
        private Buyer ConstructObject(DataRow oneRow) 
        {

            Buyer buyer = new Buyer();
            buyer.Id = (long)oneRow["id"];
            buyer.FirstName = oneRow["firstname"].ToString();
            buyer.LastName = oneRow["lastname"].ToString();
            buyer.Address1 = oneRow["address1"].ToString();
            buyer.Address2 = oneRow["address2"].ToString();
            buyer.City = oneRow["city"].ToString();
            buyer.Province = (byte)oneRow["provinceid"];
            buyer.PostalCode = oneRow["pc"].ToString();
            buyer.Phone1 = oneRow["phone1"].ToString();
            buyer.Phone2 = oneRow["phone2"].ToString();
            buyer.Fax = oneRow["fax"].ToString();
            buyer.CellPhone = oneRow["cell"].ToString();
            buyer.Email = oneRow["email"].ToString();
            buyer.Username = oneRow["username"].ToString();
            buyer.Password = oneRow["password"].ToString();
            buyer.ProcessorId = (int)oneRow["processorid"];

            // Get Buyer Species for this buyer
            // *** THIS GOES IN LATER WHEN THERE IS MORE THEN 1 SPECIES!***
            //ArrayList buyerSpecies = GetSpeciesForBuyer(buyer.Id);
            //buyer.BuyerSpeciesList = buyerSpecies;

            return buyer;
        }

        private SqlParameter[] ConstructParameters(bool isUpdate, Buyer buyer) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[17];
                theParams[x] = new SqlParameter("@ID", buyer.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[16];
            }

            theParams[x++] = new SqlParameter("@CORPNAME", buyer.CorpName);
            theParams[x++] = new SqlParameter("@FIRSTNAME", buyer.FirstName);
            theParams[x++] = new SqlParameter("@LASTNAME", buyer.LastName);
            theParams[x++] = new SqlParameter("@USERNAME", buyer.Username);
            theParams[x++] = new SqlParameter("@PASSWORD", buyer.Password);
            theParams[x++] = new SqlParameter("@ADDRESS1", buyer.Address1);
            theParams[x++] = new SqlParameter("@ADDRESS2", buyer.Address2);
            theParams[x++] = new SqlParameter("@CITY", buyer.City);
            theParams[x++] = new SqlParameter("@PROVINCE", buyer.Province);
            theParams[x++] = new SqlParameter("@POSTALCODE", buyer.PostalCode);
            theParams[x++] = new SqlParameter("@PHONE1", buyer.Phone1);
            theParams[x++] = new SqlParameter("@PHONE2", buyer.Phone2);
            theParams[x++] = new SqlParameter("@FAX", buyer.Fax);
            theParams[x++] = new SqlParameter("@CELLPHONE", buyer.CellPhone);
            theParams[x++] = new SqlParameter("@EMAIL", buyer.Email);
            theParams[x++] = new SqlParameter("@PROCESSORID", buyer.ProcessorId);

            return theParams;

        }

        private SqlParameter[] ConstructBSParameters(BuyerSpecies buyerSpecies) 
        {

            SqlParameter[] theParams = null;
            theParams = new SqlParameter[2];
            theParams[0] = new SqlParameter("@BUYERID", buyerSpecies.BuyerId);
            theParams[1] = new SqlParameter("@SPECIESID", buyerSpecies.SpeciesId);

            return theParams;

        }


    }
}
