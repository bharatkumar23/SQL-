SELECT p.property_name, p.price_per_night, b.booking_id, b.status
FROM property p
INNER JOIN booking b 
ON b.property_id = p.property_id
ORDER BY price_per_night 
DESC;