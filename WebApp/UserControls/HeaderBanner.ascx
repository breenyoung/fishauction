<%@ Control Language="c#" AutoEventWireup="false" Codebehind="HeaderBanner.ascx.cs" Inherits="WebApp.UserControls.HeaderBanner" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellpadding="10">
	<tr>
		<td><font color="#ffffff" class="copy_sm_bold_wh"><asp:label id="lblTimeLeft" runat="server"/>
				<br>
				Logged in: <asp:Label ID="lblBuyerName" Runat="server" /><br>
				<asp:Label ID="lblBuyerProcessor" Runat="server" />, <asp:Label ID="lblProcLocation" Runat="server" /><br>
				You are leading bidder in
				<asp:Label ID="lblBuyerLeadingAuctions" Runat="server" /> auctions<br>
				Current Time: <asp:label id="lblCurTime" runat="server"/><br>
				</font></td>
				
	</tr>
</table>
