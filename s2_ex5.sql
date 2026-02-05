SELECT
    p.property_name,
    p.location,
    b.booking_id
FROM property p
LEFT OUTER JOIN booking b
    ON p.property_id = b.property_id;