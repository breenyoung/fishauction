CREATE PROCEDURE BidsGetWinningByProcId
@PROCID int,
@NOW datetime
AS
BEGIN
	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers,processors p WHERE processorid = @PROCID)
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 1
	AND al.enddate > @NOW
END	

--**********************************************************

CREATE PROCEDURE BidsGetLosingByProcId
@PROCID int,
@NOW datetime
AS
BEGIN

	SELECT b.avgperlb,b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,b.xlgrade
	
	FROM bids b, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers,processors p WHERE processorid = @PROCID)
	AND b.buyerid NOT IN (SELECT buyerid FROM auctionhighbids where auctionid = b.lotid)
	AND b.lotid = al.id
	AND al.active = 1
	AND al.enddate > @NOW	
	ORDER BY b.lotid, b.avgperlb DESC
END	

--**********************************************************

CREATE PROCEDURE BidsGetWonByProcId
@PROCID int,
@NOW datetime,
@YESTERDAY datetime
AS
BEGIN

	SELECT b.id,b.buyerid,b.amount,
		b.biddate,b.lotid,b.selectedport,
		b.sgrade,b.mgrade,b.lgrade,
		b.xlgrade,b.avgperlb,a.amount
		
	FROM bids b, auctionhighbids a, auctionlots al
	WHERE b.buyerid IN (SELECT buyers.id FROM buyers,processors p WHERE processorid = @PROCID)
	AND b.buyerid = a.buyerid
	AND b.id = a.bidid
	AND a.auctionid = al.id
	AND al.active = 0
	AND al.enddate > @YESTERDAY
	AND al.enddate < @NOW
	
END	
