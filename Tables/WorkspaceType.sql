CREATE TABLE [dbo].[WorkspaceType]
(
	[WorkspaceTypeId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [TypeName] VARCHAR(50) NOT NULL,
	CHECK ([TypeName] IN ('meeting-room', 'private-office-room', 'desk'))
)