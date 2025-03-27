CREATE TABLE [dbo].[LeaseTerm]
(
	[LeaseTermId] INT NOT NULL PRIMARY KEY, 
    [LeaseName] VARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_LeaseTerm_Workspace] FOREIGN KEY ([LeaseTermId]) REFERENCES [Workspace]([LeaseTermId])
)
