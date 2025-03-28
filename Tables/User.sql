CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL PRIMARY KEY, 
    [UserRoleId] INT NOT NULL, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [PhoneNumber] VARCHAR(50) UNIQUE NOT NULL, 
    [EmailAddress] VARCHAR(50) UNIQUE NOT NULL, 
    [Password] VARBINARY(250) NOT NULL, 
    CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([UserRoleId]) REFERENCES [UserRole]([UserRoleId]), 
    


)
