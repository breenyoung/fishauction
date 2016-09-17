<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AuctionDetails.ascx.cs" Inherits="WebApp.UserControls.Auction.AuctionDetails" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<HTML>
	<HEAD>
		<title>Live Fish Auction: Borealis Trading Inc.</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<LINK href="/styles.css" rel="stylesheet">
		<style type="text/css">
		</style>
	</HEAD>
	<body bgColor="#d5dde5" leftMargin="0" topMargin="0" marginheight="0" marginwidth="0">
		<form id="MAINFORM" name="MAINFORM" runat="server" onsubmit="setTotal()">
			<input type="hidden" id="tbBidTotal" runat="server" NAME="tbBidTotal" value="0.00">
			<input type="hidden" id="tbBidAverage" runat="server" NAME="tbBidAverage" value="0.000">

			<input type="hidden" id="tbCatchId" runat="server" name="tbCatchId"> <input type="hidden" id="tbAuctionId" runat="server" name="tbAuctionId">
			<input type="hidden" id="JSQUANTITY" runat="server" name="JSQUANTITY"> <input type="hidden" id="JSSGRADE" runat="server" name="JSSGRADE">
			<input type="hidden" id="JSMGRADE" runat="server" name="JSMGRADE"> <input type="hidden" id="JSLGRADE" runat="server" name="JSLGRADE">
			<input type="hidden" id="JSXLGRADE" runat="server" name="JSXLGRADE"> <input type="hidden" id="tbStep" runat="server" value="STEP1" NAME="tbStep">
			<table cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr align="right" bgColor="#000000">
					<td>
						<table cellSpacing="0" cellPadding="0" width="800" bgColor="#000000" border="0">
							<tr>
								<td vAlign="top" bgColor="#000000"><IMG height="61" src="/images/splash_800_01.gif" width="409">
									<table cellSpacing="0" cellPadding="0" width="100%" bgColor="#000000" border="0">
										<tr>
											<td><uc:buyerheader id="ucBuyerHeader" runat="server"></uc:buyerheader></td>
										</tr>
									</table>
								</td>
								<td vAlign="top" bgColor="#000000"><IMG height="123" src="/images/splash_02.gif" width="391"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr vAlign="top">
					<td bgColor="#ffffff">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td vAlign="top">
									<table cellSpacing="0" cellPadding="0" width="100%" border="0">
										<tr vAlign="top">
											<td valign="top">
												<table cellSpacing="0" width="350" cellPadding="10" border="0"><tr><td><table cellSpacing="0" cellPadding="1" width="100%" border="0" class="copy_sm_bold_bl">
																<tr><td colspan="2"><b class="copy_sm_bold_bl">Active Auction: Place bid</td></tr>
																<tr><td>Lot Details:</td><td>Transaction #<asp:label id="lblAuctionId" Runat="server"></asp:label> <asp:label id="lblSpecies" Runat="server"></asp:label></td></tr>
																<tr><td>Closing Time: </td><td><asp:label id="lblCloseTime" Runat="server"></asp:label></td></tr>
																<tr><td>Time Remaining:</td><td><asp:label id="lblTimeLeft" Runat="server"></asp:label></td></tr>					

																											
												
												</table></td></tr></table>
											</td>
										</tr>
										<tr vAlign="top">





<table width="750" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr>
    <td valign="top" align="center"><table cellSpacing="0" cellPadding="2" border="1" class="copy_sm_bold_gr" width="240">
<span class="copy_sm_bold_bl">Lot Details:</span><br>
																<tr><td width="50%">Lot Size:</td><td width="50%"><asp:label id="lblLotSize" Runat="server"></asp:label> pounds</td></tr>
																<tr><td>Fishing Area:</td><td><asp:Label ID="lblArea" Runat="server"/></td></tr>
																<tr><td>Days at Sea:</td><td><asp:label id="lblDaysAtSea" Runat="server"></asp:label></td></tr>
																<tr><td>Hold Method:</td><td><asp:label id="lblHoldMethod" Runat="server"></asp:label></td></tr>
																<tr><td>ETA:</td><td><asp:label id="lblEta" Runat="server"></asp:label></td></tr>
																								
												</table></td>
    <td valign="top"><table cellSpacing="0" cellPadding="10" width="100%" border="0" width="240">
													
														<tr vAlign="top">
															<td><span class="copy_sm_bold_bl">Catch Profile:</span><br>
																<table class="copy_sm_bold_gr" cellSpacing="0" cellPadding="5" width="240" border="1">
																	<asp:repeater id="repeaterDays" Runat="server">
																		<ItemTemplate>
																			<tr>
																				<td width="34%"><%# DataBinder.Eval(Container.DataItem, "DAYNAME") %></td>
																				<td width="66%"><%# DataBinder.Eval(Container.DataItem, "DAYPOUNDS") %>
																					pounds</td>
																			</tr>
																		</ItemTemplate>
																	</asp:repeater>
																</table>	</td>
    <td valign="top"><table cellSpacing="0" cellPadding="2" border="0" class="copy_sm_bold_bl" width="240">
																<tr><td>Supplies 
																Required:<br><table class="copy_sm_bold_gr" cellSpacing="0" cellPadding="5" width="100%" bgColor="#ffffff"
																	border="1">
																	<asp:repeater id="repeaterSupplies" Runat="server">
																		<HeaderTemplate>
																			<tr>
																		</HeaderTemplate>
																		<ItemTemplate>
																			<td width="34%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYNAME") %>
																				(<%# DataBinder.Eval(Container.DataItem, "SUPPLYUNIT") %>)</td>
																			<td width="66%"><%# DataBinder.Eval(Container.DataItem, "SUPPLYVALUE") %></td></tr>
																		</ItemTemplate>

																</asp:repeater>
																</table>
														<asp:label id="lblNoSuppliesMsg" Runat="server"></asp:label></table></td>
  														</tr>
															</table></td></tr>









<tr><td><table cellpadding="5"><tr><td class="copy_sm_bold_bl">Special Instructions: <asp:Label ID="lblSpecialInstructions" Runat="server"/></td></tr></table></td></tr>

												
							<tr>
								<td colSpan="2"><b class="copy_sm_bold_bl"></b>
									<hr noShade SIZE="1">
									<table cellSpacing="0" cellPadding="5" width="100%" border="0">
										<tr>
											<td><table width="100% cellpadding=2 border="0" bgcolor="#F5F5CF"><tr><td><b class="copy_sm_bold_bl">Input Price per Size of Shrimp<br>
													NOTE: Your bid will only be accepted if it is higher than the current high bid of: <asp:label id="lblHighBid" Runat="server"></asp:label><br></b><br></td></tr></table
												<b class="copy_sm_bold_bl"><font color="#ff0000">
														<asp:label id="lblOutBidMsg" Runat="server"></asp:label></font></b>
												<table cellSpacing="0" cellPadding="5" width="100%" border="1">
													<tr>
														<td class="copy_sm_bold_bl" align="center" colSpan="4">Catch Distributions</td>
														<td class="copy_sm_bold_bl" width="9%">&nbsp;</td>
														<td class="copy_sm_bold_bl" width="11%">&nbsp;</td>
														<td class="copy_sm_bold_bl" width="18%">&nbsp;</td>
<td rowspan="4" align="center"><asp:ImageButton ID="btnSubmit" ImageUrl="/images/go_button.gif" Width="100" Height="83" OnClick="btnSubmit_Click"
																Runat="server" /><br>
<a href="/Auctions/"><IMG Width="100" Height="83" border="0" src="/images/stop_button.gif" width="391"></a>

</td>
													</tr>
													<tr>
														<td class="copy_sm_bold_gr" align="center" width="11%"><asp:label id="lblSmallGrade" Runat="server"></asp:label>%</td>
														<td class="copy_sm_bold_gr" align="center" width="11%"><asp:label id="lblMediumGrade" Runat="server"></asp:label>%</td>
														<td class="copy_sm_bold_gr" align="center" width="11%"><asp:label id="lblLargeGrade" Runat="server"></asp:label>%</td>
														<td class="copy_sm_bold_gr" align="center" width="11%"><asp:label id="lblXLGrade" Runat="server"></asp:label>%</td>
														<td class="copy_sm_bold_bl" width="9%">Average</td>
														<td class="copy_sm_bold_bl" width="11%">Total</td>
														<td class="copy_sm_bold_bl" width="18%">Select Landing</td>
													</tr>
													<tr>
														<td class="copy_sm_bold_gr" align="center" width="11%">Small</td>
														<td class="copy_sm_bold_gr" align="center" width="11%">Medium</td>
														<td class="copy_sm_bold_gr" align="center" width="11%">Large</td>
														<td class="copy_sm_bold_gr" align="center" width="11%">XLarge</td>
														<td class="copy_sm_bold_bl" width="9%">Price/lb</td>
														<td class="copy_sm_bold_bl" width="11%">Purchase</td>
														<td class="copy_sm_bold_gr" width="18%">*Indicates preferred</td>
													</tr>
													<tr>
														<td class="copy_sm_bold_bl" width="11%" valign="top">$<asp:textbox id="tbSmallGradeAmt" onblur="formatDecimal(this);updateTotal()" Runat="server" size="2" MaxLength="5"/>
															<asp:requiredfieldvalidator id="reqFieldSmallGrade" Runat="server" Display="Dynamic" EnableClientScript="True"
																ErrorMessage="*" ControlToValidate="tbSmallGradeAmt" />
															<asp:CustomValidator ID="custSGrade" Runat="server" ControlToValidate="tbSmallGradeAmt" ErrorMessage="Bid must be less than 1.99" ClientValidationFunction="checkGradeMax" Display="Static"/>																
															<asp:regularexpressionvalidator validationexpression="^([0-9]*|\d*\.(\d{1}|\d{2}|\d{3}))$" 
																							id="regFieldSmallGrade" 
																							runat="server" 
																							controltovalidate="tbSmallGradeAmt" 
																							errormessage="Invalid amount" 
																							enableclientscript="True" 
																							display="Static"/>
																</td>
														<td class="copy_sm_bold_bl" width="11%" valign="top">$<asp:textbox id="tbMediumGradeAmt" onblur="formatDecimal(this);updateTotal()" Runat="server" size="2"  MaxLength="5"/>
															<asp:requiredfieldvalidator id="reqFieldMediumGrade" Runat="server" Display="Dynamic" EnableClientScript="True"
																ErrorMessage="*" ControlToValidate="tbMediumGradeAmt" />
															<asp:CustomValidator ID="custMGrade" Runat="server" ControlToValidate="tbMediumGradeAmt" ErrorMessage="Bid must be less then 1.99" ClientValidationFunction="checkGradeMax" Display="Static"/>																	
															<asp:regularexpressionvalidator validationexpression="^([0-9]*|\d*\.(\d{1}|\d{2}|\d{3}))$" 
																							id="regFieldMediumGrade" 
																							runat="server" 
																							controltovalidate="tbMediumGradeAmt" 
																							errormessage="Invalid amount" 
																							enableclientscript="True" 
																							display="Static"/>
															</td>
														<td class="copy_sm_bold_bl" width="11%" valign="top">
															$
															<asp:TextBox ID="tbLargeGradeAmt" Runat="server" size="2" MaxLength="5" onblur="formatDecimal(this);updateTotal()" />
															<asp:RequiredFieldValidator ID="reqFieldLargeGrade" ControlToValidate="tbLargeGradeAmt" ErrorMessage="*" EnableClientScript="True"
																Runat="server" Display="Dynamic" />
															<asp:CustomValidator ID="custLGrade" Runat="server" ControlToValidate="tbLargeGradeAmt" ErrorMessage="Bid must be less then 1.99" ClientValidationFunction="checkGradeMax" Display="Static"/>																
															<asp:regularexpressionvalidator validationexpression="^([0-9]*|\d*\.(\d{1}|\d{2}|\d{3}))$" 
																							id="regFieldLargeGrade" 
																							runat="server" 
																							controltovalidate="tbLargeGradeAmt" 
																							errormessage="Invalid amount" 
																							enableclientscript="True" 
																							display="Static"/>																
														</td>
														<td class="copy_sm_bold_bl" width="11%" valign="top">
															$
															<asp:TextBox ID="tbXLGradeAmt" Runat="server" size="2" MaxLength="5" onblur="formatDecimal(this);updateTotal()" />
															<asp:RequiredFieldValidator ID="reqFieldXLGrade" ControlToValidate="tbXLGradeAmt" ErrorMessage="*" EnableClientScript="True"
																Runat="server" Display="Dynamic" />
															<asp:CustomValidator ID="custXLGrade" Runat="server" ControlToValidate="tbXLGradeAmt" ErrorMessage="Bid must be less then 1.99" ClientValidationFunction="checkGradeMax" Display="Static"/>	
															<asp:regularexpressionvalidator validationexpression="^([0-9]*|\d*\.(\d{1}|\d{2}|\d{3}))$" 
																							id="regFieldXLGrade" 
																							runat="server" 
																							controltovalidate="tbXLGradeAmt" 
																							errormessage="Invalid amount" 
																							enableclientscript="True" 
																							display="Static"/>																
														</td>
														<td class="copy_sm_bold_bl" width="9%" valign="top">$<input type="text" size="2" id="JSAVGPRICE" name="JSAVGPRICE" value="0.000" runat="server"
																readonly="true"></td>
														<td class="copy_sm_bold_bl" width="11%" valign="top">$<input type="text" size="5" id="JSTOTALPRICE" name="JSTOTALPRICE" value="0.00" runat="server"
																readonly="true"></td>
														<td class="copy_sm_bold_bl" width="18%" valign="top">
															<asp:DropDownList ID="ddlTripPorts" Runat="server">
																<asp:ListItem Value="">Select a Port</asp:ListItem>
															</asp:DropDownList><br>
															<asp:RequiredFieldValidator EnableClientScript="True" 
																						ControlToValidate="ddlTripPorts" 
																						ErrorMessage="You must select a port" 
																						runat="server"
																						id="reqFieldPorts" 
																						display="Static"/>
														</td>

															
													</tr>
												</table>
												<br>
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<tr height="40">
				<td bgcolor="#999999">

<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr align="right" bgcolor="#999999"> 
    <td><span class="copy_sm_bold_wh"><a href="../buyers/default.aspx">Back to Main</a>&nbsp;&nbsp;</td>
  </tr>
</table>




</td>
			</tr>
			<script language="javascript">
		
			var SMALL_GRADE_PCT = parseInt(document.__aspnetForm.ucAuctionDetails_JSSGRADE.value);
			var MEDIUM_GRADE_PCT = parseInt(document.__aspnetForm.ucAuctionDetails_JSMGRADE.value);
			var LARGE_GRADE_PCT = parseInt(document.__aspnetForm.ucAuctionDetails_JSLGRADE.value);
			var XL_GRADE_PCT = parseInt(document.__aspnetForm.ucAuctionDetails_JSXLGRADE.value);		
			var TOTALQTY = parseInt(document.__aspnetForm.ucAuctionDetails_JSQUANTITY.value);
		
			var SMALL_QTY = (SMALL_GRADE_PCT / 100) * TOTALQTY;
			var MEDIUM_QTY = (MEDIUM_GRADE_PCT / 100) * TOTALQTY;
			var LARGE_QTY = (LARGE_GRADE_PCT / 100) * TOTALQTY;
			var XL_QTY = (XL_GRADE_PCT / 100) * TOTALQTY;


		function updateTotal() {
						
			//alert(SMALL_GRADE_PCT);
	
			var box1 = document.__aspnetForm.ucAuctionDetails_tbSmallGradeAmt.value;
			var box2 = document.__aspnetForm.ucAuctionDetails_tbMediumGradeAmt.value;
			var box3 = document.__aspnetForm.ucAuctionDetails_tbLargeGradeAmt.value;
			var box4 = document.__aspnetForm.ucAuctionDetails_tbXLGradeAmt.value;



			var newTotal = "0.00";
		
			if(box1 != "" && isValidDecimal(box1)) {
				var floatToAdd = parseFloat(box1);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + (floatToAdd * SMALL_QTY);
				}
			}
	
			if(box2 != "" && isValidDecimal(box2)) {
				var floatToAdd = parseFloat(box2);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + (floatToAdd * MEDIUM_QTY);
				}
			}
			
			if(box3 != "" && isValidDecimal(box3)) {
				var floatToAdd = parseFloat(box3);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + (floatToAdd * LARGE_QTY);
				}
			}

			if(box4 != "" && isValidDecimal(box4)) {
				var floatToAdd = parseFloat(box4);
				if(!isNaN(floatToAdd)) {
					newTotal = parseFloat(newTotal) + (floatToAdd * XL_QTY);
				}
			}

			// Round Total to 2 decimal places
			newTotal = Math.round(newTotal*100)/100;

			// Make sure Total Price has 2 decimals showing, if not
			// append necessary 0's
			var strNewTotal = new String(newTotal);			
			var decimalInTotal = strNewTotal.indexOf(".");
			if(decimalInTotal == -1) {
				// No decimal point present, append and 2 0's
				strNewTotal = strNewTotal + ".00";
			} else {
				// Has a decimal, make sure it has 2 places after it
				var afterDecimal = strNewTotal.substr(decimalInTotal + 1);
				if(afterDecimal.length == 1) { 				
					strNewTotal = strNewTotal + "0";
				}
			}

			// Update Total Price	
			//document.__aspnetForm.ucAuctionDetails_JSTOTALPRICE.value = newTotal;
			document.__aspnetForm.ucAuctionDetails_JSTOTALPRICE.value = strNewTotal;
	
			// Update Average Price per Pound			
			if(strNewTotal == "0.00") {
				document.__aspnetForm.ucAuctionDetails_JSAVGPRICE.value = "0.000";				
			} 
			else {
										
				// Round Average to 3 decimal places
				var avgResult = parseFloat(newTotal) / TOTALQTY;
				avgResult = Math.round(avgResult*1000)/1000;

				// Make sure average price has 3 decimals showing
				// if not append necessary 0's
				var strAvgResult = new String(avgResult);
				var decimalInAvg = strAvgResult.indexOf(".");
				if(decimalInAvg == -1) {
					// No decimal point present, append and 3 0's
					strAvgResult = strAvgResult + ".000";
				} else {
					// Has a decimal, make sure it has 3 places after it
					var afterDecimal = strAvgResult.substr(decimalInAvg + 1);
					if(afterDecimal.length == 1) { 	strAvgResult = strAvgResult + "00"; }
					if(afterDecimal.length == 2) { 	strAvgResult = strAvgResult + "0"; }
				}



				//document.__aspnetForm.ucAuctionDetails_JSAVGPRICE.value = avgResult;
				document.__aspnetForm.ucAuctionDetails_JSAVGPRICE.value = strAvgResult;

			}
			
	
	
		
		}
		
		function formatDecimal(obj) {
		
		    var objVal = obj.value;

		    if(objVal.charAt(0) == "."  && !isNaN(parseFloat(objVal)) ) {
		    
				// Starts with decimal point, prepend a 0 
				// and append 0's to end if need be
				// eg: .1 -> 0.100
		    
				var afterDecimal = objVal.substr(1);
				if(afterDecimal.length == 1) { objVal = objVal + "00"; }
				if(afterDecimal.length == 2) { objVal = objVal + "0"; }
				
		        obj.value = 0 + objVal;
		        
		    
		    } 
		    else {
				if(objVal.indexOf(".") == -1  && !isNaN(parseFloat(objVal)) ) {
				
					// No decimal point found, so append one
					// and 3 0's
					// eg: 1 -> 1.000
					
					obj.value = obj.value + ".000"; 
					
				} else if(objVal.charAt(1) == "." && !isNaN(parseFloat(objVal)) ) {
				
					// Decimal found in 2nd char spot
					// so append as many 0's
					// as need to the end
					// eg: 1.14 -> 1.140
				
					var afterDecimal = objVal.substr(2);
					if(afterDecimal.length == 0) { objVal = objVal + "000"; }
					if(afterDecimal.length == 1) { objVal = objVal + "00"; }
					if(afterDecimal.length == 2) { objVal = objVal + "0"; }
				
					obj.value = objVal;
				
				}
		    }
		
		}
		
		function isValidDecimal(boxValue) {
		
			var decimalPresent = boxValue.indexOf(".");
			if(decimalPresent != -1) {
			
				if((boxValue.length - decimalPresent) > 4) {
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			}
		
		
		}

		function checkGradeMax(oSrc, args) {
			
			var floatToAdd = parseFloat(args.Value);
			if(!isNaN(floatToAdd)) {
				if(floatToAdd < 1.99) {
					args.IsValid = true;
				} else {
					args.IsValid = false;
				}
			}
			
		
		}

		function setTotal() {

			// Update total one last time, in case they didnt get an onBlur event
			updateTotal();
			
			// Update Total Price	
			document.__aspnetForm.ucAuctionDetails_tbBidTotal.value = document.__aspnetForm.ucAuctionDetails_JSTOTALPRICE.value ;

			// Update Total Average	
			document.__aspnetForm.ucAuctionDetails_tbBidAverage.value = document.__aspnetForm.ucAuctionDetails_JSAVGPRICE.value ;
		
		
		}
		
			</script>
		</form>
		</TABLE>
	</body>
</HTML>
