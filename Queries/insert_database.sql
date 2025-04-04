/*
Title: Insert Data
Author: Heather Howse and Salman Aravai
Date: April 21, 2025
*/

USE WORKSPACEDB
GO

-- Insert into Country
INSERT [dbo].[Country] ([CountryName]) VALUES 
(N'Canada'),
(N'USA'),
(N'Japan'),
(N'South Korea'),
(N'Philippines'),
(N'Germany'),
(N'Brasil'),
(N'Australia'),
(N'India'),
(N'South Africa')
GO

-- Insert into Province
INSERT [dbo].[Province] ([ProvinceName], [CountryId]) VALUES 
(N'Alberta', 1),
(N'British Columbia', 1),
(N'Ontario', 1),
(N'Quebec', 1),
(N'Manitoba', 1),
(N'Claifornia', 2),
(N'Hokkaido ', 3),
(N'Gyeonggi-do', 4),
(N'Cebu', 5),
(N'Bavaria ', 6),
(N'Sao Paulo', 7),
(N'Queensland', 8),
(N'Maharashtra', 9),
(N'Gauteng', 10)
GO

-- Insert into City
INSERT [dbo].[City] ([CityName], [ProvinceId]) VALUES 
(N'Calgary', 1),
(N'Edmonton', 1),
(N'Red Deer', 1),
(N'Lethbridge', 1),
(N'Medicine Hat', 1),
(N'Vancouver', 2),
(N'Toronto', 3),
(N'Montreal', 4),
(N'Winnipeg', 5),
(N'Los Angeles', 6),
(N'Sapporo', 7),
(N'Suwon', 8),
(N'Cebu City', 9),
(N'Munich', 10),
(N'Sao Paulo City', 11),
(N'Brisbane', 12),
(N'Mumbai', 13),
(N'Johannesburg', 14)
GO

-- Insert into Lease Term
INSERT [dbo].[LeaseTerm] ([LeaseName]) VALUES 
(N'day'),
(N'week'),
(N'month')
GO

-- Insert into Lease User Role
INSERT [dbo].[UserRole] ([RoleName]) VALUES 
(N'workspace-owner'),
(N'co-worker')
GO

-- Insert into Workspace Type
INSERT [dbo].[WorkspaceType] ([TypeName]) 
VALUES 
(N'meeting-room'),
(N'private-office-room'),
(N'desk')
GO

-- Insert into Property
INSERT [dbo].[Property] ([CityId], [PropertyName], [PropertyAddress], [PropertyPostalCode], [Neighborhood], [HasParkingLot], [HasPublicTransport], [Area])
VALUES
(1, N'Maplewood Heights', N'100 Main Street', N'T2P 1J5', N'Downtown', 1, 1, 1500.5),
(2, N'Riverstone Residences', N'200 ELM Avenue', N'M5H 2N2', N'Financial District', 0, 1, 2000),
(3, N'Aspen Ridge Apartments', N'300 Maple Drive', N'M7H 22B', N'Hollywood', 1, 1, 1800.3),
(4, N'The Grandview Condos', N'400 Oak Crescent', N'ZZP 456', N'Midtown', 1, 1, 2200.7),
(5, N'Westwood Villas', N'500 Pine Road', N'T5J 3N5', N'Southside', 0, 0, 1600),
(6, N'Pacific Heights Tower', N'123 Burrard Street', N'V6C 3K5', N'Downtown', 1, 0, 18000),
(7, N'CN View Residences', N'789 Yonge Street', N'M5B 1N4', N'Downtown', 0, 1, 20000),
(8, N'Le Plateau Suites', N'456 Rue Sainte-Catherine', N'H3B 3Y7', N'Le Plateau-Mont-Royal', 1, 0, 16500),
(9, N'Forks Riverfront Lofts', N'321 Portage Ave', N'R3C 0B6', N'Downtown', 0, 1, 14000),
(10, N'Sunset Skyline Tower', N'987 Sunset Boulevard ', N'T3P 0V1', N'Hollywood', 1, 0, 22500),
(11, N'Snowfall Heights', N'123 Odori, Chuo-ku', N'060 0042', N'Central', 0, 1, 11800),
(12, N'Hwaseong View Apartments', N'456 Paldal-ro, Paldal-gu', N'M4B 1B3', N'Central', 1, 0, 12300),
(13, N'Mango bay Residences', N'78 Osmena Boulevard', N'L7C 2N9', N'Downtown', 0, 1, 10200),
(14, N'Bavarian Sky Lofts', N'12 Marienplatz', N'V6E 1N2', N'Old Town', 1, 0, 19000),
(15, N'Paulista Heights Residences', N'123 Avenida Paulista', N'01311 000', N'Paulista Heights', 0, 1, 21000),
(16, N'Riverbend Towers', N'50 Queen Street', N'R3Y 0Z3', N'Central Business District', 1, 0, 175000),
(17, N'Gateway Grand', N'789 Marine Drive', N'H1A 0A3', N'Marine Lines', 0, 1, 25000),
(18, N'Golden Crest Plaza', N'321 Nelson Mandela Square', N'T3P 0V1', N'Sandton', 1, 0, 18500),
(18, N'Skyline Co-Work Hub', N'101 Innovation Drive', N'T3H 5B6', N'Tech District', 1, 0, 7716.6),
(15, N'Urban Hive Spaces', N'22 Cedar Avenue', N'M4A 1G2', N'Midtown', 1, 0, 13259),
(14, N'MapleLeaf Offices', N'789 Tech Park', N'V7Y 1K8', N'Innovation Park', 1, 0, 21931.7),
(12, N'CedarStone Suites', N'456 Lakeview Blvd', N'H4Z 1A7', N'Old Town', 0, 1, 7098.7),
(10, N'The Innovation Loft', N'12 Skyway Crescent', N'R2C 5G3', N'Eastside', 1, 1, 3470.5),
(3, N'HarbourView Halls', N'900 Bay Street', N'L3R 9Y1', N'West Hills', 1, 0, 13297.1),
(5, N'Summit CoWork', N'33 Seaside Lane', N'G1K 7P4', N'Business Bay', 1, 1, 1328.3),
(4, N'MetroBiz Lounge', N'877 Kingsway', N'S4N 0X2', N'Greenbelt', 1, 0, 1467.5),
(12, N'Creative Nest', N'555 Aurora Ave', N'B2Y 3Z6', N'Harbourfront', 1, 1, 6921),
(4, N'Zenith WorkLofts', N'321 Quantum Road', N'N2L 3G1', N'Uptown', 0, 0, 6485.4),
(16, N'Venture Point', N'101 First Ave', N'A1B 2C3', N'Downtown', 0, 0, 8870.2),
(6, N'SkyHub Offices', N'202 Second St', N'B2C 3D4', N'Eastside', 0, 0, 6355.6),
(7, N'Brightside Spaces', N'303 Third Blvd', N'C3D 4E5', N'Westend', 1, 0, 11646.8),
(17, N'PeakWork Studios', N'404 Fourth Lane', N'D4E 5F6', N'Northview', 0, 1, 17563),
(9, N'Elevate WorkHub', N'505 Fifth Road', N'E5F 6G7', N'Southridge', 0, 0, 14011.2),
(6, N'FusionWork Tower', N'606 Sixth Dr', N'F6G 7H8', N'Tech Valley', 1, 1, 9527.7),
(6, N'Hive Central', N'707 Seventh Way', N'G7H 8I9', N'Creative Core', 1, 0, 8919.4),
(11, N'Innovation Bay', N'808 Eighth Path', N'H8I 9J0', N'Central Point', 0, 0, 6435.9);
GO

-- Insert into User
INSERT INTO [dbo].[User] ([UserRoleId], [FirstName], [LastName], [PhoneNumber], [EmailAddress], [Password])
VALUES
(1, N'Alice', N'Johnson', N'1234567890', N'alice@example.com', N'4dff3914b2909ad2e63e267fc8eebfb1102d5f1c848f25ec8e9ae63fb0a9a81c'),
(1, N'Bob', N'Smith', N'2345678901', N'bob@example.com', N'f8700cd3d7686a7e3e79d75e9df0914e83d3ae1a33d2c1844977dd1e660066e7'),
(1, N'Charlie', N'Brown', N'3456789012', N'charlie@example.com', N'4474c6e324b4ccfe659da8b132e37b29c5de1b1d132c1844977dd1e660066e7'),
(2, N'David', N'Davis', N'4567890123', N'david@example.com', N'4474c6e324b4ccfe659da8b132e37b29c5de1b1d132c1844977dd1e660066e7'),
(2, N'Emma', N'Wilson', N'5678961234', N'emma@example.com', N'2bb961b745c3de66a63c813209ff30cb69c8e01c72b7b3091c4fa2d0a6b74fc9'),
(1, N'Amir', N'Al-Farsi', N'403-555-1000', N'amir.alfarsi@example.com', N'54c8b76b9a10f8cc3d8521ff20101a3c2d89fa1b5d2e9a1c6d62c3d7fcbb9d18'),
(2, N'Ananya', N'Patel', N'403-555-1001', N'ananya.patel@example.com', N'773b5d9a03c607f8d7b4d2f5e3b42b74a3be8a0a5b98142ecb3471e1de5c3210'),
(1, N'Leila', N'Jafari', N'403-555-1002', N'leila.jafari@example.com', N'1f0d9ff3d39d6fc3cd8724e1c4b80ec4f1c6e2c0b898544ef8be0e5b98d33762'),
(1, N'Chijioke', N'Adeyemi', N'403-555-1003', N'chijioke.adeyemi@example.com', N'4f8c4d52de6a5c7cb232c1aef01eeb4d56db3a6d8240e18be424e8c9f23cb6b7'),
(2, N'Siti', N'Khairun', N'403-555-1004', N'siti.khairun@example.com', N'2f3c8b2f7a7c504df557473d6ed679fb846eec59952d7a234d44097ea6879c8'),
(1, N'Noemi', N'Gonzalez', N'3456789014', N'noemi.gonzalez@example.com', N'8d89a13c8ecdb0b72e1b4773cf9b52bcfc4c010f7b93c88b23bb515c493c53f8'),
(1, N'Thiago', N'Silva', N'4567890143', N'thiago.silva@example.com', N'9b319d6ec7bc9fbc426cd0884d29adf51a869a0544a89ca7e0f42a3e0c91ef36'),
(2, N'Salma', N'El-Baz', N'5678901234', N'salma.elbaz@example.com', N'af2a4f90e2e5a99f456798feb14b2d07d837eb7b6b6ff76a0fc47f978f4fa9d1'),
(1, N'Diego', N'Lopez', N'6789012345', N'diego.lopez@example.com', N'2d8b5f5103982d3e0b0735485b47edc8e09ff91d8f1ab9c217f9c8d4ef43b292'),
(1, N'Aria', N'Abdi', N'403-271-7894', N'aria.abdi31@example.com', N'039620962df01cf03e2be8f35defc13b4a36738184005b52f21b064a15aa5c7a'),
(2, N'Jasper', N'Nguyen', N'403-870-8839', N'jasper.nguyen18@inbox.com', N'359112decaf9a56d1f7dcd477f3f451874f9e3b58424595cd250c1a809fc7cf5'),
(1, N'Nora', N'Rodriguez', N'403-733-5761', N'nora.rodriguez76@example.com', N'093bf56bbeb0ab43b91b64b49a75cf2b2bd8f1b471547029eaf1fb011f33d9be'),
(2, N'Zain', N'Ahmed', N'403-220-7127', N'zain.ahmed46@inbox.com', N'1cf7f5561c443c2b9ccc44ba0a1505e998ef56a4efba74d571416f9503a2c5c8'),
(1, N'Fatima', N'Mehta', N'403-377-8310', N'fatima.mehta1@mail.com', N'5d56480a4143241a407ba4d34bc4d3a0c142e8524aa396094e86d30843c28160'),
(2, N'Aarav', N'Sharma', N'403-868-8269', N'aarav.sharma62@example.com', N'c582c28b47582dfae2a2e459267db2688af42b5c6d9eaec44a541cf8addfa32a'),
(1, N'Luna', N'Lee', N'403-798-2192', N'luna.lee36@mail.com', N'395fc8b42b6fc4a3d1c8582bba9e093ec0b33146985224f10b61a5fae147c4e3'),
(2, N'Ibrahim', N'Brown', N'403-415-2981', N'ibrahim.brown43@inbox.com', N'7f0efb00a3bd50b57518aeb8f821eb4a15dedc115f8bc67599263e1a426e24df'),
(1, N'Chloe', N'Iqbal', N'403-723-1860', N'chloe.iqbal59@example.com', N'8995d1c728c603b697b2560ccc83277ce041b666358fdaa663999d6657a9ac8c'),
(2, N'Kian', N'Turner', N'403-714-1191', N'kian.turner50@inbox.com', N'718f2bfcfc4f1a8bd08a08b3052f8bb9287ba67a286611ed8ac472346f15ea0d'),
(1, N'Yasmine', N'Fernandez', N'403-824-1396', N'yasmine.fernandez78@inbox.com', N'5fff1b11d20892cbe634a6c2b3936cc7ee0eaa804d51f4c8c07bf14e2184807f'),
(2, N'Musa', N'Wilson', N'403-648-6116', N'musa.wilson46@mail.com', N'a6ca6c3092eeb1ecb42459841806b07341705dd4a4fc26953b17ef1a990e58ee'),
(1, N'Olivia', N'Davies', N'403-987-5935', N'olivia.davies29@mail.com', N'c320b6bfec21ec7cac73873b846cfc400d00005345098aeb49f00dc58efcaa8d'),
(2, N'Rehan', N'Ali', N'403-894-5902', N'rehan.ali93@mail.com', N'5e04be1f351556344bf7029a382fe21961d9bd41725c63788a5ba7de69becc76'),
(1, N'Amira', N'Zhang', N'403-155-9365', N'amira.zhang48@example.com', N'4886f35c841149982bc8a0fb7f005d2069d44f9e9c615fef9a83ff643a425fd8'),
(2, N'Tariq', N'Thomas', N'403-350-2298', N'tariq.thomas12@mail.com', N'28f5b2de20bd0c48a16f489bb54840a52b0e256a91c70eec876d1266d5bf5dcf'),
(1, N'Mila', N'Singh', N'403-927-5647', N'mila.singh84@mail.com', N'4b6351067f456b330b27df54bbc26ceae36b2b9874444ee0efac4b28e90bd1d8'),
(2, N'Hadi', N'Kim', N'403-124-8483', N'hadi.kim68@mail.com', N'b33d4cfa2029816b35d8b31ebcfab31c4d4549d65fa21780f209bcfee1e82bc8'),
(1, N'Inaya', N'Hussain', N'403-466-2226', N'inaya.hussain11@inbox.com', N'937de003684f763ac7e0b35e7aaee43d21dd47b3040808417835536289fd8a29'),
(2, N'Zayd', N'Morgan', N'403-604-5282', N'zayd.morgan11@mail.com', N'7c93b9c434ffa0352fca48b1913a91501bbb8afabad5dc157781f7f9440cb380'),
(1, N'Alina', N'Miller', N'403-839-8908', N'alina.miller71@mail.com', N'4a654b01d92acca38248c94ccf1f019df5ed50b520e94618b1b232949fd9854c'),
(2, N'Samir', N'White', N'403-996-5559', N'samir.white62@example.com', N'6d1b290ab3cfc241e2960b5616a2d190541a0c1d475aabdd444238ddb22f4c79'),
(1, N'Layth', N'Lopez', N'403-424-3453', N'layth.lopez32@mail.com', N'6e28cefd60576b96ce6a67b05bf953507a971f504fc9cef9877e9728d37bf0de'),
(2, N'Noor', N'Patel', N'403-320-5859', N'noor.patel58@mail.com', N'eab6dc35db0b8c6f3f82f70c9bcc3ff6964524ea35f2547b26b7798d784be1f9'),
(1, N'Amina', N'Choudhury', N'403-656-9671', N'amina.choudhury75@example.com', N'7fad504528663cb14eb17ba355b0a945b873e4a8babf106188ed34454a1eff4c'),
(2, N'Daniyal', N'Walker', N'403-928-4824', N'daniyal.walker47@example.com', N'1c5adeac9856238017e0b1466b63772327287eeac8dd3073869f0ee73817dbe8'),
(1, N'Sara', N'Martin', N'403-681-3995', N'sara.martin99@inbox.com', N'e7448c43a579c54f674996159a54f7d1a2a7ac73cec37b8891cac89d91537add'),
(2, N'Hassan', N'Hall', N'403-867-1620', N'hassan.hall36@example.com', N'b4acea841e456f4ca0c88563b22c467eafe62bbc34a153f7134f05cc27ba1e23'),
(1, N'Zoya', N'Scott', N'403-179-5170', N'zoya.scott76@inbox.com', N'2d4912695614d54858610fd07dda453b108ed607540c7740ac2f9bcee11188ee'),
(2, N'Ishaan', N'Moore', N'403-840-3269', N'ishaan.moore27@mail.com', N'87921a5559883ea7ab6affa5449b7d5c4e01648d8dcff6ea6da01016adadfc86')
GO

-- Insert into Workspace
INSERT [dbo].[Workspace] ([UserId], [WorkspaceTypeId], [LeaseTermId], [FloorNumber], [RoomNumber], [MaxCapacity], [AvailableDate], [Price], [PropertyId]) VALUES 
(1, 1, 1, 1, 101, 5, CAST(N'2025-04-02T00:00:00.000' AS DateTime), 10, 1),
(1, 2, 2, 2, 210, 10, CAST(N'2025-04-03T00:00:00.000' AS DateTime), 100, 1),
(1, 1, 1, 3, 303, 8, CAST(N'2025-04-04T00:00:00.000' AS DateTime), 30, 1),
(1, 3, 3, 1, 104, 12, CAST(N'2025-04-05T00:00:00.000' AS DateTime), 500, 2),
(2, 2, 2, 2, 205, 6, CAST(N'2025-04-06T00:00:00.000' AS DateTime), 50, 3),
(3, 3, 2, 6, 689, 2, CAST(N'2025-04-06T00:00:00.000' AS DateTime), 68, 4),
(3, 1, 3, 5, 507, 15, CAST(N'2025-04-07T00:00:00.000' AS DateTime), 150, 5),
(3, 2, 1, 4, 401, 10, CAST(N'2025-04-08T00:00:00.000' AS DateTime), 200, 6),
(6, 1, 2, 2, 211, 6, CAST(N'2025-04-09T00:00:00.000' AS DateTime), 80, 7),
(6, 3, 2, 7, 803, 20, CAST(N'2025-04-10T00:00:00.000' AS DateTime), 120, 8),
(6, 1, 3, 3, 310, 12, CAST(N'2025-04-11T00:00:00.000' AS DateTime), 90, 8),
(8, 2, 1, 5, 588, 8, CAST(N'2025-04-12T00:00:00.000' AS DateTime), 70, 9),
(8, 1, 2, 6, 607, 10, CAST(N'2025-04-13T00:00:00.000' AS DateTime), 250, 10),
(9, 1, 2, 1, 111, 12, CAST(N'2025-04-14T00:00:00.000' AS DateTime), 500, 11),
(9, 3, 3, 5, 511, 15, CAST(N'2025-04-15T00:00:00.000' AS DateTime), 150, 11),
(9, 2, 1, 2, 201, 6, CAST(N'2025-04-16T00:00:00.000' AS DateTime), 80, 12),
(12, 2, 2, 3, 309, 8, CAST(N'2025-04-17T00:00:00.000' AS DateTime), 30, 13),
(12, 1, 1, 4, 402, 15, CAST(N'2025-04-18T00:00:00.000' AS DateTime), 500, 14),
(13, 3, 2, 6, 606, 6, CAST(N'2025-04-19T00:00:00.000' AS DateTime), 30, 15),
(13, 2, 3, 1, 102, 9, CAST(N'2025-04-20T00:00:00.000' AS DateTime), 90, 15),
(13, 2, 2, 5, 525, 7, CAST(N'2025-04-21T00:00:00.000' AS DateTime), 40, 16),
(15, 1, 3, 4, 408, 12, CAST(N'2025-04-22T00:00:00.000' AS DateTime), 500, 17),
(15, 3, 1, 7, 703, 16, CAST(N'2025-04-23T00:00:00.000' AS DateTime), 700, 18),
(16, 2, 2, 2, 202, 5, CAST(N'2025-04-24T00:00:00.000' AS DateTime), 10, 19),
(18, 1, 3, 3, 304, 7, CAST(N'2025-04-25T00:00:00.000' AS DateTime), 40, 20),
(18, 2, 1, 6, 601, 8, CAST(N'2025-04-26T00:00:00.000' AS DateTime), 30, 20),
(20, 3, 2, 5, 577, 6, CAST(N'2025-03-27T00:00:00.000' AS DateTime), 80, 21),
(20, 1, 2, 4, 404, 14, CAST(N'2025-03-28T00:00:00.000' AS DateTime), 300, 22),
(22, 2, 1, 5, 568, 10, CAST(N'2025-03-29T00:00:00.000' AS DateTime), 100, 23),
(22, 2, 3, 6, 603, 8, CAST(N'2025-03-30T00:00:00.000' AS DateTime), 30, 23)
GO

-- Insert into User Property
INSERT [dbo].[UserProperty] ([UserId], [PropertyId]) 
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(6, 7),
(6, 8),
(8, 9),
(8, 10),
(9, 11),
(9, 12),
(12, 13),
(12, 14),
(13, 15),
(13, 16),
(15, 17),
(15, 18),
(16, 19),
(18, 20),
(20, 21),
(20, 22),
(22, 23),
(24, 24),
(24, 25),
(26, 26),
(28, 27),
(28, 28),
(30, 29),
(32, 30),
(34, 31),
(36, 32),
(38, 33),
(40, 34),
(42, 35),
(44, 36)
GO
