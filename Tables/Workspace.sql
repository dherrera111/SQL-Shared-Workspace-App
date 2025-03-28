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
    [Price] DECIMAL(18, 4) NOT NULL, 
    [UserId] INT NOT NULL, 
    CONSTRAINT [FK_Workspace_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId]), 
    CONSTRAINT [FK_Workspace_LeaseTerm] FOREIGN KEY ([LeaseTermId]) REFERENCES [LeaseTerm]([LeaseTermId]), 
    CONSTRAINT [FK_Workspace_WorkspaceType] FOREIGN KEY ([WorkspaceTypeId]) REFERENCES [WorkspaceType]([WorkspaceTypeId]), 
    CONSTRAINT [FK_Workspace_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]), 


)
