DROP PROCEDURE AdminUserGetById
GO

DROP PROCEDURE AdminUserGetByUsername
GO

DROP PROCEDURE AuctionLotsCreate
GO

DROP PROCEDURE AuctionLotsDelete
GO

DROP PROCEDURE AuctionLotsGetById
GO

DROP PROCEDURE AuctionLotsUpdate
GO

DROP PROCEDURE BidsCreate
GO

DROP PROCEDURE BidsDelete
GO

DROP PROCEDURE BidsGetByAuctionId
GO

DROP PROCEDURE BidsGetById
GO

DROP PROCEDURE BidsUpdate
GO

DROP PROCEDURE VesselCreate
GO

DROP PROCEDURE VesselUpdate
GO

DROP PROCEDURE VesselGetById
GO

DROP PROCEDURE VesselDelete
GO

DROP PROCEDURE VesselGetByCfv
GO

DROP PROCEDURE VesselGetAll
GO

DROP PROCEDURE VesselGetByName
GO

DROP PROCEDURE TripsGetById
GO

DROP PROCEDURE TripsGetByVesselId
GO

DROP PROCEDURE TripsCreate
GO

DROP PROCEDURE TripsDelete
GO

DROP PROCEDURE TripsGetOpenTrips
GO

DROP PROCEDURE CatchesGetById
GO

DROP PROCEDURE CatchesCreate
GO

DROP PROCEDURE CatchesUpdate
GO

DROP PROCEDURE CatchesDelete
GO

DROP PROCEDURE CatchSuppliesCreate
GO

DROP PROCEDURE CatchSuppliesUpdate
GO

DROP PROCEDURE CatchSuppliesDelete
GO

DROP PROCEDURE CatchSuppliesGetByCatchId
GO

DROP PROCEDURE BuyerSpeciesDelete
GO

DROP PROCEDURE BuyerSpeciesCreate
GO

DROP PROCEDURE BuyersCreate
GO

DROP PROCEDURE BuyersUpdate
GO

DROP PROCEDURE BuyersDelete
GO

DROP PROCEDURE BuyersGetById
GO

DROP PROCEDURE BuyersGetByUsername
GO

DROP PROCEDURE BuyersGetSpeciesByBuyerId
GO

DROP PROCEDURE TripsGetByLotId
GO


DROP PROCEDURE AuctionLotsGetActive
GO

DROP PROCEDURE CatchesGetByTripId
GO

DROP PROCEDURE CatchGradesGetByCatchId
GO

DROP PROCEDURE CatchGradesCreate
GO

DROP PROCEDURE CatchGradesUpdate
GO

DROP PROCEDURE CatchGradesDelete
GO

DROP PROCEDURE GradesGetById
GO

DROP PROCEDURE GradesGetAll
GO

DROP PROCEDURE ProvincesGetById
GO

DROP PROCEDURE ProvincesGetAll
GO

DROP PROCEDURE SuppliesGetById
GO

DROP PROCEDURE SuppliesGetAll
GO

DROP PROCEDURE StowageGetById
GO

DROP PROCEDURE StowageGetAll
GO

DROP PROCEDURE BidsGetHighBid
GO

DROP PROCEDURE CatchBreakdownsCreate
GO

DROP PROCEDURE CatchBreakdownsUpdate
GO

DROP PROCEDURE CatchBreakdownsDelete
GO

CREATE PROCEDURE CatchBreakdownsGetByCatchId
GO

DROP PROCEDURE TripPortsGetByTripId
GO

DROP PROCEDURE TripPortsCreate
GO

DROP PROCEDURE TripPortsUpdate
GO

DROP PROCEDURE TripPortsDelete
GO

DROP PROCEDURE PortsGetById
GO

DROP PROCEDURE PortsGetAll
GO

DROP PROCEDURE AreasGetById
GO

DROP PROCEDURE AreasGetAll
GO

DROP PROCEDURE BidsGetByBuyerId
GO

DROP PROCEDURE BidsGetWinningByBuyerId
GO

DROP PROCEDURE BidsGetNextHighest
GO

DROP PROCEDURE ProcessorsGetById
GO

DROP PROCEDURE ProcessorsGetAll
GO 

DROP PROCEDURE AuctionLotsGetClosed
GO

DROP PROCEDURE AuctionLotsGetActiveCount
GO

DROP PROCEDURE AuctionLotsMarkInactive
GO

DROP PROCEDURE AuctionLotsGetByActiveFlag
GO

DROP PROCEDURE StatusReasonsGetAll
GO


DROP PROCEDURE ZonesGetAll
GO

DROP PROCEDURE ZonesGetById
GO

DROP PROCEDURE PortsGetActive
GO

DROP PROCEDURE AuctionLotsGetConfirmed
GO

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------



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

CREATE PROCEDURE AuctionLotsDelete
@ID bigint
AS
BEGIN

  DELETE FROM AuctionHighBids
  WHERE auctionid = @ID

  DELETE FROM auctionlots
  WHERE id = @ID
END
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



ALTER PROCEDURE BidsCreate
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


CREATE PROCEDURE BidsDelete
@ID bigint
AS
BEGIN
  DELETE FROM bids
  WHERE id = @ID
END
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

CREATE PROCEDURE BidsGetById
@ID bigint
AS
BEGIN
  SELECT id,buyerid,amount,biddate,lotid,selectedport,sgrade,mgrade,lgrade,xlgrade,avgperlb
  FROM Bids
  WHERE id = @ID
END
GO

ALTER PROCEDURE BidsUpdate
@ID bigint,
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
@STOWID int
AS
BEGIN

  INSERT INTO vessels
  (name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid)
  VALUES(@NAME,@CFV,@CAPTAIN,@PHONE1,@PHONE2,@PHONE3,@EMAIL1,@EMAIL2,@EMAIL3,@CAPACITY,@STOWID)
  
  
END
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
@STOWID int
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
      stowid = @STOWID
  WHERE id = @ID


END
GO

CREATE PROCEDURE VesselGetById
@ID bigint
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid
  FROM vessels
  WHERE id = @ID
END
GO

CREATE PROCEDURE VesselDelete
@ID bigint
AS
BEGIN
  DELETE FROM Vessels
  WHERE id = @ID
END
GO

CREATE PROCEDURE VesselGetByCfv
@CFV int
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid
  FROM vessels
  WHERE cfv = @CFV
END
GO

CREATE PROCEDURE VesselGetAll
AS
BEGIN
  SELECT id,name,cfv,captain,phone1,phone2,phone3,email,email2,email3,capacity,stowid
  FROM vessels
  ORDER BY name
END
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

CREATE PROCEDURE TripsGetById
@ID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE id = @ID
END
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

CREATE PROCEDURE TripsDelete
@ID bigint
AS
BEGIN
	
  DELETE FROM tripports WHERE tripid = @ID

  DELETE FROM trips WHERE id = @ID
END
GO

CREATE PROCEDURE TripsGetOpenTrips
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,areaid,statusid,statusreason,reason
  FROM Trips
  WHERE hailindate is null
  
END
GO

CREATE PROCEDURE CatchesGetById
@ID bigint
AS
BEGIN
  SELECT id,tripid,speciesid,quantity,catchdate
  FROM catches
  WHERE id = @ID
END
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

CREATE PROCEDURE CatchSuppliesGetByCatchId
@CATCHID bigint
AS
BEGIN
  SELECT catchid,supplyid,value
  FROM CatchSupplies
  WHERE catchid = @CATCHID
END
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

CREATE PROCEDURE BuyerSpeciesCreate
@BUYERID bigint,
@SPECIESID int
AS
BEGIN
  INSERT INTO BuyerSpecies (buyerid,speciesid)
  VALUES(@BUYERID,@SPECIESID)
END
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

CREATE PROCEDURE BuyersDelete
@ID bigint
AS
BEGIN

  DELETE FROM BuyerSpecies WHERE buyerid = @ID

  DELETE FROM Buyers WHERE id = @ID
END
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

CREATE PROCEDURE BuyersGetSpeciesByBuyerId
@BUYERID bigint
AS
BEGIN
  SELECT id,speciesid
  FROM BuyersSpecies
  WHERE buyerid = @BUYERID
END
GO

CREATE PROCEDURE TripsGetByLotId
@LOTID bigint
AS
BEGIN
  SELECT id,vesselid,lotid,hailoutdate,daysout,eta,hailindate,specialinstructions,statusid,statusreason,reason
  FROM Trips
  WHERE lotid = @LOTID
END
GO

CREATE PROCEDURE AuctionLotsGetActive
AS
BEGIN
  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE active = 1
  AND enddate < getdate()
END
GO

CREATE PROCEDURE CatchesGetByTripId
@TRIPID bigint
AS
BEGIN
  SELECT id,tripid,speciesid,quantity,catchdate
  FROM catches
  WHERE tripid = @TRIPID
END
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


CREATE PROCEDURE GradesGetById
@ID int
AS
BEGIN
  SELECT id,name,speciesid,abbr
  FROM Grades
  WHERE id = @ID
END
GO

CREATE PROCEDURE GradesGetAll
@ID int
AS
BEGIN
  SELECT id,name,speciesid,abbr
  FROM Grades
END
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

CREATE PROCEDURE ProvincesGetAll
AS
BEGIN
  SELECT id,name
  FROM Provinces
  ORDER BY name
END
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

CREATE PROCEDURE SuppliesGetAll
@ID tinyint
AS
BEGIN
  SELECT id,name,unittype
  FROM Supplies
END
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

CREATE PROCEDURE StowageGetAll
AS
BEGIN
  SELECT id,name
  FROM Stowage
END
GO

/* OLD
CREATE PROCEDURE BidsGetHighBid
@LOTID bigint
AS
BEGIN
  SELECT id,buyerid,MAX(amount) amount,biddate,lotid
  FROM Bids
  WHERE lotid = @LOTID
  GROUP BY id,buyerid,amount,biddate,lotid
END
GO
*/

-- NEW
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


CREATE PROCEDURE SpeciesGetById
@ID int
AS
BEGIN
  SELECT id,name
  FROM Species
  WHERE id = @ID
END
GO

CREATE PROCEDURE SpeciesGetAll
@ID int
AS
BEGIN
  SELECT id,name
  FROM Species
END
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

CREATE PROCEDURE CatchBreakdownsGetByCatchId
@CATCHID bigint
AS
BEGIN
  SELECT catchid,day,value
  FROM CatchBreakdowns
  WHERE catchid = @CATCHID
END
GO

CREATE PROCEDURE TripPortsGetByTripId
@TRIPID bigint
AS
BEGIN
  SELECT tripid,portid,alternate
  FROM TripPorts
  WHERE tripid = @TRIPID
END
GO

CREATE PROCEDURE TripPortsCreate
@TRIPID bigint,
@PORTID int,
@ALTERNATE tinyint
AS
BEGIN
  INSERT INTO TripPorts (tripid,portid,alternate)
  VALUES(@TRIPID,@PORTID,@ALTERNATE)
END
GO

CREATE PROCEDURE TripPortsUpdate
@TRIPID bigint,
@PORTID int,
@ALTERNATE tinyint
AS
BEGIN
  UPDATE TripPorts
  SET alternate = @ALTERNATE
  WHERE tripid = @TRIPID
  AND portid = @PORTID
  
END
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

CREATE PROCEDURE PortsGetById
@ID int
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  WHERE id = @ID
END
GO

CREATE PROCEDURE PortsGetAll
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  ORDER BY name
END
GO


------*

CREATE PROCEDURE AreasGetById
@ID int
AS
BEGIN
  SELECT id,name,abbr
  FROM areas
  WHERE id = @ID
END
GO


CREATE PROCEDURE AreasGetAll
AS
BEGIN
  SELECT id,name,abbr
  FROM areas
  ORDER BY name
END
GO

CREATE PROCEDURE BidsGetByBuyerId
@BUYERID bigint
AS
BEGIN
	SELECT id,buyerid,amount,biddate,lotid
	FROM bids
	WHERE buyerid  = @BUYERID
END	
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

CREATE PROCEDURE BidsGetNextHighest
@LOTID bigint,
@HIGHBID float
AS

SET TRANSACTION ISOLATION LEVEL READ committed

BEGIN
	SELECT MAX(avgperlb) amount FROM
	bids
	WHERE avgperlb != @HIGHBID
	AND lotid = @LOTID 
END
GO

CREATE PROCEDURE ProcessorsGetById
@ID int
AS
BEGIN
	SELECT id,name,location,zoneid,accountbalance,istrading,demand,minbalance
	FROM processors
	WHERE id = @ID
END
GO

CREATE PROCEDURE ProcessorsGetAll
AS
BEGIN
	SELECT id,name,location,zoneid,accountbalance,istrading,demand,minbalance
	FROM processors
	ORDER BY name
END	
GO

CREATE PROCEDURE AuctionLotsGetClosed
--@NOW datetime
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  --WHERE enddate < @NOW
  WHERE active = 0
  
END
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


CREATE PROCEDURE AuctionLotsMarkInactive
@ID bigint
AS
BEGIN

  UPDATE auctionlots
  SET active = 0
  WHERE id = @ID

END
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

CREATE PROCEDURE StatusReasonsGetAll
AS
BEGIN
  SELECT id,reason
  FROM StatusReason
  ORDER BY reason
END
GO

CREATE PROCEDURE ZonesGetAll
AS
BEGIN
  SELECT id,name
  FROM zones
  ORDER BY name
END
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



CREATE PROCEDURE PortsGetActive
AS
BEGIN
  SELECT id,name,active,zoneid
  FROM ports
  WHERE active = 1
  ORDER BY name
END
GO

CREATE PROCEDURE AuctionLotsGetConfirmed
AS
BEGIN


  SELECT id,startdate,enddate,active,startprice,statusid,statusreason,confirmed
  FROM auctionlots
  WHERE confirmed = 1
  
END
GO