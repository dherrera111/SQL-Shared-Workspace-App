CREATE TABLE [dbo].[Property]
(
	[PropertyId] INT NOT NULL PRIMARY KEY, 
    [CityId] INT NOT NULL, 
    [PropertyName] VARCHAR(50) NOT NULL, 
    [PropertyAdress] VARCHAR(250) NOT NULL, 
    [PropertyPostalCode] VARCHAR(10) NOT NULL, 
    [Neighborhood] VARCHAR(50) NOT NULL, 
    [HasParkingLot] BIT NULL, 
    [HasPublicTransport] BIT NULL, 
    [Area] DECIMAL(18, 4) NOT NULL, 
   
)

