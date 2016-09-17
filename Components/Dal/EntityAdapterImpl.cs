using System;
using System.Data.SqlClient;
using System.Collections;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for EntityAdapterImpl.
	/// </summary>
        public delegate void 
            RelationDelegate(ICollection results);

        public abstract class EntityAdapterImpl : EntityAdapter
        {
            public static QueryTypeEnum RETURN = QueryTypeEnum.RETURN;
            public static QueryTypeEnum NONQUERY = QueryTypeEnum.NONQUERY;

            protected SqlParameter[] myParams = null;
            protected string storedProc = null;
            protected QueryTypeEnum queryType = null;

            protected EntityAdapterImpl() {}

            public EntityAdapterImpl(string storedProc, SqlParameter[] myParams, QueryTypeEnum queryType)
            {
                this.storedProc = storedProc;
                this.myParams = myParams;
                this.queryType = queryType;
            }

            public QueryTypeEnum Return 
            {
                get{return RETURN;}
            }

            public string GetStoredProc() 
            {
                return this.storedProc;
            }
            public SqlParameter[] GetParams() 
            {
                return this.myParams;
            }
            public QueryTypeEnum GetQueryType() 
            {
                return this.queryType;
            }

            public abstract ICollection GetResults(SqlDataReader dataReader);
        }
    }
