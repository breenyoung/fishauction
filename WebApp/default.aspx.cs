using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Components.Entities;
using Components.Bcl;
using Components.Utils.Formatting;

using WebApp.Classes;

namespace WebApp
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{

        protected System.Web.UI.WebControls.TextBox tbUsername;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqUsername;
        protected System.Web.UI.WebControls.TextBox tbPassword;
        protected System.Web.UI.WebControls.RequiredFieldValidator reqPassword;
        protected System.Web.UI.WebControls.Label lblErrorMsg;
        protected System.Web.UI.WebControls.Button btnSubmit;
        protected System.Web.UI.WebControls.Label lblToday;
        protected System.Web.UI.WebControls.Label lblTimeLeft;
        protected System.Web.UI.WebControls.Label lblLiveAuctions;

		private void Page_Load(object sender, System.EventArgs e)
		{

            if(IsPostBack) 
            {

                // Check if user has capable browser first                
                if(!checkBrowser(Page.Request.Browser)) 
                {
                    Response.Redirect("/systemReqs.aspx");
                }
                

                // Attempt login
                string username = tbUsername.Text;
                string password = tbPassword.Text;

                // Get Buyer BCL handle
                BuyerBcl buyerBcl = BuyerBcl.GetInstance();
                Buyer oneBuyer 
                    = buyerBcl.GetBuyerByUsername(username);

                if(oneBuyer == null) 
                {
                    // Display error
                    lblErrorMsg.Visible = true;
                } 
                else 
                {
                    // Check PW
                    if(password.Equals(oneBuyer.Password)) 
                    {
                        // User/pass valid, log them in
                        if(Request.QueryString["ReturnUrl"]==null || Request.QueryString["ReturnUrl"]=="" ) 
                        {
                            FormsAuthentication.SetAuthCookie(oneBuyer.Id.ToString(),false);
                            Response.Redirect("/Buyers/default.aspx");
                        } 
                        else 
                        {
                            FormsAuthentication.RedirectFromLoginPage(oneBuyer.Id.ToString(),false);
                        }
                    } 
                    else 
                    {
                        lblErrorMsg.Visible = true;
                    }

                }

            } 
            else 
            {
                // First Display

                DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);

                // Auction time is 8-6pm(8-18) daily 
                string hoursMins = today.Hour.ToString() + "." + today.Minute.ToString();
                double timeLeft = 18.00 - (double.Parse(hoursMins));

                if(today.Hour < 8) 
                {
                    lblTimeLeft.Text = "Auction day has ended";

                    // Dont show any active auctions once day is closed
                    lblLiveAuctions.Text = "0";

                } 
                else 
                {
                    if(timeLeft < 0) 
                    {
                        lblTimeLeft.Text = "Auction day has ended";

                        // Dont show any active auctions once day is closed
                        lblLiveAuctions.Text = "0";

                    } 
                    else 
                    {
                        lblTimeLeft.Text = "Auction day expires in: " + String.Format("{0:0.00}",timeLeft) + " hours";

                        // Get current live auctions
                        AuctionBcl auctionBcl = AuctionBcl.GetInstance();
                        int activeAuctions = auctionBcl.GetActiveAuctionCount();
                        lblLiveAuctions.Text = activeAuctions.ToString();

                    }      
                }

                lblToday.Text = String.Format("{0:dddd, MMM dd, yyyy HH:mm}",today) + " NST";
                lblErrorMsg.Visible = false;
                              
            }  
        }

        private bool checkBrowser(HttpBrowserCapabilities caps) 
        {

            bool browserValid = true;

            // Check for cookies
            if(!caps.Cookies) { browserValid = false; }

            // Check for JScript
            if(!caps.JavaScript) { browserValid = false; }
           
            // Check for version >= to 6
            int browserVer = caps.MajorVersion;
            if(browserVer < 6) { browserValid = false; }

            // Check for IE browser
            if(Request.UserAgent.IndexOf("MSIE") == -1)
            {
                //if(!caps.Equals("IE")) { 
                browserValid = false; 
            }

            /*
            if(browserValid) 
            {
                // Browser has right caps

                // Now check if cookies are on
                HttpCookie testCookie = new HttpCookie("SHRIMPAUCTION","TESTCOOKIE");
                Response.SetCookie(testCookie);

                HttpCookieCollection cookies = Request.Cookies;                 
                if(cookies["SHRIMPTEST"] == null) 
                {
                    // Doesnt have cookies turned on
                    browserValid = false;
                } 
                else 
                {
                    // Remove Test cookie
                    cookies.Remove("SHRIMPTEST");
                }
            }
*/

            return browserValid;

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
