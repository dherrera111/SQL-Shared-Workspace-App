--Title: "Compare Workspace Prices by Type and City"
--Goal: Help coworkers understand price differences for the same workspace type in different cities.

SELECT c.CityName, wt.TypeName AS WorkspaceType, AVG(w.Price) AS AvgPrice
FROM Workspace w
INNER JOIN Property p ON w.PropertyId = p.PropertyId
INNER JOIN City c ON p.CityId = c.CityId
INNER JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
GROUP BY c.CityName, wt.TypeName
ORDER BY wt.TypeName, AvgPrice ASC;



--Title: "Cheapest Workspaces by Type in Each City"
--Goal: Help budget-conscious users find the lowest priced workspace type per city.

SELECT c.CityName, wt.TypeName AS WorkspaceType, MIN(w.Price) AS LowestPrice
FROM Workspace w
INNER JOIN Property p ON w.PropertyId = p.PropertyId
INNER JOIN City c ON p.CityId = c.CityId
INNER JOIN WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
GROUP BY c.CityName, wt.TypeName
ORDER BY c.CityName, wt.TypeName;





