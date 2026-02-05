SELECT c.first_name, c.last_name, p.property_name, r.rating FROM customer c INNER JOIN review r ON c.customer_id=r.customer_id
INNER JOIN property p ON p.property_id=r.property_id;