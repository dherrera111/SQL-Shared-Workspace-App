/*
Author: HERRERA D., LEUNG V., ARAVAI S., HOWSE H.
Date: April 22, 2025
Project Name: Co-working Space App - DBMS
Instructor: Michael Dorsey
*/


/*
Query 1: As a coworker, I want to find available workspaces in specific cities so I can choose the best option based on location, price, and amenities.

What do they do and why are they important to the case study?
1. Helps co-workers find workspaces based on location, price, and amenities.
2. Critical for co-workers who need workspaces with specific amenities (parking, public transport).
3. Helps them compare prices and choose the best option.
*/

USE WORKSPACEDB

--============== BACKEND ============== 
IF EXISTS (SELECT * FROM sys.views WHERE name = 'AvailableWorkspacesView')
	DROP VIEW AvailableWorkspacesView;
GO

CREATE VIEW AvailableWorkspacesView AS
SELECT 
    p.PropertyName,
	c.CityName,
    w.RoomNumber,
    w.FloorNumber,
    w.MaxCapacity,
    w.Price,
    lt.LeaseName AS LeaseTerm,
    wt.TypeName AS WorkspaceType,
    CASE WHEN p.HasParkingLot = 1 THEN 'Yes' ELSE 'No' END AS ParkingAvailable,
    CASE WHEN p.HasPublicTransport = 1 THEN 'Yes' ELSE 'No' END AS NearPublicTransport,
	w.AvailableDate
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
	JOIN LeaseTerm lt ON w.LeaseTermId = lt.LeaseTermId
WHERE 
	w.AvailableDate >= GETDATE()


--============== FRONTEND ============== 

DECLARE @CityName VARCHAR(100) = 'calgary,toronto';

SELECT * FROM AvailableWorkspacesView 
WHERE CityName IN (SELECT value FROM STRING_SPLIT(@CityName, ','))
ORDER BY Price;


--=======================================================================================================

/*
Query 2: As a coworker, I want to see premium workspace recommendations with value scores so I can avoid overpaying and find the best deals. 
	     As a workspace owner, I want to see how my spaces compare to others so I can adjust pricing or amenities.
		 (Data-driven revenue strategy: An owner wants to increase or decrease prices of workspaces that meet specific criteria (below avg price, seasonal demand, etc.))

What do they do and why are they important to the case study?
1. Helps co-workers avoid overpaying by objectively ranking workspaces based on features vs. price.
2. Co-Worker Perspective: Instead of manually comparing dozens of listings, co-workers get pre-filtered, ranked recommendations.
3. Owner Perspective: Workspaces with low ValueScore may need upgrades or price reductions. 
*/

--============== BACKEND ============== 
IF EXISTS (SELECT * FROM sys.views WHERE name = 'PremiumWorkspaceRecommendationsView')
	DROP VIEW PremiumWorkspaceRecommendationsView;
GO

CREATE VIEW PremiumWorkspaceRecommendationsView AS
SELECT
    p.PropertyName,
    w.RoomNumber,
    w.FloorNumber,
    w.MaxCapacity,
    w.Price,
	w.AvailableDate,
    lt.LeaseName AS LeaseTerm,
    wt.TypeName AS WorkspaceType,
    c.CityName,
    p.Neighborhood,
	CONCAT(u.FirstName, ' ', u.LastName) AS ContactPerson,
    -- Value Score (Higher = Better deal)
	-- Space Capacity = Bigger Space - 50% 
	-- Has Parking Lot (plus 15 points) and Has Transit (plus 10 points)
	-- Affordability: Lower Price
    ((w.MaxCapacity * 0.5) + (15 * p.HasParkingLot) + (10 * p.HasPublicTransport)) / NULLIF(w.Price, 0) * 100 AS ValueScore,
    p.Area AS PropertySizeSqFt,
    CASE 
        WHEN w.Price > 100 THEN 'Premium'
        WHEN w.Price > 50 THEN 'Standard'
        ELSE 'Budget'
    END AS PricingTier
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
	JOIN dbo.[User] u ON w.UserId = u.UserId
	JOIN LeaseTerm lt ON w.LeaseTermId = lt.LeaseTermId
WHERE 
	w.AvailableDate >= GETDATE()

--============== FRONTEND ============== 

-- Co-Worker
DECLARE @CityName VARCHAR(100) = 'calgary,toronto';

SELECT * FROM PremiumWorkspaceRecommendationsView
WHERE CityName IN (SELECT value FROM STRING_SPLIT(@CityName, ','))
ORDER BY ValueScore DESC;

-- Property owners
DECLARE @PropertyOwner VARCHAR(100) = 'Patricia Taylor';

SELECT * FROM PremiumWorkspaceRecommendationsView
WHERE 
	ValueScore < (SELECT AVG(ValueScore) FROM PremiumWorkspaceRecommendationsView) AND 
	ContactPerson = @PropertyOwner
ORDER BY 
	ValueScore 
ASC;

--=======================================================================================================

/*
Query 3: As a coworker, I want to see properties with the most workspace options so I can find flexible workspaces that meet my needs.

What do they do and why are they important to the case study?
1. Identifies properties that offer the greatest variety of workspace types
2. Helps Coworkers Find Flexible Workspaces
3. Assists Workspace Owners in Marketing Their Properties
*/

SELECT 
    p.PropertyId,
    p.PropertyName,
    p.PropertyAddress,
    ci.CityName,
    pr.ProvinceName,
    c.CountryName,
    COUNT(w.WorkspaceId) AS TotalWorkspaces,
    SUM(CASE WHEN wt.TypeName = 'meeting-room' THEN 1 ELSE 0 END) AS MeetingRooms,
    SUM(CASE WHEN wt.TypeName = 'private-office-room' THEN 1 ELSE 0 END) AS PrivateOffices,
    SUM(CASE WHEN wt.TypeName = 'desk' THEN 1 ELSE 0 END) AS Desks
FROM Property p
	JOIN Workspace w ON p.PropertyId = w.PropertyId
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
	JOIN City ci ON p.CityId = ci.CityId
	JOIN Province pr ON ci.ProvinceId = pr.ProvinceId
	JOIN Country c ON pr.CountryId = c.CountryId
GROUP BY
	p.PropertyId, 
	p.PropertyName, 
	p.PropertyAddress, 
	ci.CityName, 
	pr.ProvinceName, 
	c.CountryName
ORDER BY 
	TotalWorkspaces 
DESC;



--=======================================================================================================

/*
Query 4: As a workspace owner, I want to see all properties I own in one view so I can easily manage them.

What do they do and why are they important to the case study?
1. Helps workspace owners manage their properties
2. Allows owners to see all their properties in one view.

*/

--============== BACKEND ============== 
IF EXISTS (SELECT * FROM sys.views WHERE name = 'UserPropertyOwnershipView')
	DROP VIEW UserPropertyOwnershipView;
GO

CREATE VIEW UserPropertyOwnershipView AS
SELECT 
	w.RoomNumber,
	p.PropertyName,
	c.CityName,
	pr.ProvinceName,
	co.CountryName,
	p.PropertyPostalCode,
    w.Price,
	lt.LeaseName AS LeaseTerm, 
    w.MaxCapacity,
    w.AvailableDate,
    CASE WHEN p.HasParkingLot = 1 THEN 'Yes' ELSE 'No' END AS ParkingAvailable,
    CASE WHEN p.HasPublicTransport = 1 THEN 'Yes' ELSE 'No' END AS NearPublicTransport,
    CONCAT(u.FirstName, ' ', u.LastName) AS OwnerName
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN Province pr ON c.ProvinceId = pr.ProvinceId
	JOIN Country co ON pr.CountryId = co.CountryId
	JOIN [User] u ON w.UserId = u.UserId
	JOIN LeaseTerm lt ON w.LeaseTermId = lt.LeaseTermId

--============== FRONTEND ============== 
DECLARE @PropertyOwner VARCHAR(100) = 'miChaEl johnSon';

SELECT * FROM UserPropertyOwnershipView 
WHERE OwnerName = @PropertyOwner
ORDER BY 
	PropertyName
DESC;


--=======================================================================================================

/*
Query 5: As a coworker, I want to see workspaces becoming available in the next 14 days so I can plan my schedule and book early.

Why it's important:
1. Promote spaces that are becoming available, improving visibility and booking chances.
*/

SELECT 
    w.RoomNumber,
	p.PropertyName,
	c.CityName,
    w.Price,
	lt.LeaseName AS LeaseTerm, 
    w.MaxCapacity,
    w.AvailableDate
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN LeaseTerm lt ON w.LeaseTermId = lt.LeaseTermId
WHERE w.AvailableDate BETWEEN GETDATE() AND DATEADD(day, 14, GETDATE())
ORDER BY 
	w.AvailableDate, 
	w.Price
ASC;


--=======================================================================================================

/*
Query 6: As an administrator, I want to see counts of workspaces grouped by type in each city so I can understand market distribution and create visual reports.
		Owner Analytics. Stakeholders want to observe comparisons in the market to aid in the business decision making process.
Why it's important:
1. Useful for dashboards and visualization.
*/

SELECT 
    c.CityName,
    wt.TypeName AS WorkspaceType,
    COUNT(w.WorkspaceId) AS WorkspaceCount
FROM Workspace w
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
GROUP BY 
	c.CityName,
	wt.TypeName
ORDER BY 
	c.CityName, 
	WorkspaceCount 
DESC;


--=======================================================================================================


/*
Query 7: As a coworker considering relocation, I want to compare prices of similar workspaces across different cities so I can make informed decisions about where to work.

Why it's important:
1. Helps coworkers understand price differences for the same workspace type across different cities.
*/

SELECT wt.TypeName AS WorkspaceType, 
	   c.CityName,
       AVG(w.Price) AS AvgPrice,
       MIN(w.Price) AS MinPrice,
       MAX(w.Price) AS MaxPrice,
	   lt.LeaseName AS LeaseTerm,
       COUNT(w.WorkspaceId) AS AvailableWorkspaces
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
	JOIN City c ON p.CityId = c.CityId
	JOIN LeaseTerm lt ON w.LeaseTermId = lt.LeaseTermId
WHERE w.AvailableDate >= GETDATE()
GROUP BY
	wt.TypeName, 
	c.CityName,
	lt.LeaseName
ORDER BY 
	wt.TypeName, 
	AvgPrice;


/*
Query 8: As a budget-conscious coworker, I want to find the 10 cheapest available workspaces in my country so I can minimize my expenses.

Why it's important:
1. Help budget-conscious users find the lowest priced workspace type per country.
*/

--============== BACKEND ============== 

IF EXISTS (SELECT * FROM sys.views WHERE name = 'Top10CheapestWorkspacePerCountry')
	DROP VIEW Top10CheapestWorkspacePerCountry;
GO

CREATE VIEW Top10CheapestWorkspacePerCountry AS
SELECT 
    co.CountryName,
    c.CityName,
    wt.TypeName AS WorkspaceType,
    w.Price
FROM Workspace w
	JOIN Property p ON w.PropertyId = p.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN Province pr ON c.ProvinceId = pr.ProvinceId
	JOIN Country co ON pr.CountryId = co.CountryId
	JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
WHERE 
	w.AvailableDate >= GETDATE() AND 
	w.Price IN (
		SELECT TOP 10 w2.Price
		FROM Workspace w2
			JOIN Property p2 ON w2.PropertyId = p2.PropertyId
			JOIN City ci2 ON p2.CityId = ci2.CityId
			JOIN Province pr2 ON ci2.ProvinceId = pr2.ProvinceId
		WHERE 
			pr2.CountryId = co.CountryId AND 
			w2.AvailableDate >= GETDATE()
		ORDER BY 
			w2.Price 
		ASC
	 );

--============== FRONTEND ============== 
DECLARE @Country VARCHAR(100) = 'Canada';

SELECT * FROM Top10CheapestWorkspacePerCountry 
WHERE CountryName = @Country
ORDER BY 
	CountryName,
	Price
ASC;


--=======================================================================================================

/*
Query 9: As a coworker, I want to get contact information for workspace owners so I can inquire about bookings or ask questions.

*/

--============== BACKEND ============== 

IF EXISTS (SELECT * FROM sys.views WHERE name = 'PropertyContactInformationView')
	DROP VIEW PropertyContactInformationView;
GO

CREATE VIEW PropertyContactInformationView AS
SELECT 
    p.PropertyName,
    p.PropertyAddress,
	c.CityName,
	pr.ProvinceName,
	co.CountryName,
	p.PropertyPostalCode,
    p.Neighborhood,
    CONCAT(u.FirstName, ' ', u.LastName) AS OwnerName,
    u.EmailAddress,
    u.PhoneNumber
FROM Property p
	JOIN UserProperty up ON p.PropertyId = up.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN Province pr ON c.ProvinceId = pr.ProvinceId
	JOIN Country co ON pr.CountryId = co.CountryId
	JOIN [User] u ON up.UserId = u.UserId


--============== FRONTEND ============== 
DECLARE @PropertyName VARCHAR(100) = 'Calgary Innovation Tower';

SELECT * FROM PropertyContactInformationView 
WHERE PropertyName = @PropertyName
ORDER BY 
	OwnerName
ASC;


/*
Query 10: As a coworker, I want to see a summary of properties with amenities like parking and public transport so I can filter options based on my needs.
*/

SELECT 
    p.PropertyName,
	c.CityName,
	pr.ProvinceName,
	co.CountryName,
    p.Neighborhood,
    CASE WHEN p.HasParkingLot = 1 THEN 'Yes' ELSE 'No' END AS ParkingAvailable,
    CASE WHEN p.HasPublicTransport = 1 THEN 'Yes' ELSE 'No' END AS NearPublicTransport,
    p.Area AS SquareMeters
FROM Property p
	JOIN UserProperty up ON p.PropertyId = up.PropertyId
	JOIN City c ON p.CityId = c.CityId
	JOIN Province pr ON c.ProvinceId = pr.ProvinceId
	JOIN Country co ON pr.CountryId = co.CountryId
