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

using Components.Bcl;
using Components.Entities;
using Components.Utils.Formatting;

namespace WebApp.Auctions
{
	/// <summary>
	/// Summary description for auctionDetails.
	/// </summary>
	public class auctionDetails : System.Web.UI.Page
	{

        private static readonly string OUTBID_MSG = "Your bid is not higher than the current bid. Please recalculate your offer.";

        protected UserControls.Auction.AuctionDetails ucAuctionDetails;
        protected UserControls.Auction.AuctionConfirm ucAuctionConfirm;
        protected UserControls.Auction.AuctionSuccess ucAuctionSuccess;


		private void Page_Load(object sender, System.EventArgs e)
		{

            if(IsPostBack) 
            {              

                if(ucAuctionDetails.Visible) 
                {
                    Page.Validate();
                    if(Page.IsValid) 
                    {
                        ucAuctionConfirm.PricePerSmallGrade = float.Parse(Request.Params["ucAuctionDetails:tbSmallGradeAmt"]);
                        ucAuctionConfirm.PricePerMediumGrade = float.Parse(Request.Params["ucAuctionDetails:tbMediumGradeAmt"]);
                        ucAuctionConfirm.PricePerLargeGrade = float.Parse(Request.Params["ucAuctionDetails:tbLargeGradeAmt"]);
                        ucAuctionConfirm.PricePerXLGrade = float.Parse(Request.Params["ucAuctionDetails:tbXLGradeAmt"]);
                        ucAuctionConfirm.PortSelected = Int32.Parse(Request.Params["ucAuctionDetails:ddlTripPorts"]);
                        ucAuctionConfirm.CatchId = Int64.Parse(Request.Params["ucAuctionDetails:tbCatchId"]);
                        ucAuctionConfirm.BidTotal = Decimal.Parse(Request.Params["ucAuctionDetails:tbBidTotal"]);
                        ucAuctionConfirm.AuctionId = Int64.Parse(Request.Params["ucAuctionDetails:tbAuctionId"]);
                        ucAuctionConfirm.AvgPerLb = float.Parse(Request.Params["ucAuctionDetails:tbBidAverage"]);
                        
                        BidBcl bidBcl = BidBcl.GetInstance();
                        float bidAvgPrice = float.Parse(Request.Params["ucAuctionDetails:tbBidAverage"]);

                        if(!bidBcl.IsHighBid(ucAuctionConfirm.AuctionId, bidAvgPrice)) 
                        {
                            ucAuctionDetails.SetOutBidMsg(OUTBID_MSG);
                            ucAuctionDetails.RefreshHighBid(ucAuctionConfirm.AuctionId);
                        } 
                        else 
                        {
                            ucAuctionDetails.SetOutBidMsg("");

                            // Custom visible flags
                            ucAuctionDetails.IsVisible = false;
                            ucAuctionConfirm.IsVisible = true;

                            ucAuctionDetails.Visible = false;

                            ucAuctionConfirm.LoadControlValues();
                            ucAuctionConfirm.Visible = true;                    

                        }
                    }
                } 
                else if(ucAuctionConfirm.Visible) 
                {                    
                    if(Request.Params["ucAuctionConfirm:EDITSTEP"].Equals("YES")) 
                    {
                        // Edit Bid
                        ucAuctionConfirm.Visible = false;
                        ucAuctionDetails.Visible = true;                        
                    }
                    else if(Request.Params["ucAuctionConfirm:EDITSTEP"].Equals("CANCEL")) 
                    {
                        // Cancelled Bid
                        Response.Redirect("/Auctions/");
                    }
                    else 
                    {


                        // Place bid

                        BidBcl bidBcl = BidBcl.GetInstance();

                        Bid newBid = new Bid();
                        newBid.AuctionId = Int64.Parse(Request.Params["ucAuctionConfirm:tbAuctionId"]);

                        // Get userId from session
                        if(Page.User.Identity.IsAuthenticated) 
                        {                            
                            newBid.BuyerId = long.Parse(Page.User.Identity.Name);
                        } 

                        newBid.BidDate = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                        newBid.BidPrice = Decimal.Parse(Request.Params["ucAuctionConfirm:tbTotalBid"]);
                        newBid.SelectedPort = Int32.Parse(Request.Params["ucAuctionConfirm:tbPort"]);
                        newBid.SmallGrade = float.Parse(Request.Params["ucAuctionConfirm:tbSGrade"]);
                        newBid.MediumGrade = float.Parse(Request.Params["ucAuctionConfirm:tbMGrade"]);
                        newBid.LargeGrade = float.Parse(Request.Params["ucAuctionConfirm:tbLGrade"]);
                        newBid.XLGrade = float.Parse(Request.Params["ucAuctionConfirm:tbXGrade"]);
                        newBid.AvgPerLb = float.Parse(Request.Params["ucAuctionConfirm:tbTotalAvg"]);

                        bool bidSuccess = bidBcl.CreateBid(newBid);
                        //bool bidSuccess = true;
                        if(bidSuccess) 
                        {
                            ucAuctionSuccess.AvgPerLb = float.Parse(Request.Params["ucAuctionConfirm:tbTotalAvg"]);
                            ucAuctionSuccess.BidTotal = Decimal.Parse(Request.Params["ucAuctionConfirm:tbTotalBid"]);
                            ucAuctionSuccess.PricePerSmallGrade = float.Parse(Request.Params["ucAuctionConfirm:tbSGrade"]);
                            ucAuctionSuccess.PricePerMediumGrade = float.Parse(Request.Params["ucAuctionConfirm:tbMGrade"]);
                            ucAuctionSuccess.PricePerLargeGrade = float.Parse(Request.Params["ucAuctionConfirm:tbLGrade"]);
                            ucAuctionSuccess.PricePerXLGrade = float.Parse(Request.Params["ucAuctionConfirm:tbXGrade"]);
                            ucAuctionSuccess.AuctionId = Int64.Parse(Request.Params["ucAuctionConfirm:tbAuctionId"]);
                            ucAuctionSuccess.PortSelected = Int32.Parse(Request.Params["ucAuctionConfirm:tbPort"]);                            

                            ucAuctionSuccess.LoadControlValues();

                            ucAuctionConfirm.Visible = false;
                            ucAuctionSuccess.Visible = true;

                            // Send an email out
                        } 
                        else 
                        {
                            // Outbid
                            ucAuctionDetails.RefreshHighBid(newBid.AuctionId);
                            ucAuctionDetails.SetOutBidMsg(OUTBID_MSG);
                            ucAuctionDetails.Visible = true;
                            ucAuctionConfirm.Visible = false;

                        }
                    }
                }
            } 
            else  
            {
                // Custom visible flags
                ucAuctionDetails.IsVisible = true;
                ucAuctionConfirm.IsVisible = false;


                ucAuctionConfirm.Visible = false;
                ucAuctionSuccess.Visible = false;
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
