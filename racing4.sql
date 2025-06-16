WITH car_avg AS (
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
),
class_avg AS (
    SELECT 
        c.class AS car_class,
        ROUND(AVG(r.position), 4) AS class_average_position,
        COUNT(DISTINCT c.name) AS car_count
    FROM 
        cars c
    JOIN 
        results r ON c.name = r.car
    GROUP BY 
        c.class
)
SELECT 
    ca.car_name,
    ca.car_class,
    ca.average_position,
    ca.race_count,
    cl.country AS car_country
FROM 
    car_avg ca
JOIN 
    class_avg cla ON ca.car_class = cla.car_class
JOIN 
    classes cl ON ca.car_class = cl.class
WHERE 
    cla.car_count >= 2
    AND ca.average_position < cla.class_average_position
ORDER BY 
    ca.car_class, ca.average_position;
