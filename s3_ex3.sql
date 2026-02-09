SELECT
    b.property_id,
    COUNT(b.booking_id) AS `Total Bookings`,
    AVG(b.total_amount) AS `Average Revenue`,
    CONCAT(o.first_name, ' ', o.last_name) AS `Owner Name`
FROM booking b
JOIN property p
    ON b.property_id = p.property_id
JOIN `owner` o
    ON p.owner_id = o.owner_id
GROUP BY
    b.property_id,
    o.first_name,
    o.last_name
HAVING
    COUNT(b.booking_id) >= 3;