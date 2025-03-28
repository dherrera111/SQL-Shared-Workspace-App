CREATE TABLE [dbo].[LeaseTerm]
(
	[LeaseTermId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [LeaseName] VARCHAR(50) NOT NULL,
	CHECK ([LeaseName] IN ('day', 'week', 'month'))
)
