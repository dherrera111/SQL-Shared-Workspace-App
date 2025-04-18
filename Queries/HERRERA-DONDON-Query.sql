

/*
Query 1: Find Available Workspaces in a City with Amenities (Co-Worker Perspective)

What do they do and why are they important to the case study?
1. Helps co-workers find workspaces based on location, price, and amenities.
2. Critical for co-workers who need workspaces with specific amenities (parking, public transport).
3. Helps them compare prices and choose the best option.
*/

USE WORKSPACEDB

-- BACKEND
CREATE VIEW AvailableWorkspacesView AS
SELECT 
    p.PropertyName,
    w.RoomNumber,
    w.FloorNumber,
    w.MaxCapacity,
    w.Price,
    lt.LeaseName AS LeaseTerm,
    wt.TypeName AS WorkspaceType,
    c.CityName,
    p.HasParkingLot,
    p.HasPublicTransport
FROM Workspace w
JOIN Property p ON w.PropertyId = p.PropertyId
JOIN City c ON p.CityId = c.CityId
JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
JOIN LeaseTerm lt ON W.LeaseTermId = lt.LeaseTermId
WHERE w.AvailableDate <= GETDATE() -- filter the starting date of availability up to today.
	AND p.HasParkingLot = 1
	AND p.HasPublicTransport = 1

-- FRONTEND
DECLARE @CityName VARCHAR(100) = 'calgary,toronto';

SELECT * FROM AvailableWorkspacesView 
WHERE CityName IN (SELECT value FROM STRING_SPLIT(@CityName, ','))
ORDER BY Price;


--=======================================================================================================

/*
Query 2: Premium Workspace Recommendations (Co-Worker & Owner Perspective)

What do they do and why are they important to the case study?
1. Helps co-workers avoid overpaying by objectively ranking workspaces based on features vs. price.
2. Instead of manually comparing dozens of listings, co-workers get pre-filtered, ranked recommendations.
3. Workspaces with low ValueScore may need upgrades or price reductions. 
*/


-- BACKEND
CREATE VIEW PremiumWorkspaceRecommendationsView AS
SELECT
    p.PropertyName,
    w.RoomNumber,
    w.FloorNumber,
    w.MaxCapacity,
    w.Price,
    lt.LeaseName AS LeaseTerm,
    wt.TypeName AS WorkspaceType,
    c.CityName,
    p.Neighborhood,
	CONCAT(u.FirstName, ' ', u.LastName) AS ContactPerson,
    -- Value Score (Higher = Better deal)
	-- Space Capacity = Bigger Space - 60% 
	-- Has Parking Lot (plus 20 points) and Has Transit (plus 15 points)
	-- Affordability: Lower Price
    ((w.MaxCapacity * 0.6) + (20 * p.HasParkingLot) + (15 * p.HasPublicTransport)) / NULLIF(w.Price, 0) * 100 AS ValueScore,
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
WHERE w.AvailableDate <= GETDATE()
  AND p.HasPublicTransport = 1  -- Transport access locations

-- FRONTEND

-- Co-Worker
DECLARE @CityName VARCHAR(100) = 'calgary,toronto';
SELECT * FROM PremiumWorkspaceRecommendationsView
WHERE CityName IN (SELECT value FROM STRING_SPLIT(@CityName, ','))
ORDER BY ValueScore DESC;

-- Property owners
DECLARE @PropertyOwner VARCHAR(100) = 'Patricia Taylor';
SELECT * 
FROM PremiumWorkspaceRecommendationsView
WHERE ValueScore < (SELECT AVG(ValueScore) FROM PremiumWorkspaceRecommendationsView)
AND ContactPerson = @PropertyOwner
ORDER BY ValueScore ASC;

--=======================================================================================================

/*
Query 3: Properties with the Most Workspace Options

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
GROUP BY p.PropertyId, p.PropertyName, p.PropertyAddress, ci.CityName, pr.ProvinceName, c.CountryName
ORDER BY TotalWorkspaces DESC;



--=======================================================================================================

/*
Query 4: List All Properties Owned by a User

What do they do and why are they important to the case study?
1. Helps workspace owners manage their properties
2. Allows owners to see all their properties in one view.

*/

--BACKEND
CREATE VIEW UserPropertyOwnershipView AS
SELECT 
    u.UserId,
    CONCAT(u.FirstName, ' ', u.LastName) AS OwnerName,
    u.EmailAddress,
    u.PhoneNumber,
    COUNT(DISTINCT up.PropertyId) AS PropertyCount,
    STRING_AGG(p.PropertyName, ', ') AS PropertiesOwned
FROM [User] u
JOIN UserProperty up ON u.UserId = up.UserId
JOIN Property p ON up.PropertyId = p.PropertyId
WHERE u.UserRoleId = 1 -- PROPERTY OWNER
GROUP BY u.UserId, u.FirstName, u.LastName, u.EmailAddress, u.PhoneNumber

--FRONTEND
SELECT * FROM UserPropertyOwnershipView 
WHERE OwnerName = 'Michael Johnson'
ORDER BY PropertyCount DESC;

