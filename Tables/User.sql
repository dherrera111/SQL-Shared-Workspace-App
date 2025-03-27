CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL PRIMARY KEY, 
    [UserRoleId] VARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([UserRoleId]) REFERENCES [UserRole]([UserRoleId])

)
