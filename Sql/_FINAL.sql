if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_admin_classid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Admin] DROP CONSTRAINT fk_admin_classid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_trip_areaid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Trips] DROP CONSTRAINT fk_trip_areaid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_ahb_auctionid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AuctionHighBids] DROP CONSTRAINT fk_ahb_auctionid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_bids_lotid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Bids] DROP CONSTRAINT fk_bids_lotid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_trip_lotid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Trips] DROP CONSTRAINT fk_trip_lotid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_al_statusid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AuctionLots] DROP CONSTRAINT fk_al_statusid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_ahb_buyerid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AuctionHighBids] DROP CONSTRAINT fk_ahb_buyerid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_bids_buyerid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Bids] DROP CONSTRAINT fk_bids_buyerid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_cb_catchid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CatchBreakdowns] DROP CONSTRAINT fk_cb_catchid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_cg_catchid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CatchGrades] DROP CONSTRAINT fk_cg_catchid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_cs_catchid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CatchSupplies] DROP CONSTRAINT fk_cs_catchid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_cs_gradeid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CatchGrades] DROP CONSTRAINT fk_cs_gradeid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_tripport_alt]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TripPorts] DROP CONSTRAINT fk_tripport_alt
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_bids_portid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Bids] DROP CONSTRAINT fk_bids_portid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_sites_portid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Sites] DROP CONSTRAINT fk_sites_portid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_tripport_portid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TripPorts] DROP CONSTRAINT fk_tripport_portid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_buyers_processorid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Buyers] DROP CONSTRAINT fk_buyers_processorid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_buyers_provinceid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Buyers] DROP CONSTRAINT fk_buyers_provinceid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_bs_speciesid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BuyerSpecies] DROP CONSTRAINT fk_bs_speciesid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_catch_speciesid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Catches] DROP CONSTRAINT fk_catch_speciesid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_grade_speciesid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Grades] DROP CONSTRAINT fk_grade_speciesid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_al_statusreason]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[AuctionLots] DROP CONSTRAINT fk_al_statusreason
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_vessel_stowid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Vessels] DROP CONSTRAINT fk_vessel_stowid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_cs_supplyid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[CatchSupplies] DROP CONSTRAINT fk_cs_supplyid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_catch_tripid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Catches] DROP CONSTRAINT fk_catch_tripid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_tripport_tripid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[TripPorts] DROP CONSTRAINT fk_tripport_tripid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_trip_vesselid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Trips] DROP CONSTRAINT fk_trip_vesselid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_port_zoneid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Ports] DROP CONSTRAINT fk_port_zoneid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_processor_zoneid]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Processors] DROP CONSTRAINT fk_processor_zoneid
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AdminUserGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AdminUserGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AdminUserGetByUsername]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AdminUserGetByUsername]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AreasGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AreasGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AreasGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AreasGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetActive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetActive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetActiveCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetActiveCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetByActiveFlag]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetByActiveFlag]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetClosed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetClosed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetClosedToday]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetClosedToday]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetConfirmed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetConfirmed]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsGetWinner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsGetWinner]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsMarkInactive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsMarkInactive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLotsUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionLotsUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionStatusesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[AuctionStatusesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetByAuctionId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetByAuctionId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetByBuyerId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetByBuyerId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetHighBid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetHighBid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetHighBidInfo]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetHighBidInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetLosingByBuyerId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetLosingByBuyerId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetLosingByProcId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetLosingByProcId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetNextHighest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetNextHighest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetWinningByBuyerId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetWinningByBuyerId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetWinningByProcId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetWinningByProcId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetWonByBuyerId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetWonByBuyerId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsGetWonByProcId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsGetWonByProcId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BidsUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BidsUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyerSpeciesCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyerSpeciesCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyerSpeciesDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyerSpeciesDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersGetByUsername]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersGetByUsername]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersGetSpeciesByBuyerId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersGetSpeciesByBuyerId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyersUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BuyersUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchBreakdownsCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchBreakdownsCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchBreakdownsDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchBreakdownsDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchBreakdownsGetByCatchId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchBreakdownsGetByCatchId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchBreakdownsUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchBreakdownsUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchGradesCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchGradesCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchGradesDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchGradesDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchGradesGetByCatchId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchGradesGetByCatchId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchGradesUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchGradesUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchSuppliesCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchSuppliesCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchSuppliesDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchSuppliesDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchSuppliesGetByCatchId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchSuppliesGetByCatchId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchSuppliesUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchSuppliesUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchesCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchesCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchesDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchesDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchesGetByTripId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchesGetByTripId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchesUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CatchesUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GradesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GradesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GradesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GradesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PortsGetActive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PortsGetActive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PortsGetActiveByZone]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PortsGetActiveByZone]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PortsGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PortsGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PortsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[PortsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcessorsGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProcessorsGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcessorsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProcessorsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProvincesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProvincesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProvincesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProvincesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SpeciesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SpeciesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SpeciesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SpeciesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StatusReasonsGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[StatusReasonsGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StatusReasonsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[StatusReasonsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StowageGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[StowageGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StowageGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[StowageGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SuppliesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SuppliesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SuppliesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SuppliesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPortsCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripPortsCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPortsDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripPortsDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPortsGetByTripId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripPortsGetByTripId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPortsGetZonesByTripId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripPortsGetZonesByTripId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPortsUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripPortsUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetByLotId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetByLotId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetByVesselId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetByVesselId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetOpenByVesselId]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetOpenByVesselId]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetOpenTrips]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetOpenTrips]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsGetbyStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsGetbyStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripsUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TripsUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselCreate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselCreate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselDelete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetActive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetActive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetAtSea]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetAtSea]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetByCfv]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetByCfv]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetByName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetByName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselGetInactive]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselGetInactive]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VesselUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[VesselUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZonesGetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ZonesGetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZonesGetById]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ZonesGetById]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_addtosourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_addtosourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_addtosourcecontrol_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_addtosourcecontrol_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_adduserobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_adduserobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_adduserobject_vcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_adduserobject_vcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkinobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkinobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkinobject_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkinobject_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkoutobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkoutobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkoutobject_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkoutobject_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_displayoaerror]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_displayoaerror]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_displayoaerror_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_displayoaerror_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_droppropertiesbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_droppropertiesbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_dropuserobjectbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_dropuserobjectbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_generateansiname]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_generateansiname]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getobjwithprop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getobjwithprop]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getobjwithprop_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getobjwithprop_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_vcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_vcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_vcs_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_vcs_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_isundersourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_isundersourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_isundersourcecontrol_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_isundersourcecontrol_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_removefromsourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_removefromsourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_setpropertybyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_setpropertybyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_setpropertybyid_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_setpropertybyid_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_validateloginparams]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_validateloginparams]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_validateloginparams_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_validateloginparams_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_vcsenabled]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_vcsenabled]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_verstamp006]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_verstamp006]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_verstamp007]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_verstamp007]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_whocheckedout]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_whocheckedout]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_whocheckedout_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_whocheckedout_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Admin]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Admin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AdminClasses]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AdminClasses]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Areas]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Areas]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionHighBids]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AuctionHighBids]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionLots]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AuctionLots]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AuctionStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AuctionStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Bids]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Bids]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuyerSpecies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BuyerSpecies]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Buyers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Buyers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchBreakdowns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CatchBreakdowns]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchGrades]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CatchGrades]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CatchSupplies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CatchSupplies]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Catches]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Catches]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Grades]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Grades]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PortType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PortType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Ports]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Ports]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Processors]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Processors]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Provinces]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Provinces]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Sites]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Sites]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Species]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Species]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StatusReason]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[StatusReason]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Stowage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Stowage]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Supplies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Supplies]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TripPorts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TripPorts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Trips]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Trips]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Vessels]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Vessels]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zones]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Zones]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtproperties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dtproperties]
GO

CREATE TABLE [dbo].[Admin] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[classid] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[description] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AdminClasses] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Areas] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[abbr] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AuctionHighBids] (
	[auctionid] [bigint] NOT NULL ,
	[buyerid] [bigint] NOT NULL ,
	[amount] [float] NOT NULL ,
	[biddate] [datetime] NOT NULL ,
	[bidid] [bigint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AuctionLots] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[startdate] [datetime] NOT NULL ,
	[enddate] [datetime] NOT NULL ,
	[active] [bit] NOT NULL ,
	[startprice] [money] NULL ,
	[statusid] [int] NULL ,
	[statusreason] [int] NULL ,
	[confirmed] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AuctionStatus] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Bids] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[buyerid] [bigint] NOT NULL ,
	[amount] [money] NOT NULL ,
	[biddate] [datetime] NOT NULL ,
	[lotid] [bigint] NOT NULL ,
	[selectedport] [int] NOT NULL ,
	[sgrade] [float] NOT NULL ,
	[mgrade] [float] NOT NULL ,
	[lgrade] [float] NOT NULL ,
	[xlgrade] [float] NOT NULL ,
	[avgperlb] [float] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BuyerSpecies] (
	[buyerid] [bigint] NULL ,
	[speciesid] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Buyers] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[corpname] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[firstname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[lastname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[address1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[address2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[city] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[provinceid] [tinyint] NOT NULL ,
	[pc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone1] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone2] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fax] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cell] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[processorid] [int] NULL ,
	[username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CatchBreakdowns] (
	[catchid] [bigint] NOT NULL ,
	[day] [smallint] NOT NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CatchGrades] (
	[catchid] [bigint] NOT NULL ,
	[gradeid] [int] NOT NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CatchSupplies] (
	[catchid] [bigint] NOT NULL ,
	[supplyid] [smallint] NOT NULL ,
	[value] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Catches] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[tripid] [bigint] NOT NULL ,
	[speciesid] [int] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[catchdate] [datetime] NOT NULL ,
	[stowid] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Grades] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[speciesid] [int] NOT NULL ,
	[abbr] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PortType] (
	[id] [tinyint] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ports] (
	[id] [int] NOT NULL ,
	[name] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[zoneid] [int] NOT NULL ,
	[active] [tinyint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Processors] (
	[id] [int] NOT NULL ,
	[name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[location] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[zoneid] [int] NULL ,
	[accountbalance] [money] NULL ,
	[istrading] [bit] NOT NULL ,
	[demand] [decimal](18, 0) NULL ,
	[minbalance] [money] NULL ,
	[phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Provinces] (
	[id] [tinyint] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Sites] (
	[id] [bigint] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[abbr] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[portid] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Species] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StatusReason] (
	[id] [int] NOT NULL ,
	[reason] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Stowage] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Supplies] (
	[id] [smallint] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[unittype] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TripPorts] (
	[tripid] [bigint] NOT NULL ,
	[portid] [int] NOT NULL ,
	[alternate] [tinyint] NOT NULL ,
	[iszone] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Trips] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[vesselid] [bigint] NOT NULL ,
	[lotid] [bigint] NULL ,
	[hailoutdate] [datetime] NOT NULL ,
	[daysout] [decimal](10, 0) NULL ,
	[eta] [datetime] NULL ,
	[hailindate] [datetime] NULL ,
	[specialinstructions] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[areaid] [int] NOT NULL ,
	[statusid] [int] NULL ,
	[statusreason] [int] NULL ,
	[reason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Vessels] (
	[id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[name] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cfv] [int] NULL ,
	[captain] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[phone1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone3] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email2] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email3] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[capacity] [int] NOT NULL ,
	[stowid] [int] NOT NULL ,
	[active] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Zones] (
	[id] [int] NOT NULL ,
	[name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[active] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dtproperties] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[objectid] [int] NULL ,
	[property] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[value] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[uvalue] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lvalue] [image] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Admin] WITH NOCHECK ADD 
	CONSTRAINT [PK__Admin__76CBA758] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AdminClasses] WITH NOCHECK ADD 
	CONSTRAINT [PK__AdminClasses__78B3EFCA] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Areas] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AuctionHighBids] WITH NOCHECK ADD 
	CONSTRAINT [PK__AuctionHighBids__797309D9] PRIMARY KEY  CLUSTERED 
	(
		[auctionid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AuctionLots] WITH NOCHECK ADD 
	CONSTRAINT [PK__AuctionLots__7A9C383C] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AuctionStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK__AuctionStatus__7C8480AE] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Bids] WITH NOCHECK ADD 
	CONSTRAINT [PK__Bids__7F60ED59] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Buyers] WITH NOCHECK ADD 
	CONSTRAINT [PK__Buyers__023D5A04] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Catches] WITH NOCHECK ADD 
	CONSTRAINT [PK__Catches__0425A276] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Grades] WITH NOCHECK ADD 
	CONSTRAINT [PK__Grades__07020F21] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PortType] WITH NOCHECK ADD 
	CONSTRAINT [PK__PortType__08EA5793] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Ports] WITH NOCHECK ADD 
	CONSTRAINT [PK__Ports__0AD2A005] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Processors] WITH NOCHECK ADD 
	CONSTRAINT [PK__Processors__0CBAE877] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Provinces] WITH NOCHECK ADD 
	CONSTRAINT [PK__Provinces__0EA330E9] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Sites] WITH NOCHECK ADD 
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Species] WITH NOCHECK ADD 
	CONSTRAINT [PK__Species__108B795B] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[StatusReason] WITH NOCHECK ADD 
	CONSTRAINT [PK__StatusReason__1367E606] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Stowage] WITH NOCHECK ADD 
	CONSTRAINT [PK__Stowage__15502E78] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Supplies] WITH NOCHECK ADD 
	CONSTRAINT [PK__Supplies__70DDC3D8] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Trips] WITH NOCHECK ADD 
	CONSTRAINT [PK__Trips__1920BF5C] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Vessels] WITH NOCHECK ADD 
	CONSTRAINT [PK__Vessels__1CF15040] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Zones] WITH NOCHECK ADD 
	CONSTRAINT [PK__Zones__1B0907CE] PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[dtproperties] WITH NOCHECK ADD 
	CONSTRAINT [pk_dtproperties] PRIMARY KEY  CLUSTERED 
	(
		[id],
		[property]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Catches] ADD 
	CONSTRAINT [DF_Catches_catchdate] DEFAULT (getdate()) FOR [catchdate]
GO

ALTER TABLE [dbo].[Processors] ADD 
	CONSTRAINT [DF_Processors_accountbalance] DEFAULT (0.00) FOR [accountbalance],
	CONSTRAINT [DF_Processors_istrading] DEFAULT (1) FOR [istrading],
	CONSTRAINT [DF_Processors_demand] DEFAULT (0.00) FOR [demand],
	CONSTRAINT [DF_Processors_minbalance] DEFAULT (0.00) FOR [minbalance]
GO

ALTER TABLE [dbo].[TripPorts] ADD 
	CONSTRAINT [DF_TripPorts_iszone] DEFAULT (0) FOR [iszone]
GO

ALTER TABLE [dbo].[Vessels] ADD 
	CONSTRAINT [DF_Vessels_active] DEFAULT (0) FOR [active],
	CONSTRAINT [UQ__Vessels__6442E2C9] UNIQUE  NONCLUSTERED 
	(
		[cfv]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[dtproperties] ADD 
	CONSTRAINT [DF__dtpropert__versi__05D8E0BE] DEFAULT (0) FOR [version]
GO

ALTER TABLE [dbo].[Admin] ADD 
	CONSTRAINT [fk_admin_classid] FOREIGN KEY 
	(
		[classid]
	) REFERENCES [dbo].[AdminClasses] (
		[id]
	)
GO

ALTER TABLE [dbo].[AuctionHighBids] ADD 
	CONSTRAINT [fk_ahb_auctionid] FOREIGN KEY 
	(
		[auctionid]
	) REFERENCES [dbo].[AuctionLots] (
		[id]
	),
	CONSTRAINT [fk_ahb_buyerid] FOREIGN KEY 
	(
		[buyerid]
	) REFERENCES [dbo].[Buyers] (
		[id]
	)
GO

ALTER TABLE [dbo].[AuctionLots] ADD 
	CONSTRAINT [fk_al_statusid] FOREIGN KEY 
	(
		[statusid]
	) REFERENCES [dbo].[AuctionStatus] (
		[id]
	),
	CONSTRAINT [fk_al_statusreason] FOREIGN KEY 
	(
		[statusreason]
	) REFERENCES [dbo].[StatusReason] (
		[id]
	)
GO

ALTER TABLE [dbo].[Bids] ADD 
	CONSTRAINT [fk_bids_buyerid] FOREIGN KEY 
	(
		[buyerid]
	) REFERENCES [dbo].[Buyers] (
		[id]
	),
	CONSTRAINT [fk_bids_lotid] FOREIGN KEY 
	(
		[lotid]
	) REFERENCES [dbo].[AuctionLots] (
		[id]
	),
	CONSTRAINT [fk_bids_portid] FOREIGN KEY 
	(
		[selectedport]
	) REFERENCES [dbo].[Ports] (
		[id]
	)
GO

ALTER TABLE [dbo].[BuyerSpecies] ADD 
	CONSTRAINT [fk_bs_speciesid] FOREIGN KEY 
	(
		[speciesid]
	) REFERENCES [dbo].[Species] (
		[id]
	)
GO

ALTER TABLE [dbo].[Buyers] ADD 
	CONSTRAINT [fk_buyers_processorid] FOREIGN KEY 
	(
		[processorid]
	) REFERENCES [dbo].[Processors] (
		[id]
	),
	CONSTRAINT [fk_buyers_provinceid] FOREIGN KEY 
	(
		[provinceid]
	) REFERENCES [dbo].[Provinces] (
		[id]
	)
GO

ALTER TABLE [dbo].[CatchBreakdowns] ADD 
	CONSTRAINT [fk_cb_catchid] FOREIGN KEY 
	(
		[catchid]
	) REFERENCES [dbo].[Catches] (
		[id]
	)
GO

ALTER TABLE [dbo].[CatchGrades] ADD 
	CONSTRAINT [fk_cg_catchid] FOREIGN KEY 
	(
		[catchid]
	) REFERENCES [dbo].[Catches] (
		[id]
	),
	CONSTRAINT [fk_cs_gradeid] FOREIGN KEY 
	(
		[gradeid]
	) REFERENCES [dbo].[Grades] (
		[id]
	)
GO

ALTER TABLE [dbo].[CatchSupplies] ADD 
	CONSTRAINT [fk_cs_catchid] FOREIGN KEY 
	(
		[catchid]
	) REFERENCES [dbo].[Catches] (
		[id]
	),
	CONSTRAINT [fk_cs_supplyid] FOREIGN KEY 
	(
		[supplyid]
	) REFERENCES [dbo].[Supplies] (
		[id]
	)
GO

ALTER TABLE [dbo].[Catches] ADD 
	CONSTRAINT [fk_catch_speciesid] FOREIGN KEY 
	(
		[speciesid]
	) REFERENCES [dbo].[Species] (
		[id]
	),
	CONSTRAINT [fk_catch_tripid] FOREIGN KEY 
	(
		[tripid]
	) REFERENCES [dbo].[Trips] (
		[id]
	)
GO

ALTER TABLE [dbo].[Grades] ADD 
	CONSTRAINT [fk_grade_speciesid] FOREIGN KEY 
	(
		[speciesid]
	) REFERENCES [dbo].[Species] (
		[id]
	)
GO

ALTER TABLE [dbo].[Ports] ADD 
	CONSTRAINT [fk_port_zoneid] FOREIGN KEY 
	(
		[zoneid]
	) REFERENCES [dbo].[Zones] (
		[id]
	)
GO

ALTER TABLE [dbo].[Processors] ADD 
	CONSTRAINT [fk_processor_zoneid] FOREIGN KEY 
	(
		[zoneid]
	) REFERENCES [dbo].[Zones] (
		[id]
	)
GO

ALTER TABLE [dbo].[Sites] ADD 
	CONSTRAINT [fk_sites_portid] FOREIGN KEY 
	(
		[portid]
	) REFERENCES [dbo].[Ports] (
		[id]
	)
GO

ALTER TABLE [dbo].[TripPorts] ADD 
	CONSTRAINT [fk_tripport_alt] FOREIGN KEY 
	(
		[alternate]
	) REFERENCES [dbo].[PortType] (
		[id]
	),
	CONSTRAINT [fk_tripport_portid] FOREIGN KEY 
	(
		[portid]
	) REFERENCES [dbo].[Ports] (
		[id]
	),
	CONSTRAINT [fk_tripport_tripid] FOREIGN KEY 
	(
		[tripid]
	) REFERENCES [dbo].[Trips] (
		[id]
	)
GO

ALTER TABLE [dbo].[Trips] ADD 
	CONSTRAINT [fk_trip_areaid] FOREIGN KEY 
	(
		[areaid]
	) REFERENCES [dbo].[Areas] (
		[id]
	),
	CONSTRAINT [fk_trip_lotid] FOREIGN KEY 
	(
		[lotid]
	) REFERENCES [dbo].[AuctionLots] (
		[id]
	),
	CONSTRAINT [fk_trip_vesselid] FOREIGN KEY 
	(
		[vesselid]
	) REFERENCES [dbo].[Vessels] (
		[id]
	)
GO

ALTER TABLE [dbo].[Vessels] ADD 
	CONSTRAINT [fk_vessel_stowid] FOREIGN KEY 
	(
		[stowid]
	) REFERENCES [dbo].[Stowage] (
		[id]
	)
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AdminUserGetById

@ID bigint
AS

SET ROWCOUNT 0

BEGIN
  SELECT id,classid,name,description,username,password
  FROM admin
  WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AdminUserGetByUsername
@USERNAME varchar(50)

AS

--SET ROWCOUNT 0

BEGIN
  SELECT id,classid,name,description,username,password
  FROM admin
  WHERE username = @USERNAME

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AreasGetAll
AS
BEGIN
  SELECT id,name,abbr
  FROM areas
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AreasGetById
@ID int
AS
BEGIN
  SELECT id,name,abbr
  FROM areas
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AuctionLotsCreate
@STARTDATE datetime,
@ENDDATE datetime,
@ACTIVE bit,
@STARTPRICE money,
@STATUSID int,
@STATUSREASON int,
@CONFIRMED bit
AS
BEGIN
  INSERT INTO auctionlots (startdate,enddate,active,startprice,statusid,statusreason,confirmed)
  VALUES(@STARTDATE,@ENDDATE,@ACTIVE,@STARTPRICE,@STATUSID,@STATUSREASON,@CONFIRMED)

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AuctionLotsDelete
@ID bigint
AS
BEGIN
  DELETE FROM auctionlots
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AuctionLotsGetActive
@NOW datetime
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE enddate > @NOW
  AND active = 1
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsGetActiveCount
@NOW datetime
AS
BEGIN


  SELECT COUNT(id) actives
  FROM auctionlots
  WHERE enddate > @NOW
  AND active = 1
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE AuctionLotsGetByActiveFlag
@ACTIVE bit
AS
BEGIN
  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE active = @ACTIVE
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AuctionLotsGetById
@ID bigint
AS
BEGIN
  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsGetClosed
--@NOW datetime
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  --WHERE enddate < @NOW
  WHERE active = 0
  ORDER BY id DESC
  
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsGetClosedToday
@STARTRANGE datetime,
@ENDRANGE datetime
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE enddate >= @STARTRANGE
  AND enddate <= @ENDRANGE
  AND active = 0
  ORDER BY id DESC
  
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsGetConfirmed
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE confirmed = 1
  
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsGetWinner
@AUCTIONID bigint
AS
BEGIN
	SELECT b.id,b.firstname,b.lastname
	FROM buyers b,auctionhighbids a
	WHERE a.auctionid = @AUCTIONID
	AND a.buyerid = b.id
END 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionLotsMarkInactive
@ID bigint
AS
BEGIN

  UPDATE auctionlots
  SET active = 0
  WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE AuctionLotsUpdate
@ID bigint,
@STARTDATE datetime,
@ENDDATE datetime,
@ACTIVE bit,
@STARTPRICE money,
@STATUSID int,
@STATUSREASON int,
@CONFIRMED bit
AS
BEGIN

  UPDATE auctionlots
  SET startdate = @STARTDATE,
      enddate = @ENDDATE,
      active = @ACTIVE,
      startprice = @STARTPRICE,
      statusid = @STATUSID,
      statusreason = @STATUSREASON,
      confirmed = @CONFIRMED
  WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE AuctionStatusesGetAll
AS
BEGIN
  SELECT id,name
  FROM AuctionStatus
  ORDER BY id
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsCreate
@BUYERID bigint,
@AMOUNT money,
@BIDDATE datetime,
@LOTID bigint,
@SELECTEDPORT int,
@SGRADE float,
@MGRADE float,
@LGRADE float,
@XLGRADE float,
@AVGPERLB float
--@RETURNCODE int OUTPUT
AS
declare @CURRENTHIGH float
declare @RETURNCODE tinyint
declare @NEWBID bigint
--declare @CURRENTDATETIME datetime

SET TRANSACTION ISOLATION LEVEL serializable
BEGIN transaction

-- Get current date/time
--SELECT @CURRENTDATETIME = getdate()

-- Get Current high bid
SELECT @CURRENTHIGH = amount FROM AuctionHighBids WHERE auctionid = @LOTID

-- Check if there was a return for the current high bid

IF @@ROWCOUNT > 0 begin

   IF @AVGPERLB > @CURRENTHIGH BEGIN

      -- Insert bid
      INSERT INTO bids (buyerid,amount,biddate,lotid,selectedport,sgrade,mgrade,lgrade,xlgrade,avgperlb)
      VALUES(@BUYERID,@AMOUNT,@BIDDATE,@LOTID,@SELECTEDPORT,@SGRADE,@MGRADE,@LGRADE,@XLGRADE,@AVGPERLB)

	  SELECT @NEWBID = @@IDENTITY

      -- New bid is higher, update old row
      UPDATE AuctionHighBids
             SET amount = @AVGPERLB,
             buyerid = @BUYERID,
             biddate = @BIDDATE,
             bidid = @NEWBID
      WHERE auctionid = @LOTID

      SELECT @RETURNCODE = 2
   END
   ELSE begin
       -- Outbid
       SELECT @RETURNCODE = 0
   end
end
ELSE begin
    -- No existing bid, insert new rows

    -- Insert bid
    INSERT INTO bids (buyerid,amount,biddate,lotid,selectedport,sgrade,mgrade,lgrade,xlgrade,avgperlb)
    VALUES(@BUYERID,@AMOUNT,@BIDDATE,@LOTID,@SELECTEDPORT,@SGRADE,@MGRADE,@LGRADE,@XLGRADE,@AVGPERLB)

	  SELECT @NEWBID = @@IDENTITY


    INSERT into AuctionHighBids (auctionid,buyerid,amount,biddate,bidid)
    VALUES(@LOTID,@BUYERID,@AVGPERLB,@BIDDATE,@NEWBID)

    -- Now the high bid by default
    SELECT @RETURNCODE = 1


end


commit transaction

SELECT @RETURNCODE theresult

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BidsDelete
@ID bigint
AS
BEGIN
  DELETE FROM bids
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BidsGetByAuctionId
@AUCTIONID bigint
AS
BEGIN
  SELECT id,buyerid,amount,biddate,lotid,selectedport,sgrade,mgrade,lgrade,xlgrade,avgperlb
  FROM Bids
  WHERE lotid = @AUCTIONID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetByBuyerId
@BUYERID bigint
AS
	SELECT id,buyerid,amount,biddate,lotid
	FROM bids
	WHERE buyerid  = @BUYERID
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BidsGetById
@ID bigint
AS
BEGIN
  SELECT id,buyerid,amount,biddate,lotid,selectedport,sgrade,mgrade,lgrade,xlgrade,avgperlb
  FROM Bids
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetHighBid
@LOTID bigint
AS

SET TRANSACTION ISOLATION LEVEL READ committed

BEGIN


  SELECT amount
  FROM AuctionHighBids
  WHERE auctionid = @LOTID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetHighBidInfo
@LOTID bigint
AS


BEGIN

  SELECT b.id,b.buyerid,b.amount,b.biddate,b.lotid,b.selectedport,b.sgrade,b.mgrade,b.lgrade,b.xlgrade,b.avgperlb
  
  FROM Bids b, AuctionHighBids a
  WHERE b.id = a.bidid
  AND a.auctionid = @LOTID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetLosingByBuyerId
@BUYERID bigint,
@NOW datetime
AS
BEGIN

	SELECT b.avgperlb,b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,b.xlgrade
	
	FROM bids b, auctionlots al
	WHERE b.buyerid = @BUYERID		
	AND b.buyerid NOT IN (SELECT buyerid FROM auctionhighbids where auctionid = b.lotid)
	AND b.lotid = al.id
	AND al.active = 1
	AND al.enddate > @NOW	
	ORDER BY b.lotid, b.avgperlb DESC
	--GROUP BY b.lotid,b.id,b.buyerid,b.amount,b.biddate,b.lotid,b.selectedport,b.sgrade,b.mgrade,b.lgrade,b.xlgrade
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetLosingByProcId
@PROCID int,
@NOW datetime
AS
BEGIN

	SELECT b.avgperlb,b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,b.xlgrade
	
	FROM bids b, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers WHERE buyers.processorid = @PROCID)
	AND b.buyerid NOT IN (SELECT buyerid FROM auctionhighbids where auctionid = b.lotid)
	AND b.lotid = al.id
	AND al.active = 1
	AND al.enddate > @NOW	
	ORDER BY b.lotid, b.avgperlb DESC
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetNextHighest
@LOTID bigint,
@HIGHBID float
AS

SET TRANSACTION ISOLATION LEVEL READ committed

BEGIN
	SELECT MAX(avgperlb) avgperlb,amount
	FROM bids
	WHERE avgperlb != @HIGHBID
	AND lotid = @LOTID
	GROUP BY lotid,amount


END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetWinningByBuyerId
@BUYERID bigint,
@NOW datetime
AS
BEGIN
	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid = @BUYERID
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 1
	AND al.enddate > @NOW
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetWinningByProcId
@PROCID int,
@NOW datetime
AS
BEGIN
	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb
		--,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers WHERE buyers.processorid = @PROCID)
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 1
	AND al.enddate > @NOW
END	

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetWonByBuyerId
@BUYERID bigint,
@NOW datetime,
@YESTERDAY datetime
AS
BEGIN

	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid = @BUYERID
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 0
	AND al.enddate > @YESTERDAY
	AND al.enddate < @NOW
	
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsGetWonByProcId
@PROCID int,
@NOW datetime,
@YESTERDAY datetime
AS
BEGIN

	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb
		--,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers WHERE buyers.processorid = @PROCID)
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 0
	AND al.enddate > @YESTERDAY
	AND al.enddate < @NOW
	
END	

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE BidsUpdate
@ID bigint,
@BUYERID bigint,
@AMOUNT money,
@BIDDATE datetime,
@LOTID bigint,
@SELECTEDPORT int,
@SGRADE decimal,
@MGRADE decimal,
@LGRADE decimal,
@XLGRADE decimal,
@AVGPERLB decimal

AS
BEGIN
  UPDATE bids
  SET buyerid = @BUYERID,
  amount = @AMOUNT,
  biddate = getdate(),
  lotid = @LOTID,
  selectedport = @SELECTEDPORT,
  sgrade = @SGRADE,
  mgrade = @MGRADE,
  lgrade = @LGRADE,
  xlgrade = @XLGRADE,
  avgperlb = @AVGPERLB
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyerSpeciesCreate
@BUYERID bigint,
@SPECIESID int
AS
BEGIN
  INSERT INTO BuyerSpecies (buyerid,speciesid)
  VALUES(@BUYERID,@SPECIESID)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyerSpeciesDelete
@BUYERID bigint,
@SPECIESID int
AS
BEGIN
  DELETE FROM BuyerSpecies
  WHERE buyerid = @BUYERID
  AND speciesid = @SPECIESID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE BuyersCreate
@CORPNAME varchar(100),
@FIRSTNAME varchar(50),
@LASTNAME varchar(50),
@USERNAME varchar(50),
@PASSWORD varchar(20),
@ADDRESS1 varchar(50),
@ADDRESS2 varchar(50),
@CITY varchar(50),
@PROVINCE tinyint,
@POSTALCODE varchar(50),
@PHONE1 varchar(30),
@PHONE2 varchar(30),
@FAX varchar(30),
@CELLPHONE varchar(30),
@EMAIL varchar(80),
@PROCESSORID int

AS
BEGIN
  INSERT INTO Buyers
  (corpname,firstname,lastname,
  address1,address2,city,provinceid,pc,phone1,
  phone2,fax,cell,email,processorid,username,password)

  VALUES(@CORPNAME,@FIRSTNAME,
         @LASTNAME,@ADDRESS1,@ADDRESS2,@CITY,@PROVINCE,
         @POSTALCODE,@PHONE1,@PHONE2,@FAX,
         @CELLPHONE,@EMAIL,@PROCESSORID,
	 @USERNAME,@PASSWORD)

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyersDelete
@ID bigint
AS
BEGIN

  DELETE FROM BuyerSpecies WHERE buyerid = @ID

  DELETE FROM Buyers WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyersGetById
@ID bigint
AS
BEGIN
  SELECT id,corpname,firstname,lastname,
         address1,address2,city,provinceid,pc,phone1,
         phone2,fax,cell,email,processorid,username,password
  FROM Buyers
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyersGetByUsername
@USERNAME varchar(50)
AS
BEGIN
  SELECT id,corpname,firstname,lastname,
         address1,address2,city,provinceid,pc,phone1,
         phone2,fax,cell,email,processorid,username,password
  FROM Buyers
  WHERE username = @USERNAME
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE BuyersGetSpeciesByBuyerId
@BUYERID bigint
AS
BEGIN
  SELECT id,speciesid
  FROM BuyersSpecies
  WHERE buyerid = @BUYERID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE BuyersUpdate
@ID bigint,
@CORPNAME varchar(100),
@FIRSTNAME varchar(50),
@LASTNAME varchar(50),
@USERNAME varchar(50),
@PASSWORD varchar(20),
@ADDRESS1 varchar(50),
@ADDRESS2 varchar(50),
@CITY varchar(50),
@PROVINCE tinyint,
@POSTALCODE varchar(50),
@PHONE1 varchar(30),
@PHONE2 varchar(30),
@FAX varchar(30),
@CELLPHONE varchar(30),
@EMAIL varchar(80),
@PROCESSORID int

AS
BEGIN
  UPDATE Buyers
  SET corpname = @CORPNAME,
      firstname = @FIRSTNAME,
      lastname = @LASTNAME,
      address1 = @ADDRESS1,
      address2 = @ADDRESS2,
      city = @CITY,
      provinceid = @PROVINCE,
      pc = @POSTALCODE,
      phone1 = @PHONE1,
      phone2 = @PHONE2,
      fax = @FAX,
      cell = @CELLPHONE,
      email = @EMAIL,
      processorid = @PROCESSORID,
      username = @USERNAME,
      password = @PASSWORD
  WHERE id = @ID


END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchBreakdownsCreate
@CATCHID bigint,
@DAY smallint,
@VALUE int
AS
BEGIN
  INSERT INTO CatchBreakdowns (catchid,day,value)
  VALUES(@CATCHID,@DAY,@VALUE)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchBreakdownsDelete
@CATCHID bigint,
@DAY smallint
AS
BEGIN
  DELETE FROM CatchBreakdowns
  WHERE catchid = @CATCHID
  AND day = @DAY
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchBreakdownsGetByCatchId
@CATCHID bigint
AS
BEGIN
  SELECT catchid,day,value
  FROM CatchBreakdowns
  WHERE catchid = @CATCHID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchBreakdownsUpdate
@CATCHID bigint,
@DAY smallint,
@VALUE int
AS
BEGIN
  UPDATE CatchBreakdowns
  SET value = @VALUE
  WHERE catchid = @CATCHID
  AND day = @DAY
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchGradesCreate
@CATCHID bigint,
@GRADEID int,
@VALUE int
AS
BEGIN
  INSERT INTO CatchGrades (catchid,gradeid,value)
  VALUES(@CATCHID,@GRADEID,@VALUE)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchGradesDelete
@CATCHID bigint,
@GRADEID int
AS
BEGIN
  DELETE FROM CatchGrades
  WHERE catchid = @CATCHID
  AND gradeid = @GRADEID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchGradesGetByCatchId
@CATCHID bigint
AS
BEGIN
  SELECT catchid,gradeid,value
  FROM CatchGrades
  WHERE catchid = @CATCHID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchGradesUpdate
@CATCHID bigint,
@GRADEID int,
@VALUE int
AS
BEGIN
  UPDATE CatchGrades
  SET value = @VALUE
  WHERE catchid = @CATCHID
  AND gradeid = @GRADEID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE CatchSuppliesCreate
@CATCHID bigint,
@SUPPLYID smallint,
@VALUE int
AS
BEGIN
  INSERT INTO CatchSupplies (catchid,supplyid,value)
  VALUES(@CATCHID,@SUPPLYID,@VALUE)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchSuppliesDelete
@CATCHID bigint,
@SUPPLYID smallint
AS
BEGIN
  DELETE FROM CatchSupplies
  WHERE catchid = @CATCHID
  AND supplyid = @SUPPLYID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchSuppliesGetByCatchId
@CATCHID bigint
AS
BEGIN
  SELECT catchid,supplyid,value
  FROM CatchSupplies
  WHERE catchid = @CATCHID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchSuppliesUpdate
@CATCHID bigint,
@SUPPLYID smallint,
@VALUE int
AS
BEGIN
  UPDATE CatchSupplies
  SET value = @VALUE
  WHERE supplyid = @SUPPLYID
  AND catchid = @CATCHID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchesCreate
@TRIPID bigint,
@SPECIESID int,
@QUANTITY int,
@CATCHDATE datetime
AS
BEGIN
  INSERT INTO catches (tripid,speciesid,quantity,catchdate)
  VALUES(@TRIPID,@SPECIESID,@QUANTITY,@CATCHDATE)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchesDelete
@ID bigint
AS
BEGIN

  DELETE FROM CatchSupplies WHERE catchid = @ID

  DELETE FROM CatchGrades WHERE catchid = @ID

  DELETE FROM CatchBreakdowns WHERE catchid = @ID

  DELETE FROM catches WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchesGetById
@ID bigint
AS
BEGIN
  SELECT id,tripid,speciesid,quantity,catchdate,stowid
  FROM catches
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchesGetByTripId
@TRIPID bigint
AS
BEGIN
  SELECT id,tripid,speciesid,quantity,catchdate,stowid
  FROM catches
  WHERE tripid = @TRIPID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE CatchesUpdate
@ID bigint,
@TRIPID bigint,
@SPECIESID int,
@QUANTITY int,
@CATCHDATE datetime
AS
BEGIN
  UPDATE catches
  SET tripid = @TRIPID,
      speciesid = @SPECIESID,
      quantity = @QUANTITY,
      catchdate = @CATCHDATE
  WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE GradesGetAll
@ID int
AS
BEGIN
  SELECT id,name,speciesid,abbr
  FROM Grades
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE GradesGetById
@ID int
AS
BEGIN
  SELECT id,name,speciesid,abbr
  FROM Grades
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE PortsGetActive
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  WHERE active = 1
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE PortsGetActiveByZone
@ZONEID int
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  WHERE active = 1
  AND zoneid = @ZONEID
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE PortsGetAll
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE PortsGetById
@ID int
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE ProcessorsGetAll
AS
BEGIN
	SELECT id,name,location,zoneid,accountbalance,istrading,demand,minbalance,phone
	FROM processors
	ORDER BY name
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE ProcessorsGetById
@ID int
AS
BEGIN
	SELECT id,name,location,zoneid,accountbalance,istrading,demand,minbalance,phone
	FROM processors
	WHERE id = @ID
END	
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE ProvincesGetAll
AS
BEGIN
  SELECT id,name
  FROM Provinces
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE ProvincesGetById
@ID tinyint
AS
BEGIN
  SELECT id,name
  FROM Provinces
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE SpeciesGetAll
@ID int
AS
BEGIN
  SELECT id,name
  FROM Species
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE SpeciesGetById
@ID int
AS
BEGIN
  SELECT id,name
  FROM Species
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE StatusReasonsGetAll
AS
BEGIN
  SELECT id,reason
  FROM StatusReason
  ORDER BY id
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE StatusReasonsGetById
@ID int
AS
BEGIN
  SELECT id,reason
  FROM StatusReason
  WHERE id = @ID
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE StowageGetAll
AS
BEGIN
  SELECT id,name
  FROM Stowage
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE StowageGetById
@ID int
AS
BEGIN
  SELECT id,name
  FROM Stowage
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE SuppliesGetAll
@ID tinyint
AS
BEGIN
  SELECT id,name,unittype
  FROM Supplies
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE SuppliesGetById
@ID tinyint
AS
BEGIN
  SELECT id,name,unittype
  FROM Supplies
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE TripPortsCreate
@TRIPID bigint,
@PORTID int,
@ALTERNATE tinyint,
@ISZONE bit
AS
BEGIN
  INSERT INTO TripPorts (tripid,portid,alternate,iszone)
  VALUES(@TRIPID,@PORTID,@ALTERNATE,@ISZONE)
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE TripPortsDelete
@TRIPID bigint,
@PORTID int
AS
BEGIN
  DELETE FROM TripPorts
  WHERE tripid = @TRIPID
  AND portid = @PORTID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE TripPortsGetByTripId
@TRIPID bigint
AS
BEGIN
  SELECT tripid,portid,alternate,iszone
  FROM TripPorts
  WHERE tripid = @TRIPID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE TripPortsGetZonesByTripId
@TRIPID bigint
AS
BEGIN
  SELECT tripid,portid,alternate,iszone
  FROM TripPorts
  WHERE tripid = @TRIPID
  AND iszone = 1
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE TripPortsUpdate
@TRIPID bigint,
@PORTID int,
@ALTERNATE tinyint,
@ISZONE bit
AS
BEGIN
  UPDATE TripPorts
  SET alternate = @ALTERNATE,
	  iszone = @ISZONE
  WHERE tripid = @TRIPID
  AND portid = @PORTID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsCreate
@VESSELID bigint,
@LOTID bigint,
@HAILOUTDATE datetime,
@DAYSOUT decimal,
@ETA datetime,
@HAILINDATE datetime,
@SPECIALINSTRUCTIONS text,
@AREAID int
AS
BEGIN
  INSERT INTO Trips
  (vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid)
  VALUES (@VESSELID,@LOTID,@HAILOUTDATE,@DAYSOUT,@ETA,@HAILINDATE,@SPECIALINSTRUCTIONS,@AREAID)


END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE TripsDelete
@ID bigint
AS
BEGIN
	
  DELETE FROM tripports WHERE tripid = @ID

  DELETE FROM trips WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetById
@ID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetByLotId
@LOTID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE lotid = @LOTID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetByVesselId
@VESSELID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE vesselid = @VESSELID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetOpenByVesselId
@VESSELID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE vesselid = @VESSELID
  AND hailindate is null
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetOpenTrips
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE hailindate is null

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsGetbyStatus
@STATUSID int
AS
BEGIN
  SELECT id, vesselid, lotid, hailoutdate, daysout, eta, hailindate, 
specialinstructions, areaid, statusid, statusreason, reason
  FROM Trips
  WHERE statusid = @STATUSID
  ORDER BY id DESC
 
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE TripsUpdate
@ID bigint,
@VESSELID bigint,
@LOTID bigint,
@HAILOUTDATE datetime,
@DAYSOUT decimal,
@ETA datetime,
@HAILINDATE datetime,
@SPECIALINSTRUCTIONS text,
@AREAID int
AS
BEGIN
  UPDATE Trips
  SET vesselid = @VESSELID,
      lotid = @LOTID,
      hailoutdate = @HAILOUTDATE,
      daysout = @DAYSOUT,
      eta = @ETA,
      hailindate = @HAILINDATE,
      specialinstructions = @SPECIALINSTRUCTIONS,
      areaid = @AREAID
  WHERE id = @ID

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE VesselCreate
@NAME varchar(250),
@CFV int,
@CAPTAIN varchar(100),
@PHONE1 varchar(50),
@PHONE2 varchar(50),
@PHONE3 varchar(50),
@EMAIL1 varchar(100),
@EMAIL2 varchar(100),
@EMAIL3 varchar(100),
@CAPACITY int,
@STOWID int,
@ACTIVE bit
AS
BEGIN

  INSERT INTO vessels
  (name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid,active)
  VALUES(@NAME,@CFV,@CAPTAIN,@PHONE1,@PHONE2,@PHONE3,@EMAIL1,@EMAIL2,@EMAIL3,@CAPACITY,@STOWID,@ACTIVE)


END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselDelete
@ID bigint
AS
BEGIN
  DELETE FROM Vessels
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselGetActive
AS
BEGIN
/*
  SELECT distinct(v.id),v.name,v.cfv,v.captain,v.phone1,v.phone2,v.phone3,v.email,v.email2,v.email3,v.capacity,v.stowid,v.active
  FROM vessels v,trips t
  WHERE v.id = t.vesselid
  AND ((hailindate is null AND t.statusid = 1) OR (t.statusid = 3))
  ORDER BY name
*/  
  SELECT v.id,v.name,v.cfv,v.captain,v.phone1,v.phone2,v.phone3,v.email,v.email2,v.email3,v.capacity,v.stowid,v.active
  FROM vessels v
  WHERE v.active = 1
  ORDER BY name
  
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselGetAll
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid,active
  FROM vessels
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE VesselGetAtSea
AS
BEGIN
  SELECT distinct(v.id),v.name,v.cfv,v.captain,v.phone1,v.phone2,v.phone3,v.email,v.email2,v.email3,v.capacity,v.stowid,v.active
  FROM vessels v,trips t
  WHERE v.id = t.vesselid
  AND hailindate is not null
  ORDER BY name
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselGetByCfv
@CFV int
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid,active
  FROM vessels
  WHERE cfv = @CFV
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselGetById
@ID bigint
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid,active
  FROM vessels
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE VesselGetByName
@NAME varchar(250)
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid
  FROM vessels
  WHERE name LIKE '%' + @NAME + '%'
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE VesselGetInactive
AS
BEGIN
/*
  SELECT v.id,v.name,v.cfv,v.captain,v.phone1,v.phone2,v.phone3,v.email,v.email2,v.email3,v.capacity,v.stowid,v.active
  FROM vessels v
  WHERE 
  (v.id NOT IN (SELECT vesselid FROM trips))
  OR

  (v.id IN (SELECT vesselid FROM trips WHERE statusid != 1))

  ORDER BY name
 */ 
    SELECT v.id,v.name,v.cfv,v.captain,v.phone1,v.phone2,v.phone3,v.email,v.email2,v.email3,v.capacity,v.stowid,v.active
  FROM vessels v
  WHERE v.active = 0
  ORDER BY name

END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE VesselUpdate
@ID bigint,
@NAME varchar(250),
@CFV int,
@CAPTAIN varchar(100),
@PHONE1 varchar(50),
@PHONE2 varchar(50),
@PHONE3 varchar(50),
@EMAIL1 varchar(100),
@EMAIL2 varchar(100),
@EMAIL3 varchar(100),
@CAPACITY int,
@STOWID int,
@ACTIVE bit
AS
BEGIN

  UPDATE vessels
  SET name = @NAME,
      cfv = @CFV,
      captain = @CAPTAIN,
      phone1 = @PHONE1,
      phone2 = @PHONE2,
      phone3 = @PHONE3,
      email = @EMAIL1,
      email2 = @EMAIL2,
      email3 = @EMAIL3,
      capacity = @CAPACITY,
      stowid = @STOWID,
      active = @ACTIVE
  WHERE id = @ID


END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE ZonesGetAll
AS
BEGIN
  SELECT id,name
  FROM zones
  ORDER BY name
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE ZonesGetById
@ID int
AS
BEGIN
  SELECT id,name
  FROM zones
  WHERE id = @ID
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_addtosourcecontrol
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId = 0

declare @iStreamObjectId int
select @iStreamObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()

declare @iReturnValue int
select @iReturnValue = 0

declare @iPropertyObjectId int
declare @vchParentId varchar(255)

declare @iObjectCount int
select @iObjectCount = 0

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError


    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment


    if @iReturn <> 0 GOTO E_OAError

    /* Set Database Properties */

    begin tran SetProperties

    /* add high level object */

    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'

    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)

    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL

    if @@error <> 0 GOTO E_General_Error

    commit tran SetProperties
    
    select @iObjectCount = 0;

CleanUp:
    select @vchProjectName
    select @iObjectCount
    return

E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_addtosourcecontrol_u
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Add an object to the dtproperties table
*/
create procedure dbo.dt_adduserobject
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create procedure dbo.dt_adduserobject_vcs
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_checkinobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_checkinobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3		



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_checkoutobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_checkoutobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.dt_displayoaerror
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo.dt_displayoaerror_u
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Drop one or all the associated properties of an object or an attribute 
**
**	dt_dropproperties objid, null or '' -- drop all properties of the object itself
**	dt_dropproperties objid, property -- drop the property
*/
create procedure dbo.dt_droppropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure dbo.dt_dropuserobjectbyid
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/* 
**	Generate an ansi name that is unique in the dtproperties.value column 
*/ 
create procedure dbo.dt_generateansiname(@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave 

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop_u
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid_u
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create procedure dbo.dt_getpropertiesbyid_vcs
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create procedure dbo.dt_getpropertiesbyid_vcs_u
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_isundersourcecontrol
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_isundersourcecontrol_u
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create procedure dbo.dt_removefromsourcecontrol

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		value -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		uvalue -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid_u
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_validateloginparams
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_validateloginparams_u
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_vcsenabled

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	This procedure returns the version number of the stored
**    procedures used by legacy versions of the Microsoft
**	Visual Database Tools.  Version is 7.0.00.
*/
create procedure dbo.dt_verstamp006
as
	select 7000

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*
**	This procedure returns the version number of the stored
**    procedures used by the the Microsoft Visual Database Tools.
**	Version is 7.0.05.
*/
create procedure dbo.dt_verstamp007
as
	select 7005

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_whocheckedout
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create proc dbo.dt_whocheckedout_u
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword  



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

