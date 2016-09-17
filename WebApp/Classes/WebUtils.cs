using System;
using System.Web;

using Components.Bcl;
using Components.Entities;
using Components.Utils.Formatting;

namespace WebApp.Classes
{
	/// <summary>
	/// Summary description for WebUtils.
	/// </summary>
	public class WebUtils
	{
		public WebUtils()
		{
                        
        }

        public static bool CanProcTrade() 
        {
            if(HttpContext.Current.User.Identity.IsAuthenticated) 
            {

                // Buyer logged in, look them up
                long userId = long.Parse(HttpContext.Current.User.Identity.Name);
                Buyer curBuyer = BuyerBcl.GetInstance().GetUserById(userId);
                Processor processor 
                    = ProcessorBcl.GetInstance().GetProcessorById(curBuyer.ProcessorId);

                return processor.IsTrading;

            }

            return false;

        }

        public static bool IsAuctionDayOver() 
        {

            DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                        
            // Auction time is 8-6pm(8-18) daily 
            //return false; // FOR DEBUG

            if(today.Hour < 8) 
            {
                // Before 8, hasnt begun
                return true;
            } 
            else 
            {
                string hoursMins = today.Hour.ToString() + "." + today.Minute.ToString();
                double timeLeft = 18.00 - (double.Parse(hoursMins));

            
                if(timeLeft < 0) 
                {
                    return true;
                } 
                else 
                {
                    return false;
                }  
               
            }


        }

	}
}
