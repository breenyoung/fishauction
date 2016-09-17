namespace WebApp.UserControls
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		Summary description for AccountDetailsWidget.
	/// </summary>
	public class AccountDetailsWidget : System.Web.UI.UserControl
	{
        protected System.Web.UI.WebControls.Label lblBuyerFunds;
        protected System.Web.UI.WebControls.Label lblBuyerOtherBids;
        protected System.Web.UI.WebControls.Label lblBuyerTodaysPurchases;

		private void Page_Load(object sender, System.EventArgs e)
		{
            // Bottom Right Account Details
            lblBuyerFunds.Text = "*TODO*";
            lblBuyerOtherBids.Text = "*TODO*";
            lblBuyerTodaysPurchases.Text = "*TODO*";
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
