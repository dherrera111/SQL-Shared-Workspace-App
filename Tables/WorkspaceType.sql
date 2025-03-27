CREATE TABLE [dbo].[WorkspaceType]
(
	[WorkspaceTypeId] INT NOT NULL PRIMARY KEY, 
    [TypeName] VARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_WorkspaceType_Workspace] FOREIGN KEY ([WorkspaceTypeId]) REFERENCES [Workspace]([WorkspaceTypeId])
)
