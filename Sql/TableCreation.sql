
DROP TABLE CatchSupplies
GO

DROP TABLE Supplies
GO

DROP TABLE TripPorts
GO

DROP TABLE PortType
GO

DROP TABLE Grades
GO

DROP TABLE Catches
GO

DROP TABLE Trips
GO

DROP TABLE Vessels
GO

DROP TABLE Stowage
GO

DROP TABLE Ports
GO

DROP TABLE BuyerSpecies
GO

DROP TABLE Species
GO

DROP TABLE Bids
GO

DROP TABLE Buyers
GO

DROP TABLE Processors
GO

DROP TABLE Zones
GO

DROP TABLE Provinces
GO

DROP TABLE AuctionLots
GO

DROP TABLE StatusReason
GO

DROP TABLE AuctionStatus
GO

DROP TABLE Admin
GO

DROP TABLE AdminClasses
GO

DROP TABLE CatchGrades
GO

DROP TABLE CatchBreakdowns
GO

DROP TABLE AuctionHighBids
GO

DROP TABLE Areas
GO

DROP TABLE Sites
GO

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------


-- ADMINCLASSES

CREATE TABLE [AdminClasses] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__AdminClasses__78B3EFCA] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- ADMIN

CREATE TABLE [Admin] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [classid] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [description] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [username] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [password] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  CONSTRAINT [PK__Admin__76CBA758] PRIMARY KEY ([id]),
  CONSTRAINT [fk_admin_classid] FOREIGN KEY ([classid]) REFERENCES [AdminClasses] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO

-- AUCTIONSTATUS

CREATE TABLE [AuctionStatus] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__AuctionStatus__7C8480AE] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- STATUSREASON

CREATE TABLE [StatusReason] (
  [id] int NOT NULL,
  [reason] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__StatusReason__1367E606] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- AUCTIONLOTS

CREATE TABLE [AuctionLots] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [startdate] datetime,
  [enddate] datetime,
  [active] bit,
  [startprice] money,
  [statusid] int,
  [statusreason] int,
  [confirmed] tinyint,
  CONSTRAINT [PK__AuctionLots__7A9C383C] PRIMARY KEY ([id]),
  CONSTRAINT [fk_al_statusid] FOREIGN KEY ([statusid]) REFERENCES [AuctionStatus] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_al_statusreason] FOREIGN KEY ([statusreason]) REFERENCES [StatusReason] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- PROVINCES

CREATE TABLE [Provinces] (
  [id] tinyint NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Provinces__0EA330E9] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- ZONES

CREATE TABLE [Zones] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Zones__1B0907CE] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- PROCESSORS

CREATE TABLE [Processors] (
  [id] int NOT NULL,
  [name] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [location] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [zoneid] int,
  CONSTRAINT [PK__Processors__0CBAE877] PRIMARY KEY ([id]),
  CONSTRAINT [fk_processor_zoneid] FOREIGN KEY ([zoneid]) REFERENCES [Zones] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO

-- BUYERS

CREATE TABLE [Buyers] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [corpname] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [firstname] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [lastname] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [address1] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [address2] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [city] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [provinceid] tinyint NOT NULL,
  [pc] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [phone1] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [phone2] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [fax] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [cell] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [email] varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [processorid] int,
  [username] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [password] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS,
  CONSTRAINT [PK__Buyers__023D5A04] PRIMARY KEY ([id]),
  CONSTRAINT [fk_buyers_processorid] FOREIGN KEY ([processorid]) REFERENCES [Processors] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_buyers_provinceid] FOREIGN KEY ([provinceid]) REFERENCES [Provinces] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO

-- BIDS

CREATE TABLE [Bids] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [buyerid] bigint NOT NULL,
  [amount] money NOT NULL,
  [biddate] datetime NOT NULL,
  [lotid] bigint NOT NULL,
  [selectedport] int,
  [sgrade] float,
  [mgrade] float,
  [lgrade] float,
  [xlgrade] float,
  [avgperlb] float  
  CONSTRAINT [PK__Bids__7F60ED59] PRIMARY KEY ([id]),
  CONSTRAINT [fk_bids_buyerid] FOREIGN KEY ([buyerid]) REFERENCES [Buyers] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_bids_lotid] FOREIGN KEY ([lotid]) REFERENCES [AuctionLots] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
  CONSTRAINT [fk_bids_portid] FOREIGN KEY ([selectedport]) REFERENCES [Ports] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION  
)
ON [PRIMARY]
GO



-- SPECIES

CREATE TABLE [Species] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Species__108B795B] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO



-- BUYERSPECIES

CREATE TABLE [BuyerSpecies] (
  [buyerid] bigint,
  [speciesid] int,
  CONSTRAINT [fk_bs_speciesid] FOREIGN KEY ([speciesid]) REFERENCES [Species] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- PORTS


CREATE TABLE [Ports] (
  [id] int NOT NULL,
  [name] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [zoneid] int NOT NULL,
  [active] tinyint NOT NULL,
  CONSTRAINT [PK__Ports__0AD2A005] PRIMARY KEY ([id]),
  CONSTRAINT [fk_port_zoneid] FOREIGN KEY ([zoneid]) REFERENCES [Zones] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- STOWAGE

CREATE TABLE [Stowage] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Stowage__15502E78] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO


-- VESSELS

CREATE TABLE [Vessels] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [name] varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [cfv] int,
  [captain] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [phone1] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [phone2] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [phone3] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [email] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [email2] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [email3] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS,
  [capacity] int,
  [stowid] int,
  CONSTRAINT [PK__Vessels__1CF15040] PRIMARY KEY ([id]),
  CONSTRAINT [UQ__Vessels__6442E2C9] UNIQUE ([cfv]),
  CONSTRAINT [fk_vessel_stowid] FOREIGN KEY ([stowid]) REFERENCES [Stowage] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- AREAS

CREATE TABLE [Areas] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [abbr] varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Areas__7D439ABD] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- TRIPS

CREATE TABLE [Trips] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [vesselid] bigint,
  [lotid] bigint,
  [hailoutdate] datetime,
  [daysout] decimal(10, 0),
  [eta] datetime,
  [hailindate] datetime,
  [specialinstructions] text COLLATE SQL_Latin1_General_CP1_CI_AS,
  [areaid] int,
  CONSTRAINT [PK__Trips__1920BF5C] PRIMARY KEY ([id]),
  CONSTRAINT [fk_trip_vesselid] FOREIGN KEY ([vesselid]) REFERENCES [Vessels] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_trip_lotid] FOREIGN KEY ([lotid]) REFERENCES [AuctionLots] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_trip_areaid] FOREIGN KEY ([areaid]) REFERENCES [Areas] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

-- CATCHES


CREATE TABLE [Catches] (
  [id] bigint IDENTITY(1, 1) NOT NULL,
  [tripid] bigint NOT NULL,
  [speciesid] int NOT NULL,
  [quantity] int NOT NULL,
  [catchdate] datetime NOT NULL,
  CONSTRAINT [PK__Catches__0425A276] PRIMARY KEY ([id]),
  CONSTRAINT [fk_catch_speciesid] FOREIGN KEY ([speciesid]) REFERENCES [Species] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_catch_tripid] FOREIGN KEY ([tripid]) REFERENCES [Trips] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO



-- GRADES

CREATE TABLE [Grades] (
  [id] int NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [speciesid] int NOT NULL,
  [abbr] varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__Grades__07020F21] PRIMARY KEY ([id]),
  CONSTRAINT [fk_grade_speciesid] FOREIGN KEY ([speciesid]) REFERENCES [Species] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO



-- PORTTYPE

CREATE TABLE [PortType] (
  [id] tinyint NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK__PortType__08EA5793] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO


-- TRIPPORTS


CREATE TABLE [TripPorts] (
  [tripid] bigint NOT NULL,
  [portid] int NOT NULL,
  [alternate] tinyint NOT NULL,
  CONSTRAINT [fk_tripport_tripid] FOREIGN KEY ([tripid]) REFERENCES [Trips] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_tripport_portid] FOREIGN KEY ([portid]) REFERENCES [Ports] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_tripport_alt] FOREIGN KEY ([alternate]) REFERENCES [PortType] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- SUPPLIES
CREATE TABLE [Supplies] (
  [id] smallint NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [unittype] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS,
  CONSTRAINT [PK__Supplies__70DDC3D8] PRIMARY KEY ([id])
)
ON [PRIMARY]
GO

-- CATCHSUPPLIES
CREATE TABLE [CatchSupplies] (
  [catchid] bigint NOT NULL,
  [supplyid] smallint NOT NULL,
  [value] int NOT NULL,
  CONSTRAINT [fk_cs_catchid] FOREIGN KEY ([catchid]) REFERENCES [Catches] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_cs_supplyid] FOREIGN KEY ([supplyid]) REFERENCES [Supplies] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- CATCHGRADES

CREATE TABLE [CatchGrades] (
  [catchid] bigint NOT NULL,
  [gradeid] int NOT NULL,
  [value] int NOT NULL,
  CONSTRAINT [fk_cg_catchid] FOREIGN KEY ([catchid]) REFERENCES [Catches] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_cs_gradeid] FOREIGN KEY ([gradeid]) REFERENCES [Grades] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO

-- CATCHBREAKDOWNS

CREATE TABLE [CatchBreakdowns] (
  [catchid] bigint NOT NULL,
  [day] smallint NOT NULL,
  [value] int NOT NULL,
  CONSTRAINT [fk_cb_catchid] FOREIGN KEY ([catchid]) REFERENCES [Catches] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO

-- AUCTIONHIGHBIDS

CREATE TABLE [AuctionHighBids] (
  [auctionid] bigint NOT NULL,
  [buyerid] bigint NOT NULL,
  [amount] float NOT NULL,
  [biddate] datetime NOT NULL,  
  CONSTRAINT [PK__AuctionHighBids__797309D9] PRIMARY KEY ([auctionid]),
  CONSTRAINT [fk_ahb_auctionid] FOREIGN KEY ([auctionid]) REFERENCES [AuctionLots] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT [fk_ahb_buyerid] FOREIGN KEY ([buyerid]) REFERENCES [Buyers] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO


-- TENTATIVE table
CREATE TABLE [Sites] (
  [id] bigint NOT NULL,
  [name] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [abbr] varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [portid] int NOT NULL,
  CONSTRAINT [PK__Sites__02084FDA] PRIMARY KEY ([id]),
  CONSTRAINT [fk_sites_portid] FOREIGN KEY ([portid]) REFERENCES [dbo].[Ports] ([id])
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
)
ON [PRIMARY]
GO
