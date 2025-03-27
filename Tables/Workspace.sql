CREATE TABLE [dbo].[Workspace]
(
	[WorkspaceId] INT  NOT NULL PRIMARY KEY, 
    [PropertyId] INT  NOT NULL, 
    [FloorNumber] INT NOT NULL, 
    [WorkspaceTypeId] INT NOT NULL, 
    [LeaseTermId] INT NOT NULL, 
    [RoomNumber] VARCHAR(50) UNIQUE NOT NULL, 
    [MaxCapacity] INT NOT NULL, 
    [AvailableDate] DATE NOT NULL, 
    [Price] NUMERIC NOT NULL, 
    [UserId] INT NOT NULL, 
    CONSTRAINT [FK_Workspace_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId])
)
