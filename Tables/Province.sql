CREATE TABLE [dbo].[Province]
(
	[ProvinceId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [ProvinceName] NVARCHAR(50) NOT NULL, 
    [CountryId] INT NOT NULL, 
    CONSTRAINT [FK_Province_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country]([CountryId])
)
