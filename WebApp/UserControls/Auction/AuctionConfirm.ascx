<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AuctionConfirm.ascx.cs" Inherits="WebApp.UserControls.Auction.AuctionConfirm" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<HTML>
	<HEAD>
		<title>Live Fish Auction: Borealis Trading Inc.</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/styles.css">
		<style type="text/css">
		</style>
		<script language="javascript">

	function unsetEditFlag() {
		document.__aspnetForm.ucAuctionConfirm_EDITSTEP.value = "NO";
		
		//setCurrentTime();
			
		document.__aspnetForm.submit();		
	}
	function setEditFlag() {
		document.__aspnetForm.ucAuctionConfirm_EDITSTEP.value = "YES";
		document.__aspnetForm.submit();
	}

	function setCancelFlag() {
		document.__aspnetForm.ucAuctionConfirm_EDITSTEP.value = "CANCEL";
		document.__aspnetForm.submit();
	}

    function setCurrentTime() {

        var now = new Date();
        var formattedNow 
            = (now.getMonth() + 1) + "/" + now.getDate() + "/" + now.getFullYear() + " " + now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();     
            
        document.__aspnetForm.ucAuctionConfirm_tbBidTime.value = formattedNow;
    
    }


		</script>
	</HEAD>
	<body bgcolor="#d5dde5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="MAINFORM" id="MAINFORM" runat="server">
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
															<uc:buyerHeader runat="server" id="ucBuyerHeader" />
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


												<table cellSpacing="0" width="350" cellPadding="10" border="0"><tr><td><table cellSpacing="0" cellPadding="1" width="100%" border="0" class="copy_sm_bold_bl">
																<tr><td colspan="2"><b class="copy_sm_bold_bl">Active Auction: Confirm bid</td></tr>
																<tr><td>Lot Details:</td><td>Transaction #<asp:Label ID="lblAuctionId" Runat="server" /> <asp:Label ID="lblSpecies" Runat="server" /></td></tr>
																<tr><td>Closing Time: </td><td><asp:Label ID="lblCloseTime" Runat="server"/></td></tr>
																<tr><td>Time Remaining:</td><td><asp:Label ID="lblTimeLeft" Runat="server"/></td></tr>																											
												
												</table></td></tr></table>


						



<table width="100%" border="0" align="center" cellspacing="0" cellpadding="10" class="copy_sm_bold_bl">
  <tr valign="top">
    <td width="25%" align="left" valign="top" class="copy_sm_bold_bl">Price per Grade:<table border="1" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl">

														
														<tr><td width="50%">Small:</td><td width="50%"><asp:Label ID="lblSmallGradePrice" Runat="server" /></td></tr>
														<tr><td>Medium:</td><td><asp:Label ID="lblMediumGradePrice" Runat="server" /></td></tr>
														<tr><td>Large:</td><td><asp:Label ID="lblLargeGradePrice" Runat="server" /></td></tr>
														<tr><td>XL:</td><td><asp:Label ID="lblXLGradePrice" Runat="server" /></td></tr>
														<tr><td>Avg $/lb:</td><td><asp:Label ID="lblAvgPrice" Runat="server"/></td></tr>


														</table></td>
    <td width="25%" valign="top" align="left">Supplies Needed:<table class="copy_sm_bold_bl" border="1" cellspacing="0" cellpadding="5" valign="top">
														<asp:Repeater ID="repeaterSupplies" Runat="server">
																<ItemTemplate>
																	<tr><td width="50%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYNAME") %>
																	(<%# DataBinder.Eval(Container.DataItem, "SUPPLYUNIT") %>):</td><td width="50%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYVALUE") %></td></tr>
																</ItemTemplate>
															</asp:Repeater>
															<asp:Label ID="lblNoSuppliesMsg" Runat="server" />

															</table></td>
    <td width="25%" align="left" valign="top">Purchase Details:<table border="1" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl"><tr><td width="50%">Total Price:</td>
																<td width="50%"><asp:Label ID="lblTotalPrice" Runat="server" /></td></tr>
																<tr><td>Pickup Port:</td><td>
																<asp:Label ID="lblPickupPort" Runat="server" /></td></tr>
																<tr><td>ETA:</td>
																<td><asp:Label ID="lblEta" Runat="server" /></font></td></tr>
														
													
												</table></td>

<td width="25%" align="left">Special Instructions: <asp:Label ID="lblSpecialInstructions" Runat="server"/></td>
  </tr>
</table>



												
<table border="0" cellspacing="0" cellpadding="5" class="copy_sm_bold_bl" align="center">
													
													<tr align="center">
														<td colspan="3" align="center">Are you sure you wish to submit this bid?</td></tr>
														<tr><td><a href="javascript:unsetEditFlag()"><img src="/images/go_button.gif" border="0"></a></td>
														<td><a href="javascript:setCancelFlag()"><img src="/images/stop_button.gif" border="0"></a></td>
														<td><a href="javascript:setEditFlag()"><img src="/images/edit_button.gif" border="0"></a></td>
													</tr>
												</table>
									</td>
								
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#999999"><table width="800" align="center" border="0" cellspacing="0" cellpadding="10">
  <tr align="right" bgcolor="#999999"><td><span class="copy_sm_bold_wh"><a href="../buyers/default.aspx">Back to Main</a>&nbsp;&nbsp;</td>
  </tr>
</table></td>
				</tr>
			</table>
			<input type="hidden" id="tbTotalBid" runat="server"> 
			<input type="hidden" id="tbAuctionId" runat="server">
			<input type="hidden" id="tbSGrade" runat="server"> 
			<input type="hidden" id="tbMGrade" runat="server">
			<input type="hidden" id="tbLGrade" runat="server"> 
			<input type="hidden" id="tbXGrade" runat="server">
			<input type="hidden" id="tbPort" runat="server">
			<input type="hidden" id="tbTotalAvg" runat="server">
			<input type="hidden" id="tbBidTime" runat="server">
			 <input type="hidden" id="tbStep" runat="server" value="STEP2" NAME="tbStep">
			<input type="hidden" id="EDITSTEP" runat="server" name="EDITSTEP" value="NO">
		</form>
	</body>
</HTML>
