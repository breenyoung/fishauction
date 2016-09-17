<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="WebApp.Auctions._default" %>
<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Live Fish Auction: Borealis Trading Inc.</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/styles.css">
		<style type="text/css">
	</style>
	
	

<meta http-equiv="refresh" content="30">

</HEAD>
	<body bgcolor="#d5dde5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" MS_POSITIONING="FlowLayout">
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
											<uc:buyerHeader runat="server" id="ucBuyerHeader" />
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
				<td bgcolor="#ffffff">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr valign="top">
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="copy_sm_blCopy">
									<tr align="center">
										<td class="copy"><b><br>
												Active Auction: Open and Pending Bids</b><br>
											<span class="smallerCopy">This page will refresh every 30 seconds<br>
												<B>NOTE: Select transaction number to bid on a lot.</b></span><br>
											........................................................................................................................................................
										</td>
									</tr>									
									<tr align="center">
										<td>
											<table border="1" cellpadding="5" cellspacing="0" width="95%" class="copy_sm_blCopy" align="center">
												<TBODY>
													<tr align="center" bgcolor="#ffffff" class="copy_sm_bold_bl">
														<td class="copy_sm_bold_wh"><b class="copy_sm_bold_bl"> Trans ID</b></td>
														<td><b>Preferred<br>
																Landing</b></td>
														<td><b>Pounds</b></td>
														<td><b>Fishing<BR>Area</b></td>
														<td><b>Days<br>
																At Sea</b></td>
														<td><b> Hold </b>
														</td>
														<td class="copy_sm_bold_bl"><b>SM</b></td>
														<td class="copy_sm_bold_bl"><b>M</b></td>
														<td class="copy_sm_bold_bl"><b>L</b></td>
														<td class="copy_sm_bold_bl"><b>XL</b></td>
														<td><b>Hrs
																<br>
																ETA</b></td>
														<td class="copy_sm_bold_bl"><b>High<br>
																Bid</b></td>
														<td class="copy_sm_bold_bl"><b>Closing
																<br>
																Time</b></td>
														<td class="copy_sm_bold_bl"><b>Time
																<br>
																Rem.</b></td>
													</tr>
													<asp:Repeater id="repeaterAuctions" Runat="server">
														<ItemTemplate>
															<tr>
															<td><b><a href='auctionDetails.aspx?id=<%# DataBinder.Eval(Container.DataItem, "TRANSID") %>'><%# DataBinder.Eval(Container.DataItem, "DISPLAYID") %></a></b></td>
															<td><%# DataBinder.Eval(Container.DataItem, "PLANDING") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "QUANTITY") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "AREA") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "DAYSOUT") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "HOLD") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "SGRADE") %>%</td>
															<td><%# DataBinder.Eval(Container.DataItem, "MGRADE") %>%</td>
															<td><%# DataBinder.Eval(Container.DataItem, "LGRADE") %>%</td>
															<td><%# DataBinder.Eval(Container.DataItem, "XLGRADE") %>%</td>
															<td><%# DataBinder.Eval(Container.DataItem, "ETA") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "HIGHBID") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "CLOSETIME") %></td>
															<td><%# DataBinder.Eval(Container.DataItem, "REMAINTIME") %></td>

															</tr>
														</ItemTemplate>
													</asp:Repeater>
													<asp:label id="lblNoAuctionsMsg" runat="server"><tr><td align=center colspan=14>No Active Auctions</td></tr></asp:label>
													<asp:label id="lblAuctionCloseMsg" runat="server"><tr><td align=center colspan=14>Auction Day has Now Ended</td></tr></asp:label>
													<asp:label id="lblProcessorSuspendedMsg" runat="server"><tr><td align=center colspan=14>This Processor has been temporarily suspended from trading. Please contact <a href="mailto:accounts@shrimpauction.ca">accounts@shrimpauction.ca</a> for more information</td></tr></asp:label>
								</table>
							</td>
						</tr>
					</table>
					<br>
				</td>
			</tr>
		</table></TD></TR>
		<tr>
			<td bgcolor="#999999"><table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr align="right" bgcolor="#999999"> 
    <td><span class="copy_sm_bold_wh"><a href="../buyers/default.aspx">Back to Main</a>&nbsp;&nbsp;</td>
  </tr>
</table></td>
		</tr></TBODY></TABLE>
	</body>
</HTML>