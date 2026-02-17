UPDATE booking
SET status = 'COMPLETED'
WHERE status = 'CONFIRMED'
  AND check_out_date < CURDATE();

UPDATE property p
SET p.price_per_night = p.price_per_night * 1.10
WHERE EXISTS (
    SELECT 1
    FROM review r
    WHERE r.property_id = p.property_id
      AND r.rating = 5
);

UPDATE customer
SET
    email = 'amit_patil_90@gmail.com',
    phone_number = '9998887776'
WHERE customer_id = (
    SELECT customer_id
    FROM (
        SELECT customer_id
        FROM customer
        WHERE username='amit_patil'
    ) t
);

 

