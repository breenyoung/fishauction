using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Components.Entities;
using Microsoft.ApplicationBlocks.Data;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for AdminUserDal.
	/// </summary>
	public class AdminUserDal
	{

        private static readonly string TABLE_NAME = "AdminUser" ;
        private static readonly string SP_GETBYID = "AdminUserGetById";
        private static readonly string SP_GETBYUSERNAME = "AdminUserGetByUsername";
        private static readonly string SP_CREATE = "AdminUserCreate";
        private static readonly string SP_UPDATE = "AdminUserUpdate";
        private static readonly string SP_DELETE = "AdminUserDelete";


        private static AdminUserDal myInstance = null;

        public static AdminUserDal GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new AdminUserDal();
            }

            return myInstance;

        }

        private AdminUserDal()
        {
        }

        public AdminUser GetById(long id) 
        {

            AdminUser user = new AdminUser();

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
                        return user;
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


        public AdminUser GetByUsername(string username) 
        {

            AdminUser user = new AdminUser();

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
                        return user;
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
                if(conn != null) {  conn.Close(); }
            }

        }


        public void Create(AdminUser user) 
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
                    new SqlParameter("@CLASSID", user.ClassId),
                    new SqlParameter("@NAME", user.Name),
                    new SqlParameter("@DESC", user.Description),
                    new SqlParameter("@USERNAME", user.Username),
                    new SqlParameter("@PASSWORD", user.Password)
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

        public void Update(AdminUser user) 
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
                    new SqlParameter("@CLASSID", user.ClassId),
                    new SqlParameter("@NAME", user.Name),
                    new SqlParameter("@DESC", user.Description),
                    new SqlParameter("@USERNAME", user.Username),
                    new SqlParameter("@PASSWORD", user.Password)
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

        private AdminUser ConstructObject(DataRow oneRow) 
        {

            AdminUser user = new AdminUser();

            user.Id = (long)oneRow["id"];
            user.Name = (string)oneRow["name"];
            user.Description = (string)oneRow["description"];
            user.Username = (string)oneRow["username"];
            user.Password = (string)oneRow["password"];
            user.ClassId = (int)oneRow["classid"];

            return user;

        }

        private SqlParameter[] ConstructParameters(bool isUpdate, AdminUser user) 
        {

            SqlParameter[] theParams = null;
            int x = 0;
            if(isUpdate) 
            {
                theParams = new SqlParameter[6];
                theParams[x] = new SqlParameter("@ID", user.Id);
                x++;
            } 
            else 
            {
                theParams = new SqlParameter[5];
            }

            theParams[x++] = new SqlParameter("@CLASSID", user.ClassId);
            theParams[x++] = new SqlParameter("@NAME", user.Name);
            theParams[x++] = new SqlParameter("@DESC", user.Description);
            theParams[x++] = new SqlParameter("@USERNAME", user.Username);
            theParams[x++] = new SqlParameter("@PASSWORD", user.Password);


            return theParams;
        }


	}
}
