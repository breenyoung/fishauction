namespace WebApp.UserControls.Auction
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
    using System.Collections;
    using System.ComponentModel;
    using System.Web.SessionState;
    using System.Web.UI;

    using Components.Bcl;
    using Components.Entities;
    using Components.Utils.Formatting;

    using WebApp.Classes;

	/// <summary>
	///		Summary description for AuctionDetails.
	/// </summary>
	public class AuctionDetails : System.Web.UI.UserControl
	{

        private static readonly string SUMMARY_PAGE = "/Auctions/default.aspx";

        #region Web controls
        
        protected System.Web.UI.WebControls.Label lblAuctionId;
        protected System.Web.UI.WebControls.Label lblSpecies;
        //protected System.Web.UI.WebControls.Label lblVesselName;
        protected System.Web.UI.WebControls.Label lblLotSize;
        protected System.Web.UI.WebControls.Label lblArea;
        protected System.Web.UI.WebControls.Label lblDaysAtSea;
        protected System.Web.UI.WebControls.Label lblHoldMethod;
        protected System.Web.UI.WebControls.Label lblEta;
        protected System.Web.UI.WebControls.Label lblHighBid;
        protected System.Web.UI.WebControls.Label lblCloseTime;
        protected System.Web.UI.WebControls.Label lblTimeLeft;
        protected System.Web.UI.WebControls.Label lblSmallGrade;
        protected System.Web.UI.WebControls.Label lblMediumGrade;
        protected System.Web.UI.WebControls.Label lblLargeGrade;
        protected System.Web.UI.WebControls.Label lblXLGrade;
        protected System.Web.UI.WebControls.Label lblSpecialInstructions;

        protected System.Web.UI.HtmlControls.HtmlInputHidden tbCatchId;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbAuctionId;
        
        protected System.Web.UI.WebControls.Label lblNoSuppliesMsg;
        protected System.Web.UI.WebControls.Repeater repeaterDays;
        protected System.Web.UI.WebControls.Repeater repeaterSupplies;


        protected System.Web.UI.WebControls.TextBox tbSmallGradeAmt;
        protected System.Web.UI.WebControls.TextBox tbMediumGradeAmt;
        protected System.Web.UI.WebControls.DropDownList ddlTripPorts;
        protected System.Web.UI.WebControls.CompareValidator compFieldSmallGrade;
        protected System.Web.UI.WebControls.CompareValidator compFieldMediumGrade;
        protected System.Web.UI.WebControls.TextBox tbLargeGradeAmt;
        protected System.Web.UI.WebControls.CompareValidator compFieldLargeGrade;
        protected System.Web.UI.WebControls.TextBox tbXLGradeAmt;
        protected System.Web.UI.WebControls.CompareValidator compFieldXLGrade;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqFieldPorts;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqFieldSmallGrade;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqFieldMediumGrade;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqFieldLargeGrade;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqFieldXLGrade;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbCatchTotal;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbBidTotal;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbBidAverage;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbStep;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbQuantity;

        protected System.Web.UI.WebControls.ImageButton btnSubmit;
        protected System.Web.UI.WebControls.Label lblOutBidMsg;
   
        //JScript fields
        protected System.Web.UI.HtmlControls.HtmlInputText JSAVGPRICE;
        protected System.Web.UI.HtmlControls.HtmlInputText JSTOTALPRICE;
        protected System.Web.UI.HtmlControls.HtmlInputHidden JSQUANTITY;
        protected System.Web.UI.HtmlControls.HtmlInputHidden JSSGRADE;
        protected System.Web.UI.HtmlControls.HtmlInputHidden JSMGRADE;
        protected System.Web.UI.HtmlControls.HtmlInputHidden JSLGRADE;
        protected System.Web.UI.HtmlControls.HtmlInputHidden JSXLGRADE;


        #endregion

        #region Private Variables
        private bool _visible;
        private decimal _bidTotal;
        private decimal _pricePerSmallGrade;
        private decimal _pricePerMediumGrade;
        private decimal _pricePerLargeGrade;
        private decimal _pricePerXLGrade;
        private long _catchId;
        private int _portSelected;
        private long _auctionId;
        private int _quantity;
    
        #endregion

        #region Getters/Setters

        public bool IsVisible
        {
            get { return _visible; }
            set { _visible = value; }
        }

        public long AuctionId
        {
            get { return _auctionId; }
            set { _auctionId = value; }
        }

        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public decimal BidTotal
        {
            get { return _bidTotal; }
            set { _bidTotal = value; }
        }
        
        public decimal PricePerSmallGrade
        {
            get { return _pricePerSmallGrade; }
            set { _pricePerSmallGrade = value; }
        }

        public decimal PricePerMediumGrade
        {
            get { return _pricePerMediumGrade; }
            set { _pricePerMediumGrade = value; }
        }

        public decimal PricePerLargeGrade
        {
            get { return _pricePerLargeGrade; }
            set { _pricePerLargeGrade = value; }
        }

        public decimal PricePerXLGrade
        {
            get { return _pricePerXLGrade; }
            set { _pricePerXLGrade = value; }
        }

        public long CatchId
        {
            get { return _catchId; }
            set { _catchId = value; }
        }

        public int PortSelected
        {
            get { return _portSelected; }
            set { _portSelected = value; }
        }


        #endregion


        BidBcl bidBcl = BidBcl.GetInstance();


        public void SetOutBidMsg(string msg) 
        {
            lblOutBidMsg.Text = msg;
        }

        private void Page_Load(object sender, System.EventArgs e)
        {

            if(IsPostBack) 
            {

                Page.Validate();
                if(Page.IsValid) 
                {
                }
            } 
            else 
            {

                // Display auction details

                if(Request.QueryString["id"] != null && Request.QueryString["id"] != "") 
                {
    
                    // Check to make sure auction day is still on,
                    // otherwise redirect
                    if(WebUtils.IsAuctionDayOver()) 
                    {
                        // Auction day ended, redirect
                        Response.Redirect(SUMMARY_PAGE);

                    }

                    // If Processor cant trade, redirect
                    if(!WebUtils.CanProcTrade()) 
                    {
                        Response.Redirect(SUMMARY_PAGE);
                    }

                    long auctionId = 0;
                    try 
                    {
                        auctionId 
                            = Int64.Parse(Request.Params["id"].ToString());
                    } 
                    catch(FormatException fe) 
                    {
                        throw new ApplicationException(fe.Message);
                    }


                    // Handles to BCLs
                    AuctionBcl auctionBcl = AuctionBcl.GetInstance();
                    TripBcl tripBcl = TripBcl.GetInstance();
                    //VesselBcl vesselBcl = VesselBcl.GetInstance();
                    CatchBcl catchBcl = CatchBcl.GetInstance();
                    SpeciesBcl speciesBcl = SpeciesBcl.GetInstance();
                    SupplyBcl supplyBcl = SupplyBcl.GetInstance();
                    PortBcl portBcl = PortBcl.GetInstance();
                    AreaBcl areaBcl = AreaBcl.GetInstance();
                    StowBcl stowBcl = StowBcl.GetInstance();

                    // Now get all auction/catch/trip/vessel details
                    Auction auction = auctionBcl.GetAuctionById(auctionId);
                    if(auction == null) 
                    {
                        // Auction not found, redirect
                        Response.Redirect(SUMMARY_PAGE);
                    } 
                    else 
                    {
                        // Check if auction is still active
                        if(auction.EndDate < FormatUtils.ToNSTTime(System.DateTime.UtcNow) || !auction.Active) 
                        {
                            Response.Redirect(SUMMARY_PAGE);                            
                        }
                    }

                    Trip trip = tripBcl.GetTripByLotId(auctionId);
                    //Vessel vessel = vesselBcl.GetVesselById(trip.VesselId);
                    Catch objCatch = catchBcl.GetCatchByTripId(trip.Id);
                    Stow stow = stowBcl.GetStowById(objCatch.StowId);

                    // Hidden fields
                    tbAuctionId.Value = auctionId.ToString();
                    tbCatchId.Value = objCatch.Id.ToString();

                    // Top left auction, lot, vessel details

                    lblAuctionId.Text = FormatUtils.FormatTransactionId(auctionId.ToString());
                    lblSpecies.Text = speciesBcl.GetSpeciesById(objCatch.SpeciesId).Name;
                    lblLotSize.Text = FormatUtils.FormatCommas(objCatch.Quantity);
                    // JS FIELD
                    JSQUANTITY.Value = objCatch.Quantity.ToString();

                    Area area = areaBcl.GetAreaById(trip.Area);
                    lblArea.Text = area.Name;

                    TimeSpan daysDiff = trip.HailInDate.Subtract(trip.HailOutDate);
                    double daysOut = daysDiff.TotalDays;
                    lblDaysAtSea.Text = String.Format("{0:0.0}",daysOut);


                    lblHoldMethod.Text = stow.Name;

                    // ETA
                    //TimeSpan etaDaysLeft = FormatUtils.ToNSTTime(System.DateTime.UtcNow).Subtract(trip.HailInDate);
                    //TimeSpan etaDaysToHours = new TimeSpan(etaDaysLeft.Days, etaDaysLeft.Hours,0,0,0);                        
                    //string eta = etaDaysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + etaDaysLeft.Minutes.ToString().PadLeft(2,'0');
                    string eta = String.Format("{0:MM/dd HH:mm}",trip.HailInDate);
                    lblEta.Text = eta;

                    // Top Right Auction Snapshot

                    float highBid = bidBcl.GetHighBidForAuction(auctionId);
                    if(highBid != 0) 
                    {
//                        lblHighBid.Text = "$" + FormatUtils.FormatHighBid(highBid.ToString());
                        lblHighBid.Text = "$" + FormatUtils.FormatThreeDecimal(highBid);                        
                    } 
                    else 
                    {
                        lblHighBid.Text = "No Bids";
                    }

                    lblCloseTime.Text = String.Format("{0:MM/dd/yyyy HH:mm}",auction.EndDate);

                    TimeSpan daysLeft = auction.EndDate.Subtract(FormatUtils.ToNSTTime(System.DateTime.UtcNow));
                    //double remainTime = daysLeft.TotalDays;                

                    string timeLeft = "" ;
                    if(daysLeft.Days > 0) 
                    {
                        // A day or more left, turn days into hours
                        TimeSpan daysToHours = new TimeSpan(daysLeft.Days, daysLeft.Hours,0,0,0);                        
                        timeLeft = daysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + daysLeft.Minutes.ToString().PadLeft(2,'0');
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
                    lblTimeLeft.Text = timeLeft;



                    // Day breakdowns table for trip
                    ArrayList breakdowns = objCatch.CatchBreakdowns;
                    if(breakdowns.Count > 0) 
                    {


                        DataTable daysTable = new DataTable();
                        daysTable.Columns.Add(new DataColumn("DAYNAME",System.Type.GetType("System.String")));
                        daysTable.Columns.Add(new DataColumn("DAYPOUNDS",System.Type.GetType("System.String")));
                
                        foreach(CatchBreakdown oneBreakdown in breakdowns) 
                        {
                            DataRow oneDataRow = daysTable.NewRow();
                            oneDataRow["DAYNAME"] = "Day " + oneBreakdown.Day;
                            oneDataRow["DAYPOUNDS"] = FormatUtils.FormatCommas(oneBreakdown.Value);
                            daysTable.Rows.Add(oneDataRow);

                        }

                        DataView daysDataView = new DataView(daysTable);
                        repeaterDays.DataSource = daysDataView;
                        repeaterDays.DataBind();
                    }


                    // Supply table for the catch
                    ArrayList supplies = objCatch.CatchSupplies;
                    if(supplies.Count > 0) 
                    {

                        DataTable suppliesTable = new DataTable();
                        suppliesTable.Columns.Add(new DataColumn("SUPPLYNAME",System.Type.GetType("System.String")));
                        suppliesTable.Columns.Add(new DataColumn("SUPPLYUNIT",System.Type.GetType("System.String")));
                        suppliesTable.Columns.Add(new DataColumn("SUPPLYVALUE",System.Type.GetType("System.String")));


                        foreach (CatchSupply oneCatchSupply in supplies)
                        {
                            DataRow oneDataRow = suppliesTable.NewRow();

                            Supply oneSupply 
                                = supplyBcl.GetSupplyById(oneCatchSupply.SupplyId);

                            oneDataRow["SUPPLYNAME"] = oneSupply.Name;
                            oneDataRow["SUPPLYUNIT"] = oneSupply.UnitType;
                            if(oneSupply.UnitType.Equals("tons")) 
                            {
                                oneDataRow["SUPPLYVALUE"] = FormatUtils.FormatOneDecimal(oneCatchSupply.Value);
                            } 
                            else 
                            {
                                oneDataRow["SUPPLYVALUE"] = FormatUtils.FormatCommas(oneCatchSupply.Value);
                            }
                            suppliesTable.Rows.Add(oneDataRow);

                        }

                        DataView suppliesDataView = new DataView(suppliesTable);

                        repeaterSupplies.DataSource = suppliesDataView;
                        repeaterSupplies.DataBind();


                    } 
                    else 
                    {
                        lblNoSuppliesMsg.Text = "<tr><td>No Supplies Required</td></tr>";
                    }

                    // Special Instructions
                    if(trip.SpecialInstructions != null && !trip.SpecialInstructions.Equals("")) 
                    {                        
                        lblSpecialInstructions.Text = trip.SpecialInstructions.ToString();
                    }

                    // Catch Grade %'s
                    ArrayList grades = objCatch.CatchGrades;
                    foreach(CatchGrade oneGrade in grades) 
                    {
                        if(oneGrade.GradeId.Equals(Grade.SMALL)) 
                        {
                            // Small
                            lblSmallGrade.Text = oneGrade.Value.ToString();
                            JSSGRADE.Value = oneGrade.Value.ToString();
                        } 
                        else if(oneGrade.GradeId.Equals(Grade.MEDIUM)) 
                        {
                            // Medium
                            lblMediumGrade.Text = oneGrade.Value.ToString();
                            JSMGRADE.Value = oneGrade.Value.ToString();

                        }
                        else if(oneGrade.GradeId.Equals(Grade.LARGE)) 
                        {
                            // Large
                            lblLargeGrade.Text = oneGrade.Value.ToString();
                            JSLGRADE.Value = oneGrade.Value.ToString();

                        }
                        else if(oneGrade.GradeId.Equals(Grade.XLARGE)) 
                        {
                            // XL
                            lblXLGrade.Text = oneGrade.Value.ToString();
                            JSXLGRADE.Value = oneGrade.Value.ToString();

                        }
                    }

                    // Get Ports for this trip
                    ArrayList ports = trip.Ports;
                    ListItemCollection altPorts = new ListItemCollection();
                    foreach(TripPort onePort in ports) 
                    {
                        int portId = onePort.PortId;
                        byte alt = onePort.Alternate;
                        string portName = portBcl.GetPortById(portId).Name;

                        if(alt == 1) 
                        {
                            ddlTripPorts.Items.Add(new ListItem("*" + portName,portId.ToString()));
                        } 
                        else 
                        {
                            altPorts.Add(new ListItem(portName,portId.ToString()));
                        }
                    }
                    ListItem []blah = new ListItem[altPorts.Count];
                    altPorts.CopyTo(blah,0);                    
                    ddlTripPorts.Items.AddRange(blah);


                    // Set grade boxes to 0.000
                    tbSmallGradeAmt.Text = "0.000";
                    tbMediumGradeAmt.Text = "0.000";
                    tbLargeGradeAmt.Text = "0.000";
                    tbXLGradeAmt.Text = "0.000";

                }
                else 
                {
                    // Didnt supply a ID, go back to summary
                    //throw new ApplicationException("No ID given");
                    Response.Redirect(SUMMARY_PAGE);

                }
            }
        }

        public void RefreshHighBid(long auctionId) 
        {

            float highBid = bidBcl.GetHighBidForAuction(auctionId);
            if(highBid != 0) 
            {
                //lblHighBid.Text = FormatUtils.FormatHighBid(highBid.ToString());
                lblHighBid.Text = FormatUtils.FormatThreeDecimal(highBid);
            } 
            else 
            {
                lblHighBid.Text = "No Bids";
            }


        }

        protected void btnSubmit_Click(Object sender, ImageClickEventArgs e) 
        {

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
