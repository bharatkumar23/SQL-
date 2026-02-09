SELECT SUM(total_amount) 'Total Revenue' FROM booking;
SELECT booking_id, total_amount 'Highest Revenue' FROM booking ORDER BY total_amount DESC LIMIT 1;
SELECT SUM(total_amount) 'Total Revenue' FROM booking WHERE MONTH(check_in_date)=12;
SELECT COUNT(booking_id) FROM booking WHERE `status`="CONFIRMED" AND MONTH(check_in_date)=12;