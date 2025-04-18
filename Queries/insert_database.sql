/*
Title: Insert Data
Author: Heather Howse and Salman Aravai
Date: April 21, 2025
*/

USE [WORKSPACEDB]
GO

-- Country data
SET IDENTITY_INSERT [dbo].[Country] ON 
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES 
(1, N'Canada'),
(2, N'United States'),
(3, N'Japan'),
(4, N'South Korea'),
(5, N'Philippines'),
(6, N'Germany'),
(7, N'Brazil'),
(8, N'Australia'),
(9, N'India'),
(10, N'South Africa')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO

-- Province data
SET IDENTITY_INSERT [dbo].[Province] ON 
-- Canadian provinces
INSERT [dbo].[Province] ([ProvinceId], [ProvinceName], [CountryId]) VALUES 
(1, N'Alberta', 1),
(2, N'British Columbia', 1),
(3, N'Ontario', 1),
(4, N'Quebec', 1),
(5, N'Manitoba', 1),
-- US states
(6, N'California', 2),
(7, N'New York', 2),
(8, N'Texas', 2),
(9, N'Illinois', 2),
-- Japan prefectures
(10, N'Hokkaido', 3),
(11, N'Tokyo', 3),
-- South Korea provinces
(12, N'Gyeonggi-do', 4),
-- Philippines provinces
(13, N'Metro Manila', 5),
(14, N'Cebu', 5),
-- German states
(15, N'Bavaria', 6),
(16, N'Berlin', 6),
-- Brazilian states
(17, N'São Paulo', 7),
-- Australian states
(18, N'New South Wales', 8),
(19, N'Queensland', 8),
-- Indian states
(20, N'Maharashtra', 9),
-- South African provinces
(21, N'Gauteng', 10)
SET IDENTITY_INSERT [dbo].[Province] OFF
GO

-- City data
SET IDENTITY_INSERT [dbo].[City] ON 
-- Canadian cities
INSERT [dbo].[City] ([CityId], [CityName], [ProvinceId]) VALUES 
(1, N'Calgary', 1),
(2, N'Edmonton', 1),
(3, N'Vancouver', 2),
(4, N'Toronto', 3),
(5, N'Ottawa', 3),
(6, N'Montreal', 4),
(7, N'Winnipeg', 5),
-- US cities
(8, N'Los Angeles', 6),
(9, N'San Francisco', 6),
(10, N'New York', 7),
(11, N'Houston', 8),
(12, N'Chicago', 9),
-- Japanese cities
(13, N'Sapporo', 10),
(14, N'Tokyo', 11),
-- South Korean cities
(15, N'Seoul', 12),
(16, N'Suwon', 12),
-- Philippine cities
(17, N'Manila', 13),
(18, N'Cebu City', 14),
-- German cities
(19, N'Munich', 15),
(20, N'Berlin', 16),
-- Brazilian cities
(21, N'São Paulo', 17),
-- Australian cities
(22, N'Sydney', 18),
(23, N'Brisbane', 19),
-- Indian cities
(24, N'Mumbai', 20),
-- South African cities
(25, N'Johannesburg', 21),
(26, N'Pretoria', 21)
SET IDENTITY_INSERT [dbo].[City] OFF
GO

-- Property data
SET IDENTITY_INSERT [dbo].[Property] ON 
-- Canadian properties
INSERT [dbo].[Property] ([PropertyId], [CityId], [PropertyName], [PropertyAddress], [PropertyPostalCode], [Neighborhood], [HasParkingLot], [HasPublicTransport], [Area]) VALUES 
(1, 1, N'Calgary Innovation Tower', N'101 8th Avenue SW', N'T2P 1B4', N'Downtown', 1, 1, CAST(12500.50 AS Decimal(10, 4))),
(2, 3, N'Vancouver Harbour Workspace', N'200 Burrard Street', N'V6C 3L6', N'Waterfront', 1, 1, CAST(8500.75 AS Decimal(10, 4))),
-- US properties
(3, 8, N'LA Creative Hub', N'1201 S Figueroa St', N'90015', N'Downtown LA', 1, 1, CAST(9200.25 AS Decimal(10, 4))),
(4, 10, N'Manhattan Executive Suites', N'450 W 31st St', N'10001', N'Midtown', 0, 1, CAST(15000.00 AS Decimal(10, 4))),
-- Asian properties
(5, 14, N'Tokyo Business Center', N'1-9-1 Marunouchi', N'100-0005', N'Chiyoda', 1, 1, CAST(7800.50 AS Decimal(10, 4))),
(6, 15, N'Seoul Digital Campus', N'26 Eulji-ro 5-gil', N'04539', N'Jung-gu', 1, 1, CAST(6500.75 AS Decimal(10, 4))),
-- European properties
(7, 19, N'Munich Tech Park', N'Arabellastraße 4', N'81925', N'Bogenhausen', 1, 1, CAST(11000.00 AS Decimal(10, 4))),
(8, 20, N'Berlin Creative Lofts', N'Torstraße 125', N'10119', N'Mitte', 0, 1, CAST(7200.25 AS Decimal(10, 4))),
-- Other international properties
(9, 22, N'Sydney Harbour Offices', N'1 Macquarie Place', N'2000', N'Circular Quay', 1, 1, CAST(9500.50 AS Decimal(10, 4))),
(10, 24, N'Mumbai Financial Hub', N'Senapati Bapat Marg', N'400013', N'Lower Parel', 1, 1, CAST(8200.75 AS Decimal(10, 4))),
-- Additional properties for testing
(11, 4, N'Toronto Tech Square', N'100 Adelaide St W', N'M5H 0A3', N'Financial District', 1, 1, CAST(10500.00 AS Decimal(10, 4))),
(12, 6, N'Montreal Innovation Center', N'1250 René-Lévesque Blvd', N'H3B 4W8', N'Downtown', 1, 1, CAST(8800.25 AS Decimal(10, 4))),
(13, 9, N'SF Tech Hub', N'140 New Montgomery St', N'94105', N'SoMa', 0, 1, CAST(7600.50 AS Decimal(10, 4))),
(14, 11, N'Houston Energy Plaza', N'1200 Smith St', N'77002', N'Downtown', 1, 1, CAST(9200.75 AS Decimal(10, 4))),
(15, 17, N'Manila Business Tower', N'Ayala Avenue', N'1226', N'Makati', 1, 1, CAST(6800.00 AS Decimal(10, 4)))
SET IDENTITY_INSERT [dbo].[Property] OFF
GO

-- WorkspaceType
SET IDENTITY_INSERT [dbo].[WorkspaceType] ON 
INSERT [dbo].[WorkspaceType] ([WorkspaceTypeId], [TypeName]) VALUES 
(1, N'meeting-room'),
(2, N'private-office-room'),
(3, N'desk')
SET IDENTITY_INSERT [dbo].[WorkspaceType] OFF
GO

-- LeaseTerm
SET IDENTITY_INSERT [dbo].[LeaseTerm] ON 
INSERT [dbo].[LeaseTerm] ([LeaseTermId], [LeaseName]) VALUES 
(1, N'day'),
(2, N'week'),
(3, N'month')
SET IDENTITY_INSERT [dbo].[LeaseTerm] OFF
GO

-- UserRole
SET IDENTITY_INSERT [dbo].[UserRole] ON 
INSERT [dbo].[UserRole] ([UserRoleId], [RoleName]) VALUES 
(1, N'workspace-owner'),
(2, N'co-worker')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO

-- User data
SET IDENTITY_INSERT [dbo].[User] ON 
-- Workspace owners (20 users)
INSERT [dbo].[User] ([UserId], [UserRoleId], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [Password]) VALUES 
(1, 1, N'Michael', N'Johnson', N'4035551001', N'michael.johnson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(2, 1, N'Sarah', N'Williams', N'4035551002', N'sarah.williams@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(3, 1, N'David', N'Brown', N'4035551003', N'david.brown@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(4, 1, N'Jennifer', N'Davis', N'4035551004', N'jennifer.davis@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(5, 1, N'Robert', N'Miller', N'4035551005', N'robert.miller@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(6, 1, N'Lisa', N'Wilson', N'4035551006', N'lisa.wilson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(7, 1, N'James', N'Moore', N'4035551007', N'james.moore@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(8, 1, N'Patricia', N'Taylor', N'4035551008', N'patricia.taylor@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(9, 1, N'John', N'Anderson', N'4035551009', N'john.anderson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(10, 1, N'Mary', N'Thomas', N'4035551010', N'mary.thomas@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(11, 1, N'William', N'Jackson', N'4035551011', N'william.jackson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(12, 1, N'Elizabeth', N'White', N'4035551012', N'elizabeth.white@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(13, 1, N'Richard', N'Harris', N'4035551013', N'richard.harris@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(14, 1, N'Susan', N'Martin', N'4035551014', N'susan.martin@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(15, 1, N'Charles', N'Garcia', N'4035551015', N'charles.garcia@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(16, 1, N'Jessica', N'Martinez', N'4035551016', N'jessica.martinez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(17, 1, N'Joseph', N'Robinson', N'4035551017', N'joseph.robinson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(18, 1, N'Karen', N'Clark', N'4035551018', N'karen.clark@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(19, 1, N'Thomas', N'Rodriguez', N'4035551019', N'thomas.rodriguez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(20, 1, N'Nancy', N'Lewis', N'4035551020', N'nancy.lewis@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),

-- Co-workers (20 users)
(21, 2, N'Daniel', N'Lee', N'4035551021', N'daniel.lee@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(22, 2, N'Margaret', N'Walker', N'4035551022', N'margaret.walker@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(23, 2, N'Paul', N'Hall', N'4035551023', N'paul.hall@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(24, 2, N'Betty', N'Allen', N'4035551024', N'betty.allen@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(25, 2, N'Mark', N'Young', N'4035551025', N'mark.young@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(26, 2, N'Sandra', N'Hernandez', N'4035551026', N'sandra.hernandez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(27, 2, N'Donald', N'King', N'4035551027', N'donald.king@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(28, 2, N'Dorothy', N'Wright', N'4035551028', N'dorothy.wright@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(29, 2, N'George', N'Lopez', N'4035551029', N'george.lopez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(30, 2, N'Lisa', N'Hill', N'4035551030', N'lisa.hill@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(31, 2, N'Kenneth', N'Scott', N'4035551031', N'kenneth.scott@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(32, 2, N'Donna', N'Green', N'4035551032', N'donna.green@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(33, 2, N'Steven', N'Adams', N'4035551033', N'steven.adams@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(34, 2, N'Carol', N'Baker', N'4035551034', N'carol.baker@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(35, 2, N'Edward', N'Gonzalez', N'4035551035', N'edward.gonzalez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(36, 2, N'Michelle', N'Nelson', N'4035551036', N'michelle.nelson@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(37, 2, N'Brian', N'Carter', N'4035551037', N'brian.carter@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(38, 2, N'Amanda', N'Mitchell', N'4035551038', N'amanda.mitchell@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(39, 2, N'Ronald', N'Perez', N'4035551039', N'ronald.perez@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
(40, 2, N'Melissa', N'Roberts', N'4035551040', N'melissa.roberts@example.com', N'5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8')
SET IDENTITY_INSERT [dbo].[User] OFF
GO

-- Workspace data
SET IDENTITY_INSERT [dbo].[Workspace] ON 
-- Meeting rooms
INSERT [dbo].[Workspace] ([WorkspaceId], [UserId], [WorkspaceTypeId], [LeaseTermId], [FloorNumber], [RoomNumber], [MaxCapacity], [AvailableDate], [Price], [PropertyId]) VALUES 
(1, 1, 1, 1, 1, N'101', 8, CAST(N'2025-01-01' AS Date), CAST(50.00 AS Decimal(10, 4)), 1),
(2, 1, 1, 2, 1, N'102', 12, CAST(N'2025-01-01' AS Date), CAST(300.00 AS Decimal(10, 4)), 1),
(3, 2, 1, 3, 2, N'201', 6, CAST(N'2025-01-01' AS Date), CAST(800.00 AS Decimal(10, 4)), 2),
(4, 3, 1, 1, 3, N'301', 10, CAST(N'2025-01-01' AS Date), CAST(75.00 AS Decimal(10, 4)), 3),
(5, 4, 1, 2, 4, N'401', 15, CAST(N'2025-01-01' AS Date), CAST(450.00 AS Decimal(10, 4)), 4),

-- Private office rooms
(6, 5, 2, 3, 5, N'501', 4, CAST(N'2025-01-01' AS Date), CAST(1200.00 AS Decimal(10, 4)), 5),
(7, 6, 2, 1, 6, N'601', 6, CAST(N'2025-01-01' AS Date), CAST(150.00 AS Decimal(10, 4)), 6),
(8, 7, 2, 2, 7, N'701', 8, CAST(N'2025-01-01' AS Date), CAST(900.00 AS Decimal(10, 4)), 7),
(9, 8, 2, 3, 8, N'801', 10, CAST(N'2025-01-01' AS Date), CAST(1500.00 AS Decimal(10, 4)), 8),
(10, 9, 2, 1, 9, N'901', 12, CAST(N'2025-01-01' AS Date), CAST(200.00 AS Decimal(10, 4)), 9),

-- Desks
(11, 10, 3, 2, 10, N'1001', 1, CAST(N'2025-01-01' AS Date), CAST(350.00 AS Decimal(10, 4)), 10),
(12, 11, 3, 3, 11, N'1101', 1, CAST(N'2025-01-01' AS Date), CAST(1000.00 AS Decimal(10, 4)), 11),
(13, 12, 3, 1, 12, N'1201', 1, CAST(N'2025-01-01' AS Date), CAST(50.00 AS Decimal(10, 4)), 12),
(14, 13, 3, 2, 13, N'1301', 1, CAST(N'2025-01-01' AS Date), CAST(400.00 AS Decimal(10, 4)), 13),
(15, 14, 3, 3, 14, N'1401', 1, CAST(N'2025-01-01' AS Date), CAST(1200.00 AS Decimal(10, 4)), 14),

-- Additional workspaces for testing
(16, 15, 1, 1, 15, N'1501', 8, CAST(N'2025-01-15' AS Date), CAST(60.00 AS Decimal(10, 4)), 15),
(17, 16, 2, 2, 16, N'1601', 6, CAST(N'2025-01-15' AS Date), CAST(950.00 AS Decimal(10, 4)), 1),
(18, 17, 3, 3, 17, N'1701', 1, CAST(N'2025-01-15' AS Date), CAST(1100.00 AS Decimal(10, 4)), 2),
(19, 18, 1, 1, 18, N'1801', 10, CAST(N'2025-01-15' AS Date), CAST(80.00 AS Decimal(10, 4)), 3),
(20, 19, 2, 2, 19, N'1901', 8, CAST(N'2025-01-15' AS Date), CAST(850.00 AS Decimal(10, 4)), 4),
(21, 20, 3, 3, 20, N'2001', 1, CAST(N'2025-01-15' AS Date), CAST(1300.00 AS Decimal(10, 4)), 5),
(22, 1, 1, 1, 21, N'2101', 12, CAST(N'2025-01-15' AS Date), CAST(90.00 AS Decimal(10, 4)), 6),
(23, 2, 2, 2, 22, N'2201', 4, CAST(N'2025-01-15' AS Date), CAST(1000.00 AS Decimal(10, 4)), 7),
(24, 3, 3, 3, 23, N'2301', 1, CAST(N'2025-01-15' AS Date), CAST(1400.00 AS Decimal(10, 4)), 8),
(25, 4, 1, 1, 24, N'2401', 6, CAST(N'2025-01-15' AS Date), CAST(70.00 AS Decimal(10, 4)), 9),
(26, 5, 2, 2, 25, N'2501', 10, CAST(N'2025-01-15' AS Date), CAST(1100.00 AS Decimal(10, 4)), 10),
(27, 6, 3, 3, 26, N'2601', 1, CAST(N'2025-01-15' AS Date), CAST(1500.00 AS Decimal(10, 4)), 11),
(28, 7, 1, 1, 27, N'2701', 8, CAST(N'2025-01-15' AS Date), CAST(85.00 AS Decimal(10, 4)), 12),
(29, 8, 2, 2, 28, N'2801', 6, CAST(N'2025-01-15' AS Date), CAST(950.00 AS Decimal(10, 4)), 13),
(30, 9, 3, 3, 29, N'2901', 1, CAST(N'2025-01-15' AS Date), CAST(1600.00 AS Decimal(10, 4)), 14)
SET IDENTITY_INSERT [dbo].[Workspace] OFF
GO

-- UserProperty mapping
INSERT [dbo].[UserProperty] ([UserId], [PropertyId]) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
-- Some users own multiple properties
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
-- Some properties have multiple owners
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5)
GO