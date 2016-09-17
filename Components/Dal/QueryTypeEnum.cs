using System;

namespace Components.Dal
{
	/// <summary>
	/// Summary description for QueryTypeEnum.
	/// </summary>
	public class QueryTypeEnum
	{
        public static readonly QueryTypeEnum RETURN = new QueryTypeEnum(1,"RETURN");
        public static readonly QueryTypeEnum NONQUERY = new QueryTypeEnum(2,"NONQUERY");

        private int id;
        private string name;

        public QueryTypeEnum(int id, string name)
        {
            this.id = id;
            this.name = name;
        }

        public int Id 
        {
            get{return this.id;}
        }

        public override bool Equals(object obj)
        {
            if( obj is QueryTypeEnum ) 
            {
                if(((QueryTypeEnum)obj).Id == this.Id)
                {
                    return true;
                }
            }

            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode ();
        }
    }
}
