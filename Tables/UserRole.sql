CREATE TABLE [dbo].[UserRole]
(
	[UserRoleId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [RoleName] VARCHAR(50) NOT NULL,
	CHECK ([RoleName] IN ('co-worker', 'workspace-owner'))
)
