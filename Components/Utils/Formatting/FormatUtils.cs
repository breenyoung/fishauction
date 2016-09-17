using System;

namespace Components.Utils.Formatting
{
	/// <summary>
	/// Summary description for FormatUtils.
	/// </summary>
	public class FormatUtils
	{
		public FormatUtils()
		{
			//
			// TODO: Add constructor logic here
			//
		}

        public static string FormatCommas(int theNum) 
        {            
            if(theNum > 0) 
            {
                return String.Format("{0:0,0}",theNum);
            } 
            else 
            {
                return theNum.ToString();
            }

        }

        public static string FormatOneDecimal(int theNum) 
        {
            return String.Format("{0:0.0}",theNum);
        }

        public static string FormatTwoDecimal(int theNum) 
        {
            return String.Format("{0:0.00}",theNum);
        }

        public static string FormatThreeDecimal(float theNum) 
        {
            return String.Format("{0:0.000}",theNum);
        }

        public static DateTime ToNSTTime(DateTime theDate) 
        {

            DateTime nst = theDate.Subtract(new TimeSpan(2,30,0));
            return nst; 
        }

        public static string FormatTransactionId(string id) 
        {
            return id.PadLeft(6,'0');
        }

        public static string FormatHighBid(string bid) 
        {
            if(bid.IndexOf(".") != -1) 
            {
                return bid.PadRight(5,'0');
            } 
            else 
            {
                // Whole number
                return bid + ".000";
            }
        }

        public static string FormatMoney(decimal theNum) 
        {
            return String.Format("{0:c}",theNum);
        }
	}
}
