/*
Author: HERRERA D., LEUNG V., ARAVAI S., HOWSE H.
Date: April 22, 2025
Project Name: Co-working Space App - DBMS
Instructor: Michael Dorsey
*/

USE master
GO

-- Drop database if exists --
IF DB_ID('WORKSPACEDB') IS NOT NULL
	DROP DATABASE WORKSPACEDB
GO

-- Create WORKSPACEDB database --
CREATE DATABASE WORKSPACEDB
GO

USE WORKSPACEDB
GO

-- Create Country Table --
CREATE TABLE [dbo].[Country]
(
	[CountryId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CountryName] VARCHAR(50) NOT NULL
)

-- Create Province Table --
CREATE TABLE [dbo].[Province]
(
	[ProvinceId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [ProvinceName] NVARCHAR(50) NOT NULL, 
    [CountryId] INT NOT NULL, 
    CONSTRAINT [FK_Province_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country]([CountryId])
)

-- Create City Table --
CREATE TABLE [dbo].[City]
(
	[CityId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [CityName] NVARCHAR(50) NOT NULL, 
    [ProvinceId] INT NOT NULL, 
    CONSTRAINT [FK_City_Province] FOREIGN KEY ([ProvinceId]) REFERENCES [Province]([ProvinceId])
)

-- Create Workspace Type Table --
CREATE TABLE [dbo].[WorkspaceType]
(
	[WorkspaceTypeId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [TypeName] VARCHAR(50) NOT NULL,
	CHECK ([TypeName] IN ('meeting-room', 'private-office-room', 'desk'))
)

-- Create Lease Term Table -- 
CREATE TABLE [dbo].[LeaseTerm]
(
	[LeaseTermId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [LeaseName] VARCHAR(50) NOT NULL,
	CHECK ([LeaseName] IN ('day', 'week', 'month'))
)

-- Create User Role Table --
CREATE TABLE [dbo].[UserRole]
(
	[UserRoleId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [RoleName] VARCHAR(50) NOT NULL,
	CHECK ([RoleName] IN ('co-worker', 'workspace-owner'))
)

-- Create User Table --
CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [UserRoleId] INT NOT NULL, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [PhoneNumber] VARCHAR(50) UNIQUE NOT NULL, 
    [EmailAddress] VARCHAR(50) UNIQUE NOT NULL, 
    [Password] VARCHAR(MAX) NOT NULL, 
    CONSTRAINT [FK_User_UserRole] FOREIGN KEY ([UserRoleId]) REFERENCES [UserRole]([UserRoleId]), 
)

-- Create Property Table --
CREATE TABLE [dbo].[Property]
(
	[PropertyId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CityId] INT NOT NULL, 
    [PropertyName] VARCHAR(50) NOT NULL, 
    [PropertyAddress] VARCHAR(250) NOT NULL, 
    [PropertyPostalCode] VARCHAR(10) NOT NULL, 
    [Neighborhood] VARCHAR(50) NOT NULL, 
    [HasParkingLot] BIT NULL, 
    [HasPublicTransport] BIT NULL, 
    [Area] DECIMAL(10, 4) NOT NULL,
    CONSTRAINT [FK_Property_City] FOREIGN KEY ([CityId]) REFERENCES [City]([CityId])
)

-- Create User Property Table --
CREATE TABLE [dbo].[UserProperty]
(
	[UserId] INT NOT NULL , 
    [PropertyId] INT NOT NULL, 
    PRIMARY KEY ([UserId], [PropertyId]),
    CONSTRAINT [FK_UserProperty_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId]), 
    CONSTRAINT [FK_UserProperty_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId])
)

-- Create Workspace Table --
CREATE TABLE [dbo].[Workspace]
(
	[WorkspaceId] INT  NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [PropertyId] INT  NOT NULL, 
    [FloorNumber] INT NOT NULL, 
    [WorkspaceTypeId] INT NOT NULL, 
    [LeaseTermId] INT NOT NULL, 
    [UserId] INT NOT NULL, 
    [RoomNumber] VARCHAR(50) UNIQUE NOT NULL, 
    [MaxCapacity] INT NOT NULL, 
    [AvailableDate] DATE NOT NULL, -- -- Indicates the starting date of availability
    [Price] DECIMAL(10, 4) NOT NULL, 
    CONSTRAINT [FK_Workspace_Property] FOREIGN KEY ([PropertyId]) REFERENCES [Property]([PropertyId]), 
    CONSTRAINT [FK_Workspace_LeaseTerm] FOREIGN KEY ([LeaseTermId]) REFERENCES [LeaseTerm]([LeaseTermId]), 
    CONSTRAINT [FK_Workspace_WorkspaceType] FOREIGN KEY ([WorkspaceTypeId]) REFERENCES [WorkspaceType]([WorkspaceTypeId]), 
    CONSTRAINT [FK_Workspace_User] FOREIGN KEY ([UserId]) REFERENCES [User]([UserId])
)
