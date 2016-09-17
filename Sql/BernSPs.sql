-- BERN
DROP PROCEDURE AuctionLotsGetWinner
GO
CREATE PROCEDURE AuctionLotsGetWinner
@AUCTIONID bigint
AS
BEGIN
	SELECT b.id,b.firstname,b.lastname
	FROM buyer b,auctionhighbids a
	WHERE a.auctionid = @AUCTIONID
	AND a.buyerid = b.id
END 