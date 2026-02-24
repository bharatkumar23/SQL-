SET GLOBAL event_scheduler = ON;

CREATE TABLE daily_booking_report (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_date DATE,
    total_bookings INT,
    total_revenue DECIMAL(12,2),
    unique_properties INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE EVENT ev_daily_booking_summary
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    INSERT INTO daily_booking_report (
        report_date,
        total_bookings,
        total_revenue,
        unique_properties
    )
    SELECT
        CURDATE(),
        COUNT(*),
        IFNULL(SUM(total_amount), 0),
        COUNT(DISTINCT property_id)
    FROM booking
    WHERE DATE(check_in_date) = CURDATE();
END$$

DELIMITER ;

SELECT * FROM daily_booking_report
ORDER BY created_at DESC;


DELIMITER $$

CREATE EVENT ev_inactive_property_cleanup
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    UPDATE property
    SET availability_status = 'inactive'
    WHERE property_id NOT IN (
        SELECT DISTINCT property_id
        FROM booking
        WHERE check_in_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    );
END$$

DELIMITER ;

SELECT property_id, availability_status
FROM property
WHERE availability_status = 'inactive';





