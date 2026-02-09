SELECT SUM(b.total_amount) 'Total Amount Spent' FROM booking b JOIN customer c ON b.customer_id = c.customer_id WHERE c.username="ravi_kumar";
SELECT MIN(total_amount) 'Least spend', MAX(total_amount) 'Highest spend' FROM booking b JOIN customer c ON b.customer_id = c.customer_id WHERE c.username="ravi_kumar";
SELECT c.customer_id, c.username FROM customer c LEFT JOIN booking b ON c.customer_id = b.customer_id WHERE b.booking_id IS NULL;
SELECT `status`, COUNT(booking_id) FROM booking GROUP BY `status`;