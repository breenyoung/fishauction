<%@ Control Language="c#" AutoEventWireup="false" Codebehind="AccountDetailsWidget.ascx.cs" Inherits="WebApp.UserControls.AccountDetailsWidget" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="90%" border="1" cellspacing="0" cellpadding="5" align="center">
	<tr align="center">
		<td class="copy_sm_bold_bl">Your Account Details</td>
	</tr>
	<tr>
		<td class="copy_sm_bold_bl">Funds available:
			<asp:Label ID="lblBuyerFunds" Runat="server" /></td>
	</tr>
	<tr>
		<td class="copy_sm_bold_bl">Other Bids:
			<asp:Label ID="lblBuyerOtherBids" Runat="server" /></td>
	</tr>
	<tr>
		<td class="copy_sm_bold_bl">Today's Purchases:
			<asp:Label ID="lblBuyerTodaysPurchases" Runat="server" /></td>
	</tr>
</table>
