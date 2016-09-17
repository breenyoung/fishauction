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
	/// Summary description for summary.
	/// </summary>
	public class summary : System.Web.UI.Page
	{

        #region WebControls
        protected System.Web.UI.WebControls.Repeater repeaterWinning;
        protected System.Web.UI.WebControls.Repeater repeaterLosing;
        protected System.Web.UI.WebControls.Repeater repeaterWon;
        
        protected System.Web.UI.WebControls.Label lblAvgLoseMyBids;
        protected System.Web.UI.WebControls.Label lblAvgLoseHighBids;
        protected System.Web.UI.WebControls.Label lblTotalLosePounds;
        protected System.Web.UI.WebControls.Label lblTotalLoseMyBids;
        protected System.Web.UI.WebControls.Label lblTotalLoseHighBids;
        protected System.Web.UI.WebControls.Label lblNoLosingBids;

        protected System.Web.UI.WebControls.Label lblAvgWinNextBids;
        protected System.Web.UI.WebControls.Label lblAvgWinMyBids;
        protected System.Web.UI.WebControls.Label lblTotalWinPounds;
        protected System.Web.UI.WebControls.Label lblTotalWinNextBids;
        protected System.Web.UI.WebControls.Label lblTotalWinMyBids;
        protected System.Web.UI.WebControls.Label lblNoWinningBids;

        protected System.Web.UI.WebControls.Label lblAvgWonNextBids;
        protected System.Web.UI.WebControls.Label lblAvgWonMyCost;
        protected System.Web.UI.WebControls.Label lblTotalWonPounds;
        protected System.Web.UI.WebControls.Label lblTotalWonNextBids;
        protected System.Web.UI.WebControls.Label lblTotalWonMyCost;
        protected System.Web.UI.WebControls.Label lblNoWonBids;


        protected System.Web.UI.WebControls.Label lblProcessor;
        protected System.Web.UI.WebControls.Label lblName;
        protected System.Web.UI.WebControls.Label lblMinBalance;
        protected System.Web.UI.WebControls.Label lblBalanceSurplus;
        protected System.Web.UI.WebControls.Label lblDepositBalance;
        #endregion


		private void Page_Load(object sender, System.EventArgs e)
		{

            // Get logged in user
            long userId = 0;
            Processor processor = null;
            if(Page.User.Identity.IsAuthenticated) 
            {
                // Buyer logged in, look them up
                userId = long.Parse(Page.User.Identity.Name);
                Buyer curBuyer = BuyerBcl.GetInstance().GetUserById(userId);
                processor = ProcessorBcl.GetInstance().GetProcessorById(curBuyer.ProcessorId);

                lblProcessor.Text = processor.Name + ", " + processor.Location;
                lblName.Text = curBuyer.FirstName + " " + curBuyer.LastName;
            } 


            // Get BCL Handles
            BidBcl bidBcl = BidBcl.GetInstance();
            AuctionBcl auctionBcl = AuctionBcl.GetInstance();
            CatchBcl catchBcl = CatchBcl.GetInstance();
            TripBcl tripBcl = TripBcl.GetInstance();
            PortBcl portBcl = PortBcl.GetInstance();


            lblDepositBalance.Text = "0.00";
            lblMinBalance.Text = "0.00";
            lblBalanceSurplus.Text = "0.00";
           

            #region Todays Losing Bids
            // =====================================
            // Losing Bids list
            // =====================================

            int totalLosePounds = 0;
            decimal totalLoseMyBids = Decimal.Parse("0.00");
            decimal totalLoseHighBids = Decimal.Parse("0.00");
            float avgLoseMyBids = 0;
            float avgLoseHighBids = 0;


            //ArrayList losingBids 
            //    = bidBcl.GetLosingBidsForBuyer(userId);

            ArrayList losingBids 
                = bidBcl.GetLosingBidsForProcessor(processor.Id);


            int loseCount = 0;
            if(losingBids.Count > 0) 
            {

                // Setup Repeater table columns
                DataTable dtTable = new DataTable();
                dtTable.Columns.Add(new DataColumn("AUCTIONID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("PORTNAME",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("QUANTITY",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("MYBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("HIGHBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("SGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("MGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("LGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("XLGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("CLOSETIME",System.Type.GetType("System.String")));

                long curAuctionId = 0;
                foreach(Bid oneBid in losingBids) 
                {

                    if(curAuctionId != oneBid.AuctionId) 
                    {

                        // Check to make sure high bid isnt from
                        // same processor.  If it is, no need to 
                        // display this row as a losing auction
                        int highBidProc 
                            = bidBcl.GetProcForHighBid(oneBid.AuctionId);

                        if(highBidProc != processor.Id) 
                        {

                            DataRow oneDataRow = dtTable.NewRow();

                            Trip oneTrip 
                                = tripBcl.GetTripByLotId(oneBid.AuctionId);
    
                            Catch oneCatch
                                = catchBcl.GetCatchByTripId(oneTrip.Id);
                    
                            Auction oneAuction
                                = auctionBcl.GetAuctionById(oneBid.AuctionId);
                   
                            oneDataRow["AUCTIONID"] = FormatUtils.FormatTransactionId(oneBid.AuctionId.ToString());
                    
                            oneDataRow["PORTNAME"] = portBcl.GetPortById(oneBid.SelectedPort).Name;
                            oneDataRow["QUANTITY"] = FormatUtils.FormatCommas(oneCatch.Quantity);
                    
                            Bid highBid = bidBcl.GetHighBidInfo(oneBid.AuctionId);

                            oneDataRow["MYBID"] = FormatUtils.FormatThreeDecimal(oneBid.AvgPerLb);
                            oneDataRow["HIGHBID"] = FormatUtils.FormatThreeDecimal(float.Parse(highBid.AvgPerLb.ToString()));

                            ArrayList grades = oneCatch.CatchGrades;
                            foreach(CatchGrade oneGrade in grades) 
                            {
                                if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                                {
                                    oneDataRow["SGRADE"] = oneGrade.Value;
                                } 
                                else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                                {
                                    oneDataRow["MGRADE"] = oneGrade.Value;
                                }
                                else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                                {
                                    oneDataRow["LGRADE"] = oneGrade.Value;
                                }
                                else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                                {
                                    oneDataRow["XLGRADE"] = oneGrade.Value;
                                }
                            }

                            oneDataRow["CLOSETIME"] = String.Format("{0:MM/dd HH:mm}",oneAuction.EndDate);

                            dtTable.Rows.Add(oneDataRow);

                            // Track totals
                            totalLosePounds += oneCatch.Quantity;
                            totalLoseMyBids += oneBid.BidPrice; // Actual bid total
                            totalLoseHighBids += decimal.Parse(highBid.BidPrice.ToString());

                            avgLoseMyBids += oneBid.AvgPerLb;
                            avgLoseHighBids += float.Parse(highBid.AvgPerLb.ToString());

                            loseCount++;
                        }


                    }
                    curAuctionId = oneBid.AuctionId;
                    

                }

                if(loseCount > 0) 
                {
                    lblNoLosingBids.Text = "";

                }

                DataView dv = new DataView(dtTable);

                repeaterLosing.DataSource = dv;
                repeaterLosing.DataBind();


            } 
        
            // Fill totals, averages
            if(loseCount > 0) 
            {
                avgLoseMyBids = (avgLoseMyBids / loseCount);
                lblAvgLoseMyBids.Text = FormatUtils.FormatThreeDecimal(avgLoseMyBids);

                avgLoseHighBids = (avgLoseHighBids / loseCount);
                lblAvgLoseHighBids.Text = FormatUtils.FormatThreeDecimal(avgLoseHighBids);
            } 
            else 
            {
                lblAvgLoseMyBids.Text = FormatUtils.FormatThreeDecimal(0);
                lblAvgLoseHighBids.Text = FormatUtils.FormatThreeDecimal(0);
            }
            lblTotalLosePounds.Text = FormatUtils.FormatCommas(totalLosePounds);
            lblTotalLoseHighBids.Text = FormatUtils.FormatMoney(totalLoseHighBids);
            lblTotalLoseMyBids.Text = FormatUtils.FormatMoney(totalLoseMyBids);


            // =====================================
            #endregion


            #region Todays Winning Bids
            // =====================================
            // Winning Bids list
            // =====================================
            
            int totalWinPounds = 0;
            decimal totalWinMyBids = Decimal.Parse("0.00");
            decimal totalWinNextBids = Decimal.Parse("0.00");
            float avgWinMyBids = 0;
            float avgWinNextBids = 0;
            int nextWinningBidCount = 0;

//            ArrayList winningBids 
//                = bidBcl.GetWinningBidsForBuyer(userId);

            ArrayList winningBids 
                = bidBcl.GetWinningBidsForProcessor(processor.Id);


            if(winningBids.Count > 0) 
            {
                lblNoWinningBids.Text = "";

                // Setup Repeater table columns
                DataTable dtTable = new DataTable();
                dtTable.Columns.Add(new DataColumn("AUCTIONID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("PORTNAME",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("QUANTITY",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("NEXTBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("MYBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("SGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("MGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("LGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("XLGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("CLOSETIME",System.Type.GetType("System.String")));


                foreach(Bid oneBid in winningBids) 
                {

                    DataRow oneDataRow = dtTable.NewRow();

                    Trip oneTrip 
                        = tripBcl.GetTripByLotId(oneBid.AuctionId);
    
                    Catch oneCatch
                        = catchBcl.GetCatchByTripId(oneTrip.Id);
                    
                    Auction oneAuction
                        = auctionBcl.GetAuctionById(oneBid.AuctionId);

                    


                    oneDataRow["AUCTIONID"] = FormatUtils.FormatTransactionId(oneBid.AuctionId.ToString());
                    
                    oneDataRow["PORTNAME"] = portBcl.GetPortById(oneBid.SelectedPort).Name;
                    oneDataRow["QUANTITY"] = FormatUtils.FormatCommas(oneCatch.Quantity);

                    ArrayList nextHighest 
                        = bidBcl.GetNextHighBidForAuction(oneBid.AuctionId, oneBid.AvgPerLb);
                    
                    float nextHighBid = float.Parse(nextHighest[0].ToString());
                    if(nextHighBid == oneBid.AvgPerLb) 
                    {
                        // Next bid is same as high, so just display '-'
                        oneDataRow["NEXTBID"] = "-";
                    } 
                    else 
                    {
                        oneDataRow["NEXTBID"] = "$" + FormatUtils.FormatThreeDecimal(float.Parse(nextHighest[0].ToString()));
                        totalWinNextBids += decimal.Parse(nextHighest[1].ToString());
                        avgWinNextBids += float.Parse(nextHighest[0].ToString());
                        nextWinningBidCount++;

                    }


                    oneDataRow["MYBID"] = FormatUtils.FormatThreeDecimal(oneBid.AvgPerLb);

                    ArrayList grades = oneCatch.CatchGrades;
                    foreach(CatchGrade oneGrade in grades) 
                    {
                        if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                        {
                            oneDataRow["SGRADE"] = oneGrade.Value;
                        } 
                        else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                        {
                            oneDataRow["MGRADE"] = oneGrade.Value;
                        }
                        else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                        {
                            oneDataRow["LGRADE"] = oneGrade.Value;
                        }
                        else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                        {
                            oneDataRow["XLGRADE"] = oneGrade.Value;
                        }
                    }

                    oneDataRow["CLOSETIME"] = String.Format("{0:MM/dd HH:mm}",oneAuction.EndDate);

                    dtTable.Rows.Add(oneDataRow);

                    // Track totals
                    totalWinPounds += oneCatch.Quantity;
                    totalWinMyBids += oneBid.BidPrice; // Actual Bid Total
                    avgWinMyBids += oneBid.AvgPerLb;


                }

                DataView dv = new DataView(dtTable);

                repeaterWinning.DataSource = dv;
                repeaterWinning.DataBind();


            } 
            // Fill totals, averages
            if(winningBids.Count > 0) 
            {
                avgWinMyBids = (avgWinMyBids / winningBids.Count);
                lblAvgWinMyBids.Text = FormatUtils.FormatThreeDecimal(avgWinMyBids);

                if(nextWinningBidCount == 0) 
                {
                    avgWinNextBids = float.Parse("0");
                } 
                else 
                {
                    avgWinNextBids = (avgWinNextBids / nextWinningBidCount);
                }

                lblAvgWinNextBids.Text = FormatUtils.FormatThreeDecimal(avgWinNextBids);
            } 
            else 
            {
                lblAvgWinMyBids.Text = FormatUtils.FormatThreeDecimal(0);
                lblAvgWinNextBids.Text = FormatUtils.FormatThreeDecimal(0);
            }
            lblTotalWinPounds.Text = FormatUtils.FormatCommas(totalWinPounds);
            lblTotalWinNextBids.Text = FormatUtils.FormatMoney(totalWinNextBids);
            lblTotalWinMyBids.Text = FormatUtils.FormatMoney(totalWinMyBids);

            // =====================================
            #endregion
       

            #region Todays Won Auctions
            // =====================================
            // Todays won auctions
            // =====================================

            int totalWonPounds = 0;
            decimal totalWonMyCost = Decimal.Parse("0.00");
            decimal totalWonNextBids = Decimal.Parse("0.00");
            float avgWonMyCost = 0;
            float avgWonNextBids = 0;
            int nextWonBidCount = 0;

//            ArrayList wonAuctions 
//                = bidBcl.GetWonAuctionsForBuyer(userId);

            ArrayList wonAuctions 
                = bidBcl.GetWonAuctionsForProcessor(processor.Id);


            if(wonAuctions.Count > 0) 
            {

                lblNoWonBids.Text = "";

                // Setup Repeater table columns
                DataTable dtTable = new DataTable();
                dtTable.Columns.Add(new DataColumn("AUCTIONID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("PORTNAME",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("QUANTITY",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("NEXTBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("MYCOST",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("SGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("MGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("LGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("XLGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("LANDING",System.Type.GetType("System.String")));


                foreach(Bid oneBid in wonAuctions) 
                {

                    DataRow oneDataRow = dtTable.NewRow();

                    Trip oneTrip 
                        = tripBcl.GetTripByLotId(oneBid.AuctionId);
    
                    Catch oneCatch
                        = catchBcl.GetCatchByTripId(oneTrip.Id);
                    
                    Auction oneAuction
                        = auctionBcl.GetAuctionById(oneBid.AuctionId);
                    

                    oneDataRow["AUCTIONID"] = FormatUtils.FormatTransactionId(oneBid.AuctionId.ToString());
                    
                    oneDataRow["PORTNAME"] = portBcl.GetPortById(oneBid.SelectedPort).Name;
                    oneDataRow["QUANTITY"] = FormatUtils.FormatCommas(oneCatch.Quantity);

                    ArrayList nextHighest 
                        = bidBcl.GetNextHighBidForAuction(oneBid.AuctionId, oneBid.AvgPerLb);
                    
                    float nextHighBid = float.Parse(nextHighest[0].ToString());
                    if(nextHighBid == oneBid.AvgPerLb) 
                    {
                        // Next bid is same as high, so just display '-'
                        oneDataRow["NEXTBID"] = "-";
                    } 
                    else 
                    {
                        oneDataRow["NEXTBID"] = "$" + FormatUtils.FormatThreeDecimal(float.Parse(nextHighest[0].ToString()));
                        totalWonNextBids += decimal.Parse(nextHighest[1].ToString());
                        avgWonNextBids += float.Parse(nextHighest[0].ToString());
                        nextWonBidCount++;

                    }

                    
                    oneDataRow["MYCOST"] = FormatUtils.FormatThreeDecimal(oneBid.AvgPerLb);

                    ArrayList grades = oneCatch.CatchGrades;
                    foreach(CatchGrade oneGrade in grades) 
                    {
                        if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                        {
                            oneDataRow["SGRADE"] = oneGrade.Value;
                        } 
                        else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                        {
                            oneDataRow["MGRADE"] = oneGrade.Value;
                        }
                        else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                        {
                            oneDataRow["LGRADE"] = oneGrade.Value;
                        }
                        else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                        {
                            oneDataRow["XLGRADE"] = oneGrade.Value;
                        }
                    }

                    oneDataRow["LANDING"] = String.Format("{0:MM/dd HH:mm}",oneAuction.EndDate);

                    dtTable.Rows.Add(oneDataRow);

                    // Track MY totals
                    totalWonPounds += oneCatch.Quantity;
                    totalWonMyCost += oneBid.BidPrice; // Actual Bid Total
                    avgWonMyCost += oneBid.AvgPerLb;
                }


                DataView dv = new DataView(dtTable);

                repeaterWon.DataSource = dv;
                repeaterWon.DataBind();
                

            }
            // Fill totals, averages
            if(wonAuctions.Count > 0) 
            {
                avgWonMyCost = (avgWonMyCost / wonAuctions.Count);
                lblAvgWonMyCost.Text = FormatUtils.FormatThreeDecimal(avgWonMyCost);

                if(nextWonBidCount == 0) 
                {
                    avgWonNextBids = float.Parse("0");
                } 
                else 
                {
                    avgWonNextBids = (avgWonNextBids / nextWonBidCount);
                }
                lblAvgWonNextBids.Text = FormatUtils.FormatThreeDecimal(avgWonNextBids);

            } 
            else 
            {
                lblAvgWonMyCost.Text = FormatUtils.FormatThreeDecimal(0);
                lblAvgWonNextBids.Text = FormatUtils.FormatThreeDecimal(0);
            }

            lblTotalWonPounds.Text = FormatUtils.FormatCommas(totalWonPounds);
            lblTotalWonNextBids.Text = FormatUtils.FormatMoney(totalWonNextBids);
            lblTotalWonMyCost.Text = FormatUtils.FormatMoney(totalWonMyCost);
            #endregion


            #region Bottom Fields
            // Fill in bottom fields
            
            decimal depositBalance = processor.AccountBalance - totalWonMyCost;
            lblDepositBalance.Text = FormatUtils.FormatMoney(depositBalance);
            lblMinBalance.Text = FormatUtils.FormatMoney(processor.MinBalance);
            lblBalanceSurplus.Text = FormatUtils.FormatMoney(depositBalance - processor.MinBalance);
            #endregion
        
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
