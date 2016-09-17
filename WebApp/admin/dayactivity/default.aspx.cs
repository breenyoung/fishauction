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
using System.IO;

using Components.Bcl;
using Components.Entities;
using Components.Utils.Formatting;

namespace WebApp.admin.dayactivity
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{

        protected System.Web.UI.WebControls.Label lblNoReport;
        

        private static string OUTPUTFILE = "";
        private static string WEBOUTPUTFILE = "";


		private void Page_Load(object sender, System.EventArgs e)
		{
            if(IsPostBack) 
            {

                OUTPUTFILE = Server.MapPath("/") + "admin\\dayactivity\\output.csv";
                WEBOUTPUTFILE = "/admin/dayactivity/output.csv";

                // Get BCL handles
                AuctionBcl auctionBcl = AuctionBcl.GetInstance();
                BidBcl bidBcl = BidBcl.GetInstance();
                BuyerBcl buyerBcl = BuyerBcl.GetInstance();
                CatchBcl catchBcl = CatchBcl.GetInstance();
                TripBcl tripBcl = TripBcl.GetInstance();

                // Get closed auctions today
                ArrayList closedAuctions 
                    = auctionBcl.GetAuctionsClosedToday();
                
                if(closedAuctions.Count > 0) 
                {

                    DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);

                    StreamWriter sw ;
                    sw = File.CreateText(OUTPUTFILE);
                    sw.WriteLine("Daily Auction Activity as of " + today);
                    sw.WriteLine("");
                    sw.WriteLine("TransactionId,StartDate,EndDate,Confirmed,SmallGradeBid,MediumGradeBid,LargeGradeBid,XLGradeBid,HighBid,TotalPrice,VesselId,Port Landed Id,BuyerId,Catch Pounds,Small Grade %,Medium Grade %,Large Grade %,XL Grade %,Hail-In Date");

                    foreach(Auction auction in closedAuctions) 
                    {
                        string oneLine = "";

                        Bid winnerInfo = bidBcl.GetHighBidInfo(auction.Id);
                        Trip trip = tripBcl.GetTripByLotId(auction.Id);
                        Catch objCatch = catchBcl.GetCatchByTripId(trip.Id);

                        oneLine += FormatUtils.FormatTransactionId(auction.Id.ToString()) + ",";
                        oneLine += auction.StartDate.ToString() + ",";
                        oneLine += auction.EndDate.ToString() + ",";
                        oneLine += auction.Confirmed.ToString() + ",";

                        float winnerSGrade = float.Parse("0.000");
                        float winnerMGrade = float.Parse("0.000");
                        float winnerLGrade = float.Parse("0.000");
                        float winnerXLGrade = float.Parse("0.000");
                        float winnerBidAvg = float.Parse("0.000");
                        decimal winnerBidTotal = decimal.Parse("0.00");


                        if(winnerInfo != null) 
                        {
                            winnerSGrade = winnerInfo.SmallGrade;            
                            winnerMGrade = winnerInfo.MediumGrade;            
                            winnerLGrade = winnerInfo.LargeGrade;            
                            winnerXLGrade = winnerInfo.XLGrade;            
                            winnerBidAvg = winnerInfo.AvgPerLb;            
                            winnerBidTotal = winnerInfo.BidPrice;
                        }
                        

                        oneLine += FormatUtils.FormatThreeDecimal(winnerSGrade) + ",";
                        oneLine += FormatUtils.FormatThreeDecimal(winnerMGrade) + ",";
                        oneLine += FormatUtils.FormatThreeDecimal(winnerLGrade) + ",";
                        oneLine += FormatUtils.FormatThreeDecimal(winnerXLGrade) + ",";
                        oneLine += FormatUtils.FormatThreeDecimal(winnerBidAvg) + ",";
                        oneLine += FormatUtils.FormatMoney(winnerBidTotal) + "," ;
                        oneLine += trip.VesselId.ToString() + ",";
                        oneLine += winnerInfo.SelectedPort.ToString() + ",";
                        oneLine += winnerInfo.BuyerId.ToString() + ",";
                        oneLine += FormatUtils.FormatCommas(objCatch.Quantity) + ",";

                        ArrayList grades = objCatch.CatchGrades;
                        foreach(CatchGrade oneGrade in grades) 
                        {
                            if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                            {
                                // Small
                                oneLine += oneGrade.Value.ToString() + ",";
                            } 
                            else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                            {
                                // Medium
                                oneLine += oneGrade.Value.ToString() + ",";
                            }
                            else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                            {
                                // Large
                                oneLine += oneGrade.Value.ToString() + ",";
                            }
                            else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                            {
                                // XL
                                oneLine += oneGrade.Value.ToString() + ",";
                            }
                        }

                        oneLine += trip.HailInDate.ToString();

                        // Write line
                        sw.WriteLine(oneLine);
                    }


                    sw.Close();

                    FileInfo fi = new FileInfo(OUTPUTFILE);

                    Response.AddHeader("Content-Type","application/force-download");
                    Response.AddHeader("Content-Type","application/octet-stream");
                    Response.AddHeader("Content-Type","application/save");
                    Response.AddHeader("Content-Disposition", "attachment;filename=output.csv;");
                    Response.AddHeader("Content-Transfer-Encoding", "binary");

                    Response.AddHeader("Content-Length", fi.Length.ToString());
                    Response.WriteFile(WEBOUTPUTFILE);

                } 
                else 
                {    
                    Response.Redirect("/admin/dayactivity/default.aspx?n=1");
                }

            } 
            else 
            {
                // Initial Load
                if(Request.Cookies["ADMINAUTH"] == null || Request.Cookies["ADMINAUTH"].Value.Equals("EXPIRED")) 
                {
                    Response.Redirect("/admin/default.aspx?ReturnUrl=/admin/dayactivity/default.aspx"); 
                }


                if(Request.QueryString.Count > 0 && Request.QueryString["n"].Equals("1"))
                {
                    lblNoReport.Visible = true;  
                } 
                else 
                {
                    lblNoReport.Visible = false;
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
