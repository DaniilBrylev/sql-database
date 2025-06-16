SELECT 
    c.name AS car_name,
    c.class AS car_class,
    ROUND(AVG(r.position), 4) AS average_position,
    COUNT(r.race) AS race_count,
    cl.country AS car_country
FROM 
    cars c
JOIN 
    results r ON c.name = r.car
JOIN 
    classes cl ON c.class = cl.class
GROUP BY 
    c.name, c.class, cl.country
HAVING 
    average_position = (
        SELECT 
            MIN(sub.avg_pos)
        FROM (
            SELECT 
                ROUND(AVG(r2.position), 4) AS avg_pos
            FROM 
                cars c2
            JOIN 
                results r2 ON c2.name = r2.car
            GROUP BY 
                c2.name
        ) AS sub
    )
ORDER BY 
    c.name
LIMIT 1;
