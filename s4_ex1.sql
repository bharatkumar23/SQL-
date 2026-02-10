SELECT
    property_id,
    property_name,
    price_per_night
FROM property
WHERE price_per_night >
      (SELECT AVG(price_per_night)
       FROM property);

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS Name
FROM customer c
JOIN booking b
    ON c.customer_id = b.customer_id
WHERE b.total_amount >
      (SELECT AVG(total_amount)
       FROM booking);
