SELECT 
    c.name AS car_name,
    c.class AS car_class,
    ROUND(AVG(r.position), 4) AS average_position,
    COUNT(r.race) AS race_count,
    cl.country AS car_country,
    sub.total_races
FROM 
    cars c
JOIN 
    results r ON c.name = r.car
JOIN 
    classes cl ON c.class = cl.class
JOIN (
    SELECT 
        c1.class,
        ROUND(AVG(r1.position), 4) AS avg_class_pos,
        SUM(COUNT(r1.race)) OVER (PARTITION BY c1.class) AS total_races
    FROM 
        cars c1
    JOIN 
        results r1 ON c1.name = r1.car
    GROUP BY 
        c1.class, c1.name
) AS sub ON c.class = sub.class
WHERE 
    sub.avg_class_pos = (
        SELECT MIN(class_avg) FROM (
            SELECT 
                ROUND(AVG(r2.position), 4) AS class_avg
            FROM 
                cars c2
            JOIN 
                results r2 ON c2.name = r2.car
            GROUP BY 
                c2.class
        ) AS t
    )
GROUP BY 
    c.name, c.class, cl.country, sub.total_races
ORDER BY 
    c.class, c.name;
