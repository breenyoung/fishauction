<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AuctionSuccess.ascx.cs" Inherits="WebApp.UserControls.Auction.AuctionSuccess" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<head>
<link rel="stylesheet" href="/styles.css">
</head>

<body bgcolor="#d5dde5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form runat="server">
			<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr bgcolor="#000000" align="right">
					<td>
						<table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
							<tr>
								<td bgcolor="#000000" valign="top">
									<img src="/images/splash_800_01.gif" width="409" height="61">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
										<tr>
											<td>
												<table width="100%" border="0" cellpadding="10">
													<tr>
														<td>
															</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td bgcolor="#000000" valign="top"><img src="/images/splash_02.gif" width="391" height="123"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr valign="top">
					<td bgcolor="#ffffff" valign="top">



						
												<table cellpadding="10" class="copy_sm_bold_bl"><tr><td>Bid Confirmation: Lot# <asp:Label ID="lblAuctionId" Runat="server"/>
												<BR></b>Please print a copy of this report for your records. This is your confirmation.<BR>
												</td</tr></table>



<table width="100%" border="0" align="center" cellspacing="0" cellpadding="20" class="copy_sm_bold_bl">
  <tr valign="top">
    <td width="30% valign="top" class="copy_sm_bold_bl">Price per Grade:<table border="1" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">

														
														<tr><td width="50%">Small:</td><td width="50%"><asp:Label ID="lblSmallGradePrice" Runat="server" /></td></tr>
														<tr><td>Medium:</td><td><asp:Label ID="lblMediumGradePrice" Runat="server" /></td></tr>
														<tr><td>Large:</td><td><asp:Label ID="lblLargeGradePrice" Runat="server" /></td></tr>
														<tr><td>XL:</td><td><asp:Label ID="lblXLGradePrice" Runat="server" /></td></tr>
														<tr><td>Avg $/lb:</td><td><asp:Label ID="lblAvgPrice" Runat="server"/></td></tr>


														</table></td>
    <td width="30% valign="top">Supplies Needed:<table class="copy_sm_bold_bl" border="1" cellspacing="0" cellpadding="5" valign="top">
														<asp:Repeater ID="repeaterSupplies" Runat="server">
																<ItemTemplate>
																	<tr><td width="50%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYNAME") %>
																	(<%# DataBinder.Eval(Container.DataItem, "SUPPLYUNIT") %>):</td><td width="50%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYVALUE") %></td></tr>
																</ItemTemplate>
															</asp:Repeater>
															<asp:Label ID="lblNoSuppliesMsg" Runat="server" />

															</table></td>
    <td width="30% valign="top">Purchase Details:<table border="1" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl"><tr><td width="50%">Total Price:</td>
																<td width="50%"><asp:Label ID="lblTotalPrice" Runat="server" /></td></tr>
																<tr><td>Pickup Port:</td><td>
																<asp:Label ID="lblPickupPort" Runat="server" /></td></tr>
																<tr><td>ETA:</td>
																<td><asp:Label ID="lblEta" Runat="server" /></font></td></tr>
														
													
</table></td>
 </tr>


</table>

					

</td>
								
</tr>
<tr><td bgcolor="#666666" align="right"><table cellpadding="5"><tr><td class="copy_sm_bold_wh"><a href="/Buyers/summary.aspx">Go To Buyers Summary</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/Auctions/">Go To Active Auctions</a>
</td></tr></table></td</tr>

</table>
</td>
</tr>
				
<tr><td </td>
</tr>

</table>
	
<input type="hidden" name="tbHasBid" runat="server" value="YES"/>			
</form>			
</body>



</html>