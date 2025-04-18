SELECT 
    w.WorkspaceId,
    p.Name AS PropertyName,
    w.AvailableDate,
    w.Price,
    w.MaxCapacity
FROM 
    Workspace w
JOIN 
    Property p ON w.PropertyId = p.PropertyId
WHERE 
    w.AvailableDate <= GETDATE();


SELECT 
    wt.TypeName,
    ROUND(AVG(w.Price), 2) AS AvgPrice
FROM 
    Workspace w
JOIN 
    WorkspaceType wt ON w.WorkspaceTypeId = wt.WorkspaceTypeId
GROUP BY 
    wt.TypeName;
