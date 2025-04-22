/*
Query 5: Workspaces Available in the Next 7 Days

Why it's important:
1. Help coworkers find soon-to-be available spaces quickly.
2. Promote spaces that are becoming available, improving visibility and booking chances.
3. Useful for recommendation and notification systems.
*/

SELECT 
    w.RoomNumber,
    w.Price,
    w.MaxCapacity,
    w.AvailableDate,
    p.PropertyName,
    p.HasParkingLot,
    p.HasPublicTransport,
    c.CityName,
    u.FirstName + ' ' + u.LastName AS OwnerName
FROM Workspace w
JOIN Property p ON w.PropertyId = p.PropertyId
JOIN City c ON p.CityId = c.CityId
JOIN [User] u ON w.UserId = u.UserId
WHERE w.AvailableDate <= GETDATE()


/*
Query 6: Count of Workspaces Grouped by Type in Each City

Why it's important:
1. Shows market trends by city – what workspace types are popular.
2. Helps owners know what kind of workspaces are saturated or lacking in each location.
3. Useful for dashboards and visualization.
*/

SELECT 
    c.CityName,
    wt.TypeName AS WorkspaceType,
    COUNT(w.WorkspaceId) AS WorkspaceCount
FROM Workspace w
JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
JOIN Property p ON w.PropertyId = p.PropertyId
JOIN City c ON p.CityId = c.CityId
GROUP BY c.CityName, wt.TypeName
ORDER BY c.CityName, WorkspaceCount DESC;
