using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Components.Entities;
using Components.Bcl;
using Components.Utils.Formatting;

namespace WebApp.Buyers
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{

        protected System.Web.UI.WebControls.Label lblTimeLeft;
        protected System.Web.UI.WebControls.Label lblLiveAuctions;
        protected System.Web.UI.WebControls.Label lblToday;
        protected System.Web.UI.WebControls.Label lblName;
        protected System.Web.UI.WebControls.Label lblProcName;
        protected System.Web.UI.WebControls.Label lblProcLocation;


		private void Page_Load(object sender, System.EventArgs e)
		{

            DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);


            lblToday.Text = String.Format("{0:MM/dd/yyyy HH:mm}",today) + " NST";
                        

            // Auction time is 8-6pm(8-18) daily 
            string hoursMins = today.Hour.ToString() + "." + today.Minute.ToString();
            double timeLeft = 18.00 - (double.Parse(hoursMins));

            if(today.Hour < 8) 
            {
                lblTimeLeft.Text = "Auction day has ended";

                // Dont show any active auctions once day is closed
                lblLiveAuctions.Text = "0";

            } 
            else 
            {

                if(timeLeft < 0) 
                {
                    lblTimeLeft.Text = "Auction day has ended";

                    // Dont show any active auctions once day is closed
                    lblLiveAuctions.Text = "0";

                } 
                else 
                {
                    lblTimeLeft.Text = "Auction day expires in: " + String.Format("{0:0.00}",timeLeft) + " hours";

                    // Get current live auctions
                    AuctionBcl auctionBcl = AuctionBcl.GetInstance();
                    int activeAuctions = auctionBcl.GetActiveAuctionCount();
                    lblLiveAuctions.Text = activeAuctions.ToString();

                }      

            }

            // Get current logged in user
            if(Page.User.Identity.IsAuthenticated) 
            {
                // Buyer logged in, look them up
                long userId = long.Parse(Page.User.Identity.Name);
                Buyer curBuyer = BuyerBcl.GetInstance().GetUserById(userId);
                Processor processor 
                    = ProcessorBcl.GetInstance().GetProcessorById(curBuyer.ProcessorId);

                lblName.Text = curBuyer.FirstName + " " + curBuyer.LastName;
                lblProcName.Text = processor.Name;
                lblProcLocation.Text = processor.Location;

            } 


        
        }

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}
}
