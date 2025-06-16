WITH RECURSIVE all_subordinates AS (
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM 
        Employees e
    UNION ALL
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM 
        Employees e
    INNER JOIN 
        all_subordinates s ON e.ManagerID = s.EmployeeID
),
subordinate_count AS (
    SELECT 
        ManagerID,
        COUNT(*) AS TotalSubordinates
    FROM 
        all_subordinates
    WHERE 
        ManagerID IS NOT NULL
    GROUP BY 
        ManagerID
)
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    e.ManagerID,
    d.DepartmentName,
    r.RoleName,
    GROUP_CONCAT(DISTINCT p.ProjectName ORDER BY p.ProjectName SEPARATOR ', ') AS ProjectNames,
    GROUP_CONCAT(DISTINCT t.TaskName ORDER BY t.TaskName SEPARATOR ', ') AS TaskNames,
    sc.TotalSubordinates
FROM 
    Employees e
INNER JOIN 
    Roles r ON e.RoleID = r.RoleID
INNER JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN 
    Projects p ON p.DepartmentID = e.DepartmentID
LEFT JOIN 
    Tasks t ON t.AssignedTo = e.EmployeeID
LEFT JOIN 
    subordinate_count sc ON e.EmployeeID = sc.ManagerID
WHERE 
    r.RoleName = 'Менеджер'
    AND sc.TotalSubordinates > 0
GROUP BY 
    e.EmployeeID, e.Name, e.ManagerID, d.DepartmentName, r.RoleName, sc.TotalSubordinates
ORDER BY 
    e.Name;
