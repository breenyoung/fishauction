<%@Register tagprefix="uc" tagname="buyerHeader" src="/UserControls/HeaderBanner.ascx" %>
<%@Register tagprefix="uc" tagname="accountDetails" src="/UserControls/AccountDetailsWidget.ascx" %>
<%@Register tagprefix="uc" tagname="auctionDetails" src="/UserControls/Auction/AuctionDetails.ascx" %>
<%@Register tagprefix="uc" tagname="auctionConfirm" src="/UserControls/Auction/AuctionConfirm.ascx" %>
<%@Register tagprefix="uc" tagname="auctionSuccess" src="/UserControls/Auction/AuctionSuccess.ascx" %>
<%@ Page language="c#" Codebehind="auctionDetails.aspx.cs" AutoEventWireup="false" Inherits="WebApp.Auctions.auctionDetails" %>

<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">


<uc:auctionDetails id="ucAuctionDetails" runat="server"/><uc:auctionConfirm id="ucAuctionConfirm" runat="server"/><uc:auctionSuccess id="ucAuctionSuccess" runat="server"/>