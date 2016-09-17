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

using WebApp.Classes;

namespace WebApp.Auctions
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{
        protected System.Web.UI.WebControls.Repeater repeaterAuctions;
        protected System.Web.UI.WebControls.Label lblNoAuctionsMsg;
        protected System.Web.UI.WebControls.Label lblAuctionCloseMsg;
        protected System.Web.UI.WebControls.Label lblProcessorSuspendedMsg;
        protected WebApp.UserControls.HeaderBanner ucBuyerHeader;

        private void Page_Load(object sender, System.EventArgs e)
        {

            // Make sure Auction time is still on
            if(WebUtils.IsAuctionDayOver()) 
            {
                lblAuctionCloseMsg.Visible = true;
                lblNoAuctionsMsg.Visible = false;

            }
            // Make sure Buyer's processor can trade
            else if(!WebUtils.CanProcTrade()) 
            {
                lblAuctionCloseMsg.Visible = false;
                lblNoAuctionsMsg.Visible = false;
                lblProcessorSuspendedMsg.Visible = true;
            }
            else 
            {

            
                lblAuctionCloseMsg.Visible = false;
                lblNoAuctionsMsg.Visible = false;
                lblProcessorSuspendedMsg.Visible = false;

                // Setup Repeater table columns
                DataTable dtTable = new DataTable();
                dtTable.Columns.Add(new DataColumn("DISPLAYID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("TRANSID",System.Type.GetType("System.Int64")));
                dtTable.Columns.Add(new DataColumn("PLANDING",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("QUANTITY",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("AREA",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("DAYSOUT",System.Type.GetType("System.String")));

                dtTable.Columns.Add(new DataColumn("HOLD",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("SGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("MGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("LGRADE",System.Type.GetType("System.Int32")));
                dtTable.Columns.Add(new DataColumn("XLGRADE",System.Type.GetType("System.Int32")));

                dtTable.Columns.Add(new DataColumn("ETA",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("HIGHBID",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("CLOSETIME",System.Type.GetType("System.String")));
                dtTable.Columns.Add(new DataColumn("REMAINTIME",System.Type.GetType("System.String")));


                // Get Data from DB
                ArrayList activeAuctions 
                    = AuctionBcl.GetInstance().GetActiveAuctions();

                TripBcl tripBcl = TripBcl.GetInstance();
                CatchBcl catchBcl = CatchBcl.GetInstance();
                BidBcl bidBcl = BidBcl.GetInstance();
                PortBcl portBcl = PortBcl.GetInstance();
                AreaBcl areaBcl = AreaBcl.GetInstance();
                StowBcl stowBcl = StowBcl.GetInstance();

                if(activeAuctions.Count > 0) 
                {

                    foreach (Auction oneAuction in activeAuctions) 
                    {

                        long lotId = oneAuction.Id;

                        Trip oneTrip = tripBcl.GetTripByLotId(lotId);
                        Catch oneCatch = catchBcl.GetCatchByTripId(oneTrip.Id);                
                        ArrayList catchGrades = oneCatch.CatchSupplies;                                   
                        Stow oneStow = stowBcl.GetStowById(oneCatch.StowId);
                
                        DataRow oneDataRow = dtTable.NewRow();


                        // Auction Id
                        oneDataRow["DISPLAYID"] = FormatUtils.FormatTransactionId(lotId.ToString());
                        oneDataRow["TRANSID"] = lotId;
                
                        // Get prefered port
                        ArrayList ports = oneTrip.Ports;
                        foreach(TripPort tp in ports) 
                        {
                            if(tp.Alternate == 1) 
                            {
                                Port prefered = portBcl.GetPortById(tp.PortId);
                                oneDataRow["PLANDING"] = prefered.Name;
                                break;

                            }
                        }

                        // Quantity
                        oneDataRow["QUANTITY"] = FormatUtils.FormatCommas(oneCatch.Quantity);

                        // Fishing Area
                        Area area = areaBcl.GetAreaById(oneTrip.Area);
                        oneDataRow["AREA"] = area.Abbr;

                        // Days out
                        TimeSpan daysDiff = oneTrip.HailInDate.Subtract(oneTrip.HailOutDate);
                        double daysOut = daysDiff.TotalDays;

                        oneDataRow["DAYSOUT"] = String.Format("{0:0.0}",daysOut);

                        // Stow type
                        oneDataRow["HOLD"] = oneStow.Name;


                        // Catch Grade %'s
                        ArrayList grades = oneCatch.CatchGrades;
                        foreach(CatchGrade oneGrade in grades) 
                        {
                            if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                            {
                                oneDataRow["SGRADE"] = oneGrade.Value.ToString();
                            } 
                            else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                            {
                                oneDataRow["MGRADE"] = oneGrade.Value.ToString();
                            }
                            else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                            {
                                oneDataRow["LGRADE"] = oneGrade.Value.ToString();
                            }
                            else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                            {
                                oneDataRow["XLGRADE"] = oneGrade.Value.ToString();
                            }
                        }

                        // ETA
                        //TimeSpan etaDaysLeft = FormatUtils.ToNSTTime(System.DateTime.UtcNow).Subtract(oneTrip.HailInDate);
                        //TimeSpan etaDaysToHours = new TimeSpan(etaDaysLeft.Days, etaDaysLeft.Hours,0,0,0);                        
                        //string eta = etaDaysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + etaDaysLeft.Minutes.ToString().PadLeft(2,'0');
                        string eta = String.Format("{0:MM/dd HH:mm}",oneTrip.HailInDate);
                        oneDataRow["ETA"] = eta;

                        // High Bid
                        float highBid = bidBcl.GetHighBidForAuction(lotId);
                        if(highBid != 0) 
                        {
                            //oneDataRow["HIGHBID"] = "$" + FormatUtils.FormatHighBid(highBid.ToString());
                            oneDataRow["HIGHBID"] = "$" + FormatUtils.FormatThreeDecimal(highBid);                            
                        } 
                        else 
                        {
                            oneDataRow["HIGHBID"] = "No Bids";
                        }

        
                        // Close Time
                        oneDataRow["CLOSETIME"] = String.Format("{0:MM/dd HH:mm}",oneAuction.EndDate);


                        // Remaining Time
                        TimeSpan daysLeft = oneAuction.EndDate.Subtract(FormatUtils.ToNSTTime(System.DateTime.UtcNow));
                        //double remainTime = daysLeft.TotalDays;

                        //daysLeft.to
                        string timeLeft = "" ;
                        if(daysLeft.Days > 0) 
                        {
                            // A day or more left, turn days into hours
                            TimeSpan daysToHours = new TimeSpan(daysLeft.Days, daysLeft.Hours,0,0,0);                        
                            timeLeft = daysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + daysLeft.Minutes.ToString().PadLeft(2,'0');
                            //timeLeft = daysLeft.Days + " d " + daysLeft.Hours + "hrs";

                        } 
                        else 
                        {
                            // Less then a day left
                            if(daysLeft.Hours == 0 && daysLeft.Minutes <= 5) 
                            {
                                // Less then 5 mins, show in red and just say < 5
                                timeLeft = "<font color='FF0000'>< 5 mins</font>";
                            } 
                            else 
                            {
                                timeLeft = daysLeft.Hours.ToString().PadLeft(2,'0') + ":" + daysLeft.Minutes.ToString().PadLeft(2,'0');
                            }
                        }

                        oneDataRow["REMAINTIME"] = timeLeft;
                
                        dtTable.Rows.Add(oneDataRow);

                    }

                    DataView dvList = new DataView(dtTable);

                    repeaterAuctions.DataSource = dvList;
                    repeaterAuctions.DataBind();
            
                } 
                else 
                {
                    lblNoAuctionsMsg.Visible = true;
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
