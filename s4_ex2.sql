SELECT DISTINCT
    p.property_id,
    p.property_name,
    p.location
FROM property p
JOIN booking b
    ON p.property_id = b.property_id
WHERE p.property_id IN (
    SELECT
        property_id
    FROM booking
    GROUP BY property_id
    HAVING COUNT(booking_id) >= 2
);

SELECT
    location,
    total_revenue
FROM (
    SELECT
        p.location,
        SUM(b.total_amount) AS total_revenue
    FROM booking b
    JOIN property p
        ON b.property_id = p.property_id
    GROUP BY p.location
) revenue_table
WHERE total_revenue > 200000;

SELECT
    property_id,
    property_name,
    location,
    price_per_night
FROM property
WHERE price_per_night > ALL (
    SELECT
        p.price_per_night
    FROM property p
    JOIN booking b
        ON p.property_id = b.property_id
);

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customer c
JOIN booking b
    ON c.customer_id = b.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    SUM(b.total_amount) > ANY (
        SELECT
            SUM(b2.total_amount)
        FROM booking b2
        GROUP BY b2.customer_id
        HAVING COUNT(b2.booking_id) > 2
    );

