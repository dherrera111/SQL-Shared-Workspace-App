CREATE TABLE [dbo].[UserProperty]
(
	[UserId] INT NOT NULL PRIMARY KEY, 
    [PropertyId] INT NOT NULL, 
    CONSTRAINT [FK_UserProperty_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]), 
    CONSTRAINT [FK_UserProperty_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId])
    
)
