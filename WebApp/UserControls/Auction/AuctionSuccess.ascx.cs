namespace WebApp.UserControls.Auction
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
    using System.Collections;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

    using Components.Utils.Formatting;
    using Components.Bcl;
    using Components.Entities;
    
    using aspNetEmail;

	/// <summary>
	///		Summary description for AuctionSuccess.
	/// </summary>
	public class AuctionSuccess : System.Web.UI.UserControl
	{

        #region Web Controls
        protected System.Web.UI.WebControls.Label lblSmallGradePrice;
        protected System.Web.UI.WebControls.Label lblMediumGradePrice;
        protected System.Web.UI.WebControls.Label lblLargeGradePrice;
        protected System.Web.UI.WebControls.Label lblXLGradePrice;
        protected System.Web.UI.WebControls.Repeater repeaterSupplies;
        protected System.Web.UI.WebControls.Label lblNoSuppliesMsg;
        protected System.Web.UI.WebControls.Label lblTotalPrice;
        protected System.Web.UI.WebControls.Label lblPickupPort;
        protected System.Web.UI.WebControls.Label lblEta;
        protected System.Web.UI.WebControls.Label lblAvgPrice; 
        protected System.Web.UI.WebControls.Label lblAuctionId;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbHasBid;
        #endregion

        #region Private Variables
        private decimal _bidTotal;
        private float _pricePerSmallGrade;
        private float _pricePerMediumGrade;
        private float _pricePerLargeGrade;
        private float _pricePerXLGrade;
        private float _avgPerLb;
        private long _catchId;
        private int _portSelected;
        private long _auctionId;
    
        #endregion

        #region Getters/Setters
        public long AuctionId
        {
            get { return _auctionId; }
            set { _auctionId = value; }
        }

        public decimal BidTotal
        {
            get { return _bidTotal; }
            set { _bidTotal = value; }
        }
        
        public float PricePerSmallGrade
        {
            get { return _pricePerSmallGrade; }
            set { _pricePerSmallGrade = value; }
        }

        public float PricePerMediumGrade
        {
            get { return _pricePerMediumGrade; }
            set { _pricePerMediumGrade = value; }
        }

        public float PricePerLargeGrade
        {
            get { return _pricePerLargeGrade; }
            set { _pricePerLargeGrade = value; }
        }

        public float PricePerXLGrade
        {
            get { return _pricePerXLGrade; }
            set { _pricePerXLGrade = value; }
        }

        public float AvgPerLb
        {
            get { return _avgPerLb; }
            set { _avgPerLb = value; }
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


        public void LoadControlValues()  
        {

            // Get BCL handles
            PortBcl portBcl = PortBcl.GetInstance();
            TripBcl tripBcl = TripBcl.GetInstance();
            CatchBcl catchBcl = CatchBcl.GetInstance();
            SupplyBcl supplyBcl = SupplyBcl.GetInstance();

            // Get logged in user
            string firstName = "";
            string lastName = "";
            string buyerEmailAddress = "";
            string buyerProcessor = "";
            if(Page.User.Identity.IsAuthenticated) 
            {
                long userId = long.Parse(Page.User.Identity.Name);
                Buyer curBuyer = BuyerBcl.GetInstance().GetUserById(userId);
                firstName = curBuyer.FirstName;
                lastName = curBuyer.LastName;
                buyerEmailAddress = curBuyer.Email;
                
                Processor processor 
                    = ProcessorBcl.GetInstance().GetProcessorById(curBuyer.ProcessorId);

                buyerProcessor = processor.Name;

            }
            //*********************************************
            

            Trip trip = tripBcl.GetTripByLotId(this._auctionId);
            Port port = portBcl.GetPortById(this._portSelected);
            Catch objCatch = catchBcl.GetCatchByTripId(trip.Id);
            

            lblSmallGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerSmallGrade);
            lblMediumGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerMediumGrade);
            lblLargeGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerLargeGrade);
            lblXLGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerXLGrade);
            lblTotalPrice.Text = String.Format("{0:c}",this._bidTotal);
            lblPickupPort.Text = port.Name;
            lblAuctionId.Text = FormatUtils.FormatTransactionId(this._auctionId.ToString());
            //lblAvgPrice.Text = FormatUtils.FormatHighBid(this._avgPerLb.ToString());
            lblAvgPrice.Text = FormatUtils.FormatThreeDecimal(this._avgPerLb);

            // ETA
            //TimeSpan etaDaysLeft = FormatUtils.ToNSTTime(System.DateTime.UtcNow).Subtract(trip.HailInDate);
            //TimeSpan etaDaysToHours = new TimeSpan(etaDaysLeft.Days, etaDaysLeft.Hours,0,0,0);                        
            //string eta = etaDaysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + etaDaysLeft.Minutes.ToString().PadLeft(2,'0');
            string eta = String.Format("{0:MM/dd HH:mm}",trip.HailInDate);
            lblEta.Text = eta;

            string spInstruts = "";
            if(trip.SpecialInstructions != null && !trip.SpecialInstructions.Equals("")) 
            {
                spInstruts += "Special Instructions: \n";
                spInstruts += trip.SpecialInstructions + "\n";
            }

            string supplyListEmail = "";
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

                    supplyListEmail += oneSupply.Name + " (" + oneSupply.UnitType + "): ";

                    oneDataRow["SUPPLYNAME"] = oneSupply.Name;
                    oneDataRow["SUPPLYUNIT"] = oneSupply.UnitType;
                    if(oneSupply.UnitType.Equals("tons")) 
                    {
                        oneDataRow["SUPPLYVALUE"] = FormatUtils.FormatOneDecimal(oneCatchSupply.Value);
                        supplyListEmail += FormatUtils.FormatOneDecimal(oneCatchSupply.Value) + "\n" ;

                    } 
                    else 
                    {
                        oneDataRow["SUPPLYVALUE"] = FormatUtils.FormatCommas(oneCatchSupply.Value);
                        supplyListEmail += FormatUtils.FormatCommas(oneCatchSupply.Value) + "\n" ;
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

            #region Send Confirmation Email
            // Send a confirm email
            EmailMessage email = new EmailMessage("localhost");
            email.To = buyerEmailAddress;
            email.FromAddress = "auction@shrimpauction.ca";
            email.Subject = "Bid Confirmation Report";
            email.BodyFormat = MailFormat.Text;
            email.Body = "Borealis Trading & ShrimpAuction.ca\n" +
                "Bid Confirmation Report\n" + 
                "For: " + firstName + " " + lastName + ", " + buyerProcessor + "\n" + 
                "Transaction ID: " + lblAuctionId.Text +
                "\n\n" +
                "You are currently the high bidder on this auction.\n" +
                "\n" +
                "Purchase Total: " + lblTotalPrice.Text + "\n" +
                "Pick Up Port: " + lblPickupPort.Text + "\n" +
                "ETA: " + lblEta.Text + "\n" +
                "\n" +
                spInstruts + 
                "Supplies Needed:\n" +
                supplyListEmail + "\n" +
                "Price/Lot breakdown:\n" + 
                "S: " + lblSmallGradePrice.Text + "\n" +
                "M: " + lblMediumGradePrice.Text + "\n" +
                "L: " + lblLargeGradePrice.Text + "\n" +
                "XL: " + lblXLGradePrice.Text + "\n" +
                "Average Price/lb: " + lblAvgPrice.Text + "\n";
            email.Send();
            #endregion

        }

		private void Page_Load(object sender, System.EventArgs e)
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
