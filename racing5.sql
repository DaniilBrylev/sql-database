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
low_position_cars AS (
    SELECT 
        car_class,
        COUNT(*) AS low_position_count
    FROM 
        car_avg
    WHERE 
        average_position > 3.0
    GROUP BY 
        car_class
),
class_total_races AS (
    SELECT 
        c.class AS car_class,
        COUNT(r.race) AS total_races
    FROM 
        cars c
    JOIN 
        results r ON c.name = r.car
    GROUP BY 
        c.class
),
max_low AS (
    SELECT 
        MAX(low_position_count) AS max_low_count
    FROM 
        low_position_cars
)
SELECT 
    ca.car_name,
    ca.car_class,
    ca.average_position,
    ca.race_count,
    cl.country AS car_country,
    ctr.total_races,
    lpc.low_position_count
FROM 
    car_avg ca
JOIN 
    classes cl ON ca.car_class = cl.class
JOIN 
    class_total_races ctr ON ca.car_class = ctr.car_class
JOIN 
    low_position_cars lpc ON ca.car_class = lpc.car_class
JOIN 
    max_low ml ON lpc.low_position_count = ml.max_low_count
WHERE 
    ca.average_position > 3.0
ORDER BY 
    lpc.low_position_count DESC;
