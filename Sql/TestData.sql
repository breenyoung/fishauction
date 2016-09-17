-- Temp Zones
INSERT INTO [Zones] ([id], [name])
VALUES 
  (1, 'Zone1')
GO

INSERT INTO [Zones] ([id], [name])
VALUES 
  (2, 'Zone2')
GO

-- Temp Ports
INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Alpha', 1, 1)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Beta', 1, 1)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Charlie', 1, 1)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Delta', 1, 1)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Tango', 2, 1)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ('Port Theta', 2, 0)
GO

INSERT INTO [Ports] ([name], [zoneid], [active])
VALUES 
  ( 'Harbor Cove', 1, 1)
GO


-- Temp Auction Status
INSERT INTO [AuctionStatus] ([id], [name])
VALUES 
  (1, 'status1')
GO

-- Temp Auction Status Reason
INSERT INTO [StatusReason] ([id], [reason])
VALUES 
  (1, 'reason1')
GO

-- Auction
INSERT INTO [AuctionLots] ([startdate], [enddate], [active], [startprice], [statusid], [statusreason])
VALUES 
  ('6/4/2004', '6/6/2004', 1, 1000, 1, 1)
GO

-- VESSEL

INSERT INTO [Vessels] ([name], [cfv], [captain], [phone1], [phone2], [phone3], [email], [email2], [email3], [capacity], [stowid])
VALUES 
  ('Omega Prime', 666666, 'Captain Young', '1111111', '222222', '333333', 'email@email.com', 'email2@email.com', 'email3@email.com', 10000, 2)
GO



-- TRIP

INSERT INTO [Trips] ([vesselid], [lotid], [hailoutdate], [daysout], [eta], [hailindate], [specialinstructions])
VALUES 
  (1, 1, '6/2/2004', 2, 1, '6/3/2004', 'blah blah')
GO

-- Trip Ports
INSERT INTO [TripPorts] ([portid], [tripid], [alternate])
VALUES 
  (1, 1, 1)
GO

INSERT INTO [TripPorts] ([portid], [tripid], [alternate])
VALUES 
  (2, 1, 1)
GO

INSERT INTO [TripPorts] ([portid], [tripid], [alternate])
VALUES 
  (4, 1, 2)
GO

INSERT INTO [TripPorts] ([portid], [tripid], [alternate])
VALUES 
  (7, 1, 1)
GO


-- Catch
INSERT INTO [Catches] ([tripid], [speciesid], [quantity], [catchdate])
VALUES 
  (1, 1, 2345, '6/3/2004')
GO

-- Catch Grades
INSERT INTO [CatchGrades] ([catchid], [gradeid], [value])
VALUES 
  (2, 1, 25)
GO

INSERT INTO [CatchGrades] ([catchid], [gradeid], [value])
VALUES 
  (2, 2, 25)
GO

INSERT INTO [CatchGrades] ([catchid], [gradeid], [value])
VALUES 
  (2, 3, 25)
GO

INSERT INTO [CatchGrades] ([catchid], [gradeid], [value])
VALUES 
  (2, 4, 25)
GO

-- Catch Supplies
INSERT INTO [CatchSupplies] ([catchid], [supplyid], [value])
VALUES 
  (2, 1, 400)
GO


-- Catch Breakdowns
INSERT INTO [CatchBreakdowns] ([catchid], [day], [value])
VALUES 
  (2, 1, 2000)
GO

INSERT INTO [CatchBreakdowns] ([catchid], [day], [value])
VALUES 
  (2, 2, 345)
GO




COMMIT
GO
