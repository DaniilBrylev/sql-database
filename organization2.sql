WITH RECURSIVE subordinates AS (
    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM 
        Employees e
    WHERE 
        e.EmployeeID = 1
    UNION ALL
    SELECT 
        e.EmployeeID,
        e.Name,
        e.ManagerID,
        e.DepartmentID,
        e.RoleID
    FROM 
        Employees e
    INNER JOIN 
        subordinates s ON e.ManagerID = s.EmployeeID
),
direct_sub_count AS (
    SELECT 
        ManagerID, COUNT(*) AS TotalSubordinates
    FROM 
        Employees
    GROUP BY 
        ManagerID
)
SELECT 
    s.EmployeeID,
    s.Name AS EmployeeName,
    s.ManagerID,
    d.DepartmentName,
    r.RoleName,
    GROUP_CONCAT(DISTINCT p.ProjectName ORDER BY p.ProjectName SEPARATOR ', ') AS ProjectNames,
    GROUP_CONCAT(DISTINCT t.TaskName ORDER BY t.TaskName SEPARATOR ', ') AS TaskNames,
    COUNT(DISTINCT t.TaskID) AS TotalTasks,
    IFNULL(ds.TotalSubordinates, 0) AS TotalSubordinates
FROM 
    subordinates s
LEFT JOIN 
    Departments d ON s.DepartmentID = d.DepartmentID
LEFT JOIN 
    Roles r ON s.RoleID = r.RoleID
LEFT JOIN 
    Projects p ON p.DepartmentID = s.DepartmentID
LEFT JOIN 
    Tasks t ON t.AssignedTo = s.EmployeeID
LEFT JOIN 
    direct_sub_count ds ON s.EmployeeID = ds.ManagerID
GROUP BY 
    s.EmployeeID, s.Name, s.ManagerID, d.DepartmentName, r.RoleName, ds.TotalSubordinates
ORDER BY 
    s.Name;
