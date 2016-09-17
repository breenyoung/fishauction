<%@ Page language="c#" Codebehind="summary.aspx.cs" AutoEventWireup="false" Inherits="WebApp.Buyers.summary" %>
<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<html>
<head>
<title>Live Fish Auction: Borealis Trading Inc.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/styles.css">
<style type="text/css">
<!--
.copy_smlr_bold_bl { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 7pt; font-weight: bolder; color: #666666 }

-->
</style>
</head>

<body bgcolor="D5DDE5" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr bgcolor="#000000" align="right"> 
    <td> 
      <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
        <tr> 
          <td bgcolor="#000000" valign="top"> <img src="/images/splash_800_01.gif" width="409" height="61"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
              <tr> 
                <td> 
                  <table width="100%" border="0" cellpadding="10">
                    <tr> 
                      <td>
						<uc:buyerheader runat="server" id="ucBuyerHeader" />                      
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
    <td bgcolor="#FFFFFF"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="70%" valign="top"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="10">
              <tr valign="top"> 
                <td><b class="copy_sm_bold_bl"><asp:Label ID="lblName" Runat="server"/> Bid Activity Report<br>
                  <asp:Label ID="lblProcessor" Runat="server"/></b></td>
              </tr>
              <tr valign="top"> 
                <td> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr bgcolor="468093" align="center"> 
                      <td><span class="copy"><b class="copy_lg_bold_whCopy">Active 
                        Bids - Losing</b></span></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr class="copy_smlr_bold_bl"> 
                      <td class="copy_sm_bold_bl" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="10%"><b class="copy_smlr_bold_bl"> 
                        Transaction#</b></td>
                      <td width="15%" align="left"><b>Port</b></td>
                      <td align="right" width="15%"><b>Pounds</b></td>
                      <td class="copy_smlr_bold_bl" align="right" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="15%"><b>My 
                        Bid</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" align="right" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="15%">High 
                        Bid</td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>SM</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>M</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>L</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>XL</b></td>
                      <td class="copy_sm_bold_bl" align="center" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="10%"><b class="copy_smlr_bold_bl">Closing 
                        On </b></td>
                    </tr>
                    <asp:repeater id="repeaterLosing" runat="server">
						<itemtemplate>
	                    <tr> 
		                <td class="copy_sm_bold_bl"><%# DataBinder.Eval(Container.DataItem, "AUCTIONID") %></td>
	                    <td class="copy_sm_bold_gr"><%# DataBinder.Eval(Container.DataItem, "PORTNAME") %></td>
						<td class="copy_sm_bold_bl" align="right"><%# DataBinder.Eval(Container.DataItem, "QUANTITY") %></td>
						<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">$<%# DataBinder.Eval(Container.DataItem, "MYBID") %></td>
						<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">$<%# DataBinder.Eval(Container.DataItem, "HIGHBID") %></td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "SGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "MGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "LGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "XLGRADE") %>%</td>
						<td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "CLOSETIME") %></td>
						</tr>												
						</itemtemplate>
                    
                    </asp:repeater>
                    <asp:label id="lblNoLosingBids" runat="server"><tr><td class="copy_sm_bold_bl" align="CENTER" colspan='10'>No Losing Bids</td></tr></asp:label>
                    <tr> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" bgcolor="F5F5CF">Average</td>
                      <td class="copy_sm_bold_gr" bgcolor="F5F5CF">&nbsp;</td>
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" bgcolor="F5F5CF">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" bgcolor="F5F5CF">$<asp:Label ID="lblAvgLoseMyBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" bgcolor="F5F5CF"><font color="#CC0033">$<asp:Label ID="lblAvgLoseHighBids" Runat="server"/></font></td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                      <td bgcolor="F5F5CF">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">Total</td>
                      <td>&nbsp;</td>
                      <td class="copy_sm_bold_bl" align="right" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><b><asp:Label ID="lblTotalLosePounds" Runat="server"/></b></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblTotalLoseMyBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033"><asp:Label ID="lblTotalLoseHighBids" Runat="server"/></font></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr bgcolor="468093" align="center"> 
                      <td><span class="copy"><b class="copy_lg_bold_whCopy">Active 
                        Bids - Winning</b></span></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr class="copy_smlr_bold_bl" align="center"> 
                      <td><b class="copy_smlr_bold_bl" width="10%">Transaction#</b></td>
                      <td width="15%" align="left"><b>Port</b></td>
                      <td align="right" width="15%"><b>Pounds</b></td>
                      <td align="right" width="15%"><b>Next Bid</b></td>
                      <td align="right" width="15%"><b>My Bid</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>SM</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>M</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>L</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>XL</b></td>
                      <td width="10%"><b class="copy_smlr_bold_bl">Closing On</b></td>
                    </tr>
                    <asp:repeater id="repeaterWinning" runat="server">
						<itemtemplate>
	                    <tr> 
		                <td class="copy_sm_bold_bl"><%# DataBinder.Eval(Container.DataItem, "AUCTIONID") %></td>
	                    <td class="copy_sm_bold_gr"><%# DataBinder.Eval(Container.DataItem, "PORTNAME") %></td>
						<td class="copy_sm_bold_bl" align="right"><%# DataBinder.Eval(Container.DataItem, "QUANTITY") %></td>
						<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><%# DataBinder.Eval(Container.DataItem, "NEXTBID") %></td>
						<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033">$<%# DataBinder.Eval(Container.DataItem, "MYBID") %></font></td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "SGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "MGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "LGRADE") %>%</td>
						<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "XLGRADE") %>%</td>
						<td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "CLOSETIME") %></td>
						</tr>
												
						</itemtemplate>
                    
                    </asp:repeater>
                    <asp:label id="lblNoWinningBids" runat="server"><tr><td class="copy_sm_bold_bl" align="CENTER" colspan='10'>No Winning Bids</td></tr></asp:label>
                    <tr bgcolor="F5F5CF"> 
                      <td class="copy_sm_bold_bl">Average</td>
                      <td class="copy_sm_bold_gr">&nbsp;</td>
                      <td class="copy_sm_bold_bl" align="right">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">$<asp:Label ID="lblAvgWinNextBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033">$<asp:Label ID="lblAvgWinMyBids" Runat="server"/></font></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="copy_sm_bold_bl">Total</td>
                      <td class="copy_sm_bold_gr">&nbsp;</td>
                      <td class="copy_sm_bold_bl" align="right"><b><asp:label id="lblTotalWinPounds" runat="server"/></b></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblTotalWinNextBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033"><asp:label id="lblTotalWinMyBids" runat="server"/></font></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <br>
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr bgcolor="468093" align="center"> 
                      <td><span class="copy"><b class="copy_lg_bold_whCopy">Today's 
                        Purchases </b></span></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr class="copy_smlr_bold_bl" align="center"> 
                      <td class="copy_smlr_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="10%"><b>Transaction#<span style='display:none'>n#</span></b></td>
                      <td width="15%" align="left"><b>Port</b></td>
                      <td bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" class="copy_smlr_bold_bl" align="right" width="15%"><b>Pounds</b></td>
                      <td bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" class="copy_smlr_bold_bl" align="right" width="15%"><b>Next 
                        Bid</b></td>
                      <td bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" class="copy_smlr_bold_bl" align="right" width="15%"><b>My 
                        Cost</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>SM</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>M</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>L</b></td>
                      <td class="copy_smlr_bold_bl" bgcolor="#FFFFFF" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" width="5%"><b>XL</b></td>
                      <td bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" class="copy_smlr_bold_bl" width="10%"><b>Landing</b></td>
                    </tr>
                    <asp:Repeater ID="repeaterWon" Runat="server">
                    
						<ItemTemplate>
							<tr> 
							<td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><%# DataBinder.Eval(Container.DataItem, "AUCTIONID") %></td>
							<td class="copy_sm_bold_gr"><%# DataBinder.Eval(Container.DataItem, "PORTNAME") %></td>
							<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><%# DataBinder.Eval(Container.DataItem, "QUANTITY") %></td>
							<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><%# DataBinder.Eval(Container.DataItem, "NEXTBID") %></td>
							<td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033">$<%# DataBinder.Eval(Container.DataItem, "MYCOST") %></font></td>
							<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="center"><%# DataBinder.Eval(Container.DataItem, "SGRADE") %>%</td>
							<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="center"><%# DataBinder.Eval(Container.DataItem, "MGRADE") %>%</td>
							<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="center"><%# DataBinder.Eval(Container.DataItem, "LGRADE") %>%</td>
							<td class="copy_sm_blCopy" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="center"><%# DataBinder.Eval(Container.DataItem, "XLGRADE") %>%</td>
							<td class="copy_smlr_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" align="right"><%# DataBinder.Eval(Container.DataItem, "LANDING") %></td>
							</tr>
						</ItemTemplate>   
						                                    
                    </asp:Repeater>
                    <asp:Label ID="lblNoWonBids" Runat="server"><tr><td class="copy_sm_bold_bl" align="CENTER" colspan='10'>No Won Auctions</td></tr></asp:label>
                    <tr bgcolor="F5F5CF"> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">Average</td>
                      <td class="copy_sm_bold_gr">&nbsp;</td>
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">$<asp:Label ID="lblAvgWonNextBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033">$<asp:Label ID="lblAvgWonMyCost" Runat="server"/></font></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">Total</td>
                      <td class="copy_sm_bold_gr">&nbsp;</td>
                      <td class="copy_sm_bold_bl" align="right" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><b><asp:Label ID="lblTotalWonPounds" Runat="server"/></b></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblTotalWonNextBids" Runat="server"/></td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><font color="#CC0033"><asp:Label ID="lblTotalWonMyCost" Runat="server"/></font></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td class="copy_sm_bold_bl" align="right" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" colspan="3" bgcolor="F5F5CF">Deposit 
                        Balance net 'Todays Purchases' </td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblDepositBalance" Runat="server"/></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" colspan="3">Minimum 
                        Balance required </td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblMinBalance" Runat="server"/></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr bgcolor="F5F5CF"> 
                      <td class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4" colspan="3">Balance 
                        Surplus (or Shortfall) </td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4">&nbsp;</td>
                      <td align="right" class="copy_sm_bold_bl" bordercolordark="#F4F4F4" bordercolorlight="#F4F4F4"><asp:Label ID="lblBalanceSurplus" Runat="server"/></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <span class="copy_sm_blCopy"><span class="copy_sm_bold_bl"> 
                  </span></span> </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td bgcolor="#999999"><table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr align="right" bgcolor="#999999"> 
    <td><span class="copy_sm_bold_wh"><a href="../buyers/default.aspx">Back to Main</a>&nbsp;&nbsp;</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>