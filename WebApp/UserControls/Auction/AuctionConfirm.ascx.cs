namespace WebApp.UserControls.Auction
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
    using System.Collections;

    using Components.Entities;
    using Components.Bcl;
    using Components.Utils.Formatting;

	/// <summary>
	///		Summary description for AuctionConfirm.
	/// </summary>
    public class AuctionConfirm : System.Web.UI.UserControl
    {


        #region WebControls

        protected System.Web.UI.WebControls.Label lblAuctionId;
        protected System.Web.UI.WebControls.Label lblSpecies;
        //protected System.Web.UI.WebControls.Label lblLotSize;
        protected System.Web.UI.WebControls.Label lblSmallGradePrice;
        protected System.Web.UI.WebControls.Label lblMediumGradePrice;
        protected System.Web.UI.WebControls.Label lblLargeGradePrice;
        protected System.Web.UI.WebControls.Label lblXLGradePrice;
        protected System.Web.UI.WebControls.Label lblTotalPrice;
        protected System.Web.UI.WebControls.Label lblPickupPort;
        protected System.Web.UI.WebControls.Label lblEta;
        protected System.Web.UI.WebControls.Label lblAvgPrice; 
        protected System.Web.UI.WebControls.Label lblCloseTime; 
        protected System.Web.UI.WebControls.Label lblTimeLeft;        
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbStep;
        protected System.Web.UI.WebControls.Button btnCancel;
        protected System.Web.UI.WebControls.Repeater repeaterSupplies;
        protected System.Web.UI.WebControls.Label lblNoSuppliesMsg;
        protected System.Web.UI.WebControls.Label lblSpecialInstructions;

        protected System.Web.UI.HtmlControls.HtmlInputHidden EDITSTEP;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbTotalBid;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbAuctionId;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbSGrade;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbMGrade;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbLGrade;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbXGrade;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbTotalAvg;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbPort;
        protected System.Web.UI.HtmlControls.HtmlInputHidden tbBidTime;
        #endregion

        #region Private Variables
        private bool _visible;
        private decimal _bidTotal;
        private float _pricePerSmallGrade;
        private float _pricePerMediumGrade;
        private float _pricePerLargeGrade;
        private float _pricePerXLGrade;
        private float _avgPerLb;
        private long _catchId;
        private int _portSelected;
        private long _auctionId;
        private bool _backToEdit;
    
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

        public bool BackToEdit
        {
            get { return _backToEdit; }
            set { _backToEdit = value; }
        }
        #endregion


        public void LoadControlValues() 
        {
            CatchBcl catchBcl = CatchBcl.GetInstance();
            SpeciesBcl speciesBcl = SpeciesBcl.GetInstance();
            PortBcl portBcl = PortBcl.GetInstance();
            SupplyBcl supplyBcl = SupplyBcl.GetInstance();
            TripBcl tripBcl = TripBcl.GetInstance();
            AuctionBcl auctionBcl = AuctionBcl.GetInstance();

            long catchId = this._catchId;

            Catch objCatch = catchBcl.GetCatchById(catchId);
            Trip trip = tripBcl.GetTripByLotId(this._auctionId);
            Auction auction = auctionBcl.GetAuctionById(this._auctionId);

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

            // Load Label values
            
            lblAuctionId.Text = FormatUtils.FormatTransactionId(this._auctionId.ToString());
            lblSmallGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerSmallGrade);
            lblMediumGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerMediumGrade);
            lblLargeGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerLargeGrade);
            lblXLGradePrice.Text = FormatUtils.FormatThreeDecimal(this._pricePerXLGrade);
            lblTotalPrice.Text = String.Format("{0:c}",this._bidTotal);

            // ETA
            //TimeSpan etaDaysLeft = FormatUtils.ToNSTTime(System.DateTime.UtcNow).Subtract(trip.HailInDate);
            //TimeSpan etaDaysToHours = new TimeSpan(etaDaysLeft.Days, etaDaysLeft.Hours,0,0,0);                        
            //string eta = etaDaysToHours.TotalHours.ToString().PadLeft(2,'0') + ":" + etaDaysLeft.Minutes.ToString().PadLeft(2,'0');
            string eta = String.Format("{0:MM/dd HH:mm}",trip.HailInDate);
            lblEta.Text = eta;


            lblSpecies.Text = speciesBcl.GetSpeciesById(objCatch.SpeciesId).Name;
            //lblLotSize.Text = FormatUtils.FormatCommas(objCatch.Quantity);
            lblPickupPort.Text = portBcl.GetPortById(this._portSelected).Name;
            //lblAvgPrice.Text = FormatUtils.FormatHighBid(this._avgPerLb.ToString());
            lblAvgPrice.Text = FormatUtils.FormatThreeDecimal(this._avgPerLb);

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
                    timeLeft = daysLeft.Hours + " hrs " + daysLeft.Minutes + " mins";
                }
            }
            lblTimeLeft.Text = timeLeft;


            // Special Instructions
            if(trip.SpecialInstructions != null && !trip.SpecialInstructions.Equals("")) 
            {                        
                lblSpecialInstructions.Text = trip.SpecialInstructions.ToString();
            }


            // Load Hidden form fields
            tbAuctionId.Value = this._auctionId.ToString();
            tbTotalBid.Value = this._bidTotal.ToString();
            tbTotalAvg.Value = this._avgPerLb.ToString();
            tbSGrade.Value = this._pricePerSmallGrade.ToString();
            tbMGrade.Value = this._pricePerMediumGrade.ToString();
            tbLGrade.Value = this._pricePerLargeGrade.ToString();
            tbXGrade.Value = this._pricePerXLGrade.ToString();
            tbPort.Value = this._portSelected.ToString();
        }

        private void Page_Load(object sender, System.EventArgs e)
        {

            if(IsPostBack) 
            {

            } 
            else 
            {

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
