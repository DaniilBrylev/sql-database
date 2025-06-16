SELECT 
    c.ID_customer,
    c.name,
    COUNT(b.ID_booking) AS total_bookings,
    SUM(r.price * DATEDIFF(b.check_out_date, b.check_in_date)) AS total_spent,
    COUNT(DISTINCT h.ID_hotel) AS unique_hotels
FROM 
    Customer c
JOIN 
    Booking b ON c.ID_customer = b.ID_customer
JOIN 
    Room r ON b.ID_room = r.ID_room
JOIN 
    Hotel h ON r.ID_hotel = h.ID_hotel
GROUP BY 
    c.ID_customer, c.name
HAVING 
    total_bookings > 2 
    AND unique_hotels > 1
    AND total_spent > 500
ORDER BY 
    total_spent ASC;
