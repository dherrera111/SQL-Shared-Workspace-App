CREATE TABLE [dbo].[UserProperty]
(
	[UserId] INT NOT NULL , 
    [PropertyId] INT NOT NULL, 
    PRIMARY KEY ([UserId], [PropertyId]),
    CONSTRAINT [FK_UserProperty_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]), 
    CONSTRAINT [FK_UserProperty_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId])
)
