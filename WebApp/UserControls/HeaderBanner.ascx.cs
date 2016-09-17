namespace WebApp.UserControls
{
	using System;
    using System.Collections;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;


    using Components.Bcl;
    using Components.Entities;
    using Components.Utils.Formatting;

	/// <summary>
	///		Summary description for HeaderBanner.
	/// </summary>
	public class HeaderBanner : System.Web.UI.UserControl
	{
        protected System.Web.UI.WebControls.Label lblBuyerName;
        protected System.Web.UI.WebControls.Label lblBuyerProcessor;
        protected System.Web.UI.WebControls.Label lblBuyerLeadingAuctions;
        protected System.Web.UI.WebControls.Label lblTimeLeft;
        protected System.Web.UI.WebControls.Label lblCurTime;
        protected System.Web.UI.WebControls.Label lblProcLocation;


		private void Page_Load(object sender, System.EventArgs e)
		{

            DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);


            lblCurTime.Text = String.Format("{0:MM/dd/yyyy HH:mm}",today) + " NST";
                        

            // Auction time is 8-6pm(8-18) daily 
            string hoursMins = today.Hour.ToString() + "." + today.Minute.ToString();
            double timeLeft = 18.00 - (double.Parse(hoursMins));

            if(Page.User.Identity.IsAuthenticated) 
            {
                // Buyer logged in, look them up
                long userId = long.Parse(Page.User.Identity.Name);
                Buyer curBuyer = BuyerBcl.GetInstance().GetUserById(userId);
                Processor processor 
                    = ProcessorBcl.GetInstance().GetProcessorById(curBuyer.ProcessorId);

                lblBuyerName.Text = curBuyer.FirstName + " " + curBuyer.LastName;
                lblBuyerProcessor.Text = processor.Name;
                lblProcLocation.Text = processor.Location;

                // Leading Auctions
                BidBcl bidBcl = BidBcl.GetInstance();
                ArrayList winningAuctions 
                    = bidBcl.GetWinningBidsForBuyer(userId);
                lblBuyerLeadingAuctions.Text 
                    = winningAuctions.Count.ToString();


            } 
            


            // Top header details
            if(today.Hour < 8) 
            {
                lblTimeLeft.Text = "Auction day has ended";

            }  
            else 
            {            
                if(timeLeft < 0) 
                {
                    lblTimeLeft.Text = "Auction day has ended";
                } 
                else 
                {
                    lblTimeLeft.Text = "Auction day expires in: " + String.Format("{0:0.00}",timeLeft) + " hours";
                }   
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
		///		Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.Load += new System.EventHandler(this.Page_Load);

        }
		#endregion
	}
}
