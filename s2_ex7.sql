SELECT b.booking_id, b.check_in_date, b.check_out_date, p.property_name 
FROM property p 
RIGHT OUTER JOIN booking b
ON b.property_id = p.property_id;