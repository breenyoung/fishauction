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

using aspNetEmail;

namespace WebApp.Scheduler
{
	/// <summary>
	/// Summary description for closeAuctions.
	/// </summary>
	public class closeAuctions : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{

            DateTime now = FormatUtils.ToNSTTime(System.DateTime.UtcNow);

            AuctionBcl auctionBcl = AuctionBcl.GetInstance();
            TripBcl tripBcl = TripBcl.GetInstance();
            VesselBcl vesselBcl = VesselBcl.GetInstance();
            BidBcl bidBcl = BidBcl.GetInstance();
            BuyerBcl buyerBcl = BuyerBcl.GetInstance();
            ProcessorBcl procBcl = ProcessorBcl.GetInstance();
            PortBcl portBcl = PortBcl.GetInstance();
            CatchBcl catchBcl = CatchBcl.GetInstance();
            SupplyBcl supplyBcl = SupplyBcl.GetInstance();

            ArrayList openAuctions = auctionBcl.GetAuctionsByActiveFlag(true);

            if(openAuctions.Count > 0) 
            {
                foreach(Auction auction in openAuctions) 
                {
                    if(auction.EndDate < now) 
                    {
                        // Mark auction as closed
                        auctionBcl.UpdateAuctionActiveFlag(auction.Id, auction.Active);

                        Bid bid = bidBcl.GetHighBidInfo(auction.Id);
                        if(bid != null) 
                        {
                            // If there is a winner(highbid), send an email to them
                       

                            Trip trip = tripBcl.GetTripByLotId(auction.Id);
                            Vessel vessel = vesselBcl.GetVesselById(trip.VesselId);

                            Buyer buyer = buyerBcl.GetUserById(bid.BuyerId);
                            Processor proc = procBcl.GetProcessorById(buyer.ProcessorId);
                            Port port = portBcl.GetPortById(bid.SelectedPort);

                            Catch objCatch = catchBcl.GetCatchByTripId(trip.Id);
                            ArrayList supplies = objCatch.CatchSupplies;
                            string supplyListEmail = "";
                            foreach (CatchSupply oneCatchSupply in supplies)
                            {
                                Supply oneSupply 
                                    = supplyBcl.GetSupplyById(oneCatchSupply.SupplyId);

                                supplyListEmail += oneSupply.Name + " (" + oneSupply.UnitType + "): ";

                                if(oneSupply.UnitType.Equals("tons")) 
                                {
                                    supplyListEmail += FormatUtils.FormatOneDecimal(oneCatchSupply.Value) + "\n" ;
                                } 
                                else 
                                {
                                    supplyListEmail += FormatUtils.FormatCommas(oneCatchSupply.Value) + "\n" ;
                                }
                            }

                            string catchGradesEmail = "";
                            ArrayList catchGrades = objCatch.CatchGrades;
                            foreach (CatchGrade oneGrade in catchGrades) 
                            {
                                if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                                {
                                    // Small
                                    catchGradesEmail += "Small: " + oneGrade.Value.ToString() + "%\n";
                                } 
                                else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                                {
                                    // Medium
                                    catchGradesEmail += "Medium: " + oneGrade.Value.ToString() + "%\n";
                                }
                                else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                                {
                                    // Large
                                    catchGradesEmail += "Large: " + oneGrade.Value.ToString() + "%\n";
                                }
                                else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                                {
                                    // XL
                                    catchGradesEmail += "XL: " + oneGrade.Value.ToString() + "%\n";
                                }

                            }

                            // ETA
                            //TimeSpan etaDaysLeft = FormatUtils.ToNSTTime(System.DateTime.UtcNow).Subtract(trip.HailInDate);
                            //TimeSpan etaDaysToHours = new TimeSpan(etaDaysLeft.Days, etaDaysLeft.Hours,0,0,0);                        
                            //string eta = etaDaysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + etaDaysLeft.Minutes.ToString().PadLeft(2,'0');
                            string eta = String.Format("{0:MM/dd HH:mm}",trip.HailInDate);

                            string spInstruts = "";
                            if(trip.SpecialInstructions != null && !trip.SpecialInstructions.Equals("")) 
                            {
                                spInstruts += "Special Instructions: \n";
                                spInstruts += trip.SpecialInstructions + "\n";
                            }


                            #region Send Purchase Email
                            // Send the winning buyer an email
                            EmailMessage email = new EmailMessage("localhost");
                            email.To = buyer.Email;
                            email.FromAddress = "auction@shrimpauction.ca";
                            email.Subject = "Purchase Confirmation Report";
                            email.BodyFormat = MailFormat.Text;

                            email.Body = "Borealis Trading & ShrimpAuction.ca\n" +
                                "Purchase Confirmation Report\n" + 
                                "For: " + buyer.FirstName + " " + buyer.LastName + ", " + proc.Name + "\n" + 
                                "Transaction ID: " + FormatUtils.FormatTransactionId(auction.Id.ToString()) +
                                "\n\n" +
                                "Please keep the following for your records and as a temporary receipt for your purchase.\n" +
                                "\n" +
                                "Catch Breakdown:\n" +
                                "Total Pounds: " + FormatUtils.FormatCommas(objCatch.Quantity) + "\n\n" +                                
                                "Grades:\n" +
                                catchGradesEmail + "\n" +
                                "Vessel Information:\n" +
                                "Vessel Seller: " + vessel.Name + "\n" +
                                "CFV: " + vessel.Cfv.ToString() + "\n" +
                                "Seller Phone: " + vessel.Phone1 + "\n" +
                                "Pick Up Port: " + port.Name + "\n" +
                                "ETA: " + eta + "\n" +
                                "\n" +
                                spInstruts +
                                "Supplies Needed:\n" +
                                supplyListEmail + "\n" +
                                "Price/Lot breakdown:\n" + 
                                "S: " + FormatUtils.FormatThreeDecimal(bid.SmallGrade) + "\n" +
                                "M: " + FormatUtils.FormatThreeDecimal(bid.MediumGrade) + "\n" +
                                "L: " + FormatUtils.FormatThreeDecimal(bid.LargeGrade) + "\n" +
                                "XL: " + FormatUtils.FormatThreeDecimal(bid.XLGrade) + "\n" +
                                "Average Price/lb: " + FormatUtils.FormatThreeDecimal(bid.AvgPerLb) + "\n" +
                                "Purchase Total: " + FormatUtils.FormatMoney(bid.BidPrice) + "\n";

                            email.Send();
                            #endregion
                        }
                    }
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
