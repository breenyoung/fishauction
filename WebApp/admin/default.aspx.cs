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
using System.Web.Security;

using Components.Bcl;
using Components.Entities;
using Components.Utils.Formatting;

namespace WebApp.admin
{
	/// <summary>
	/// Summary description for _default.
	/// </summary>
	public class _default : System.Web.UI.Page
	{

        protected System.Web.UI.WebControls.Label lblTimeLeft;
        protected System.Web.UI.WebControls.Label lblVesselsAtSea;
        protected System.Web.UI.WebControls.Label lblToday;
        protected System.Web.UI.WebControls.Label lblErrorMsg;

        protected System.Web.UI.WebControls.TextBox tbUsername;
        protected System.Web.UI.WebControls.TextBox tbPassword;

		private void Page_Load(object sender, System.EventArgs e)
		{

            if(IsPostBack) 
            {
                Page.Validate();
                if(Page.IsValid) 
                {
                    // Log the admin user in
                    AdminUserBcl adminUserBcl = AdminUserBcl.GetInstance();

                    AdminUser adminUser 
                        = adminUserBcl.GetUserByUsername(tbUsername.Text);
                    if(adminUser == null) 
                    {
                        // User doesnt exist
                        lblErrorMsg.Visible = true;
                    } 
                    else 
                    {
                        if(adminUser.Password.Equals(tbPassword.Text)) 
                        {
                            // Create auth cookie
                            //HttpCookie authCookie = new HttpCookie("ADMINAUTH", adminUser.Id.ToString());
                            Response.Cookies["ADMINAUTH"].Value = adminUser.Id.ToString();

                            // User/pass valid, log them in
                            if(Request.QueryString["ReturnUrl"]==null || Request.QueryString["ReturnUrl"]=="" ) 
                            {
                                Response.Redirect("/admin/index_panel_op.asp");
                            } 
                            else 
                            {
                                Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                            }

                        } 
                        else 
                        {
                            // Bad password
                            lblErrorMsg.Visible = true;
                        }
                    }
                }
            }
            else 
            {
                // Initial Page display
                lblErrorMsg.Visible = false;

                DateTime today = FormatUtils.ToNSTTime(System.DateTime.UtcNow);
                lblToday.Text = String.Format("{0:MM/dd/yyyy HH:mm}",today) + " NST";

                // Auction time is 8-6pm(8-18) daily 
                string hoursMins = today.Hour.ToString() + "." + today.Minute.ToString();
                double timeLeft = 18.00 - (double.Parse(hoursMins));
                if(timeLeft < 0) 
                {
                    lblTimeLeft.Text = "Auction day has ended";
                } 
                else 
                {
                    lblTimeLeft.Text = "Auction day expires in: " + String.Format("{0:0.00}",timeLeft) + " hours";
                }      

                // Get number of vessels at sea
                TripBcl tripBcl = TripBcl.GetInstance();
                ArrayList openTrips = tripBcl.GetOpenTrips();

                lblVesselsAtSea.Text = openTrips.Count.ToString();
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
