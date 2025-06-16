WITH hotel_category AS (
    SELECT 
        h.ID_hotel,
        h.name AS hotel_name,
        CASE
            WHEN AVG(r.price) < 175 THEN 'Дешевый'
            WHEN AVG(r.price) <= 300 THEN 'Средний'
            ELSE 'Дорогой'
        END AS hotel_type
    FROM 
        Hotel h
    JOIN 
        Room r ON h.ID_hotel = r.ID_hotel
    GROUP BY 
        h.ID_hotel, h.name
),
customer_hotels AS (
    SELECT 
        c.ID_customer,
        c.name,
        hc.hotel_type,
        h.name AS hotel_name
    FROM 
        Customer c
    JOIN 
        Booking b ON c.ID_customer = b.ID_customer
    JOIN 
        Room r ON b.ID_room = r.ID_room
    JOIN 
        Hotel h ON r.ID_hotel = h.ID_hotel
    JOIN 
        hotel_category hc ON h.ID_hotel = hc.ID_hotel
),
customer_preference AS (
    SELECT 
        ID_customer,
        name,
        MAX(CASE WHEN hotel_type = 'Дорогой' THEN 3 
                 WHEN hotel_type = 'Средний' THEN 2
                 WHEN hotel_type = 'Дешевый' THEN 1 
                 ELSE 0 END) AS preference_level,
        GROUP_CONCAT(DISTINCT hotel_name ORDER BY hotel_name SEPARATOR ', ') AS visited_hotels
    FROM 
        customer_hotels
    GROUP BY 
        ID_customer, name
)
SELECT 
    ID_customer,
    name,
    CASE 
        WHEN preference_level = 3 THEN 'Дорогой'
        WHEN preference_level = 2 THEN 'Средний'
        WHEN preference_level = 1 THEN 'Дешевый'
    END AS preferred_hotel_type,
    visited_hotels
FROM 
    customer_preference
ORDER BY 
    preference_level ASC, name;
