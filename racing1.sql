SELECT 
    c.name AS car_name, 
    c.class AS car_class, 
    ROUND(AVG(r.position), 4) AS average_position, 
    COUNT(r.race) AS race_count
FROM 
    cars c
JOIN 
    results r ON c.name = r.car
GROUP BY 
    c.name, c.class
HAVING 
    average_position = (
        SELECT 
            MIN(sub.avg_pos)
        FROM (
            SELECT 
                c2.class, 
                ROUND(AVG(r2.position), 4) AS avg_pos
            FROM 
                cars c2
            JOIN 
                results r2 ON c2.name = r2.car
            GROUP BY 
                c2.name, c2.class
        ) AS sub
        WHERE sub.class = c.class
    )
ORDER BY 
    average_position;



