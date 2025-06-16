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
)
SELECT 
    s.EmployeeID,
    s.Name AS EmployeeName,
    s.ManagerID,
    d.DepartmentName,
    r.RoleName,
    GROUP_CONCAT(DISTINCT p.ProjectName ORDER BY p.ProjectName SEPARATOR ', ') AS ProjectNames,
    GROUP_CONCAT(DISTINCT CONCAT(t.TaskName) ORDER BY t.TaskName SEPARATOR ', ') AS TaskNames
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
GROUP BY 
    s.EmployeeID, s.Name, s.ManagerID, d.DepartmentName, r.RoleName
ORDER BY 
    s.Name;
