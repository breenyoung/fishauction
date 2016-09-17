

-- SPECIES

DELETE FROM [Species]
GO

INSERT INTO [Species] ([id],[name])
VALUES 
  (1,'Shrimp')
GO


-- STOWAGE

DELETE FROM [Stowage]
GO

INSERT INTO [Stowage] ([id],[name])
VALUES (1,'Bags')
GO

INSERT INTO [Stowage] ([id],[name])
VALUES 
  (2,'Pans')
GO

INSERT INTO [Stowage] ([id],[name])
VALUES 
  (3,'Insulated Containers')
GO

INSERT INTO [Stowage] ([id],[name])
VALUES 
  (4,'Bags & Pans')
GO

INSERT INTO [Stowage] ([id],[name])
VALUES 
  (5,'Bags & Insulated Containers')
GO

INSERT INTO [Stowage] ([id],[name])
VALUES 
  (6,'Pans & Insulated Containers')
GO


-- SUPPLIES

DELETE FROM [Supplies]
GO

INSERT INTO [Supplies] ([id], [name], [unittype])
VALUES 
  (1, 'Ice', 'tons')
GO

INSERT INTO [Supplies] ([id], [name], [unittype])
VALUES 
  (2, 'Bags', 'units')
GO

INSERT INTO [Supplies] ([id], [name], [unittype])
VALUES 
  (3, 'Pans', 'units')
GO

INSERT INTO [Supplies] ([id], [name], [unittype])
VALUES 
  (4, 'Insulated Containers', 'units')
GO
-- GRADES

DELETE FROM [Grades]
GO

INSERT INTO [Grades] ([id],[name], [speciesid], [abbr])
VALUES 
  (1, 'Small', 1, 'SM')
GO

INSERT INTO [Grades] ([id],[name], [speciesid], [abbr])
VALUES 
  (2, 'Medium', 1, 'M')
GO

INSERT INTO [Grades] ([id],[name], [speciesid], [abbr])
VALUES 
  (3, 'Large', 1, 'L')
GO

INSERT INTO [Grades] ([id],[name], [speciesid], [abbr])
VALUES 
  (4, 'Extra Large', 1, 'XL')
GO

-- PORTTYPE

DELETE FROM [PortType]
GO

INSERT INTO [PortType] ([id],[name])
VALUES 
  (1, 'Preferred')
GO

INSERT INTO [PortType] ([id],[name])
VALUES 
  (2, 'Alternate')
GO


-- PROVINCES

DELETE FROM [Provinces]
GO


INSERT INTO [Provinces] ([id], [name])
VALUES 
  (1, 'Nova Scotia')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (2, 'New Brunswick')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (3, 'Prince Edward Island')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (5, 'Newfoundland')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (6, 'Ontario')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (7, 'Manitoba')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (8, 'Saskatchewan')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (9, 'Alberta')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (10, 'British Columbia')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (11, 'Yukon')
GO

INSERT INTO [Provinces] ([id], [name])
VALUES 
  (12, 'North West Territories')
GO


-- PROCESSORS

DELETE FROM [Processors]

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (1, 'Daley Brothers Limited', 'St. Josephs', 5)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (2, 'FPI Ltd.', 'Port Union', 5)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (3, 'Quinlan Brothers Ltd.', 'Bay de Verde', 5)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (4, 'Quin-Sea Fisheries Ltd.', 'Old Perlican', 5)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (5, 'Fogo Island Co-op', 'Seldom', 4)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (6, 'Notre Dame Seafoods', 'Twillingate', 4)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (7, 'Northern Shrimp Company', 'Jacksons Arm', 4)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (8, 'Black Duck Cove Fisheries Ltd.', 'Black Duck Cove', 2)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (9, 'FPI Ltd.', 'Port aux Choix', 2)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (10, 'Daley Brothers Limited', 'Anchor Point', 2)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (11, 'St. Anthony Seafoods Ltd.', 'St. Anthony', 3)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (12, 'Labrador Choice Seafoods Ltd.', 'Charlottetown', 1)
GO

INSERT INTO [Processors] ([id], [name], [location], [zoneid])
VALUES 
  (13, 'Terra Nova Fisheries Ltd.', 'Clarenville', 5)
GO

-- AREAS

DROP FROM [Areas]

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (1, 'Hawke Channel', 'Hawke')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (2, 'St. Anthony Basin', 'Basin')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (3, 'Tobins Point', 'Tobins')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (4, 'The Edge', 'Edge')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (5, '4R', '4R')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (6, 'The Porkchop', 'Chop')
GO

INSERT INTO [Areas] ([id], [name], [abbr])
VALUES 
  (7, 'The Hole/4R', 'Hole4R')
GO


COMMIT
GO




