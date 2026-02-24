DELIMITER $$

CREATE PROCEDURE GetPropertyRevenueAndBookings (
    IN p_property_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN
    IF p_property_id IS NULL OR p_start_date IS NULL OR p_end_date IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid input parameters';
    END IF;

    SELECT
        IFNULL(SUM(total_amount), 0) AS total_revenue,
        COUNT(*) AS booking_count
    FROM booking
    WHERE property_id = p_property_id
      AND check_in_date BETWEEN p_start_date AND p_end_date;
END$$

DELIMITER ;

CALL GetPropertyRevenueAndBookings(3, '2026-01-01', '2026-03-31');


DELIMITER $$

CREATE PROCEDURE GetCustomerBookingHistory (
    IN p_customer_id INT
)
BEGIN
    DECLARE customer_exists INT;

    SELECT COUNT(*)
    INTO customer_exists
    FROM customer
    WHERE customer_id = p_customer_id;

    IF customer_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer does not exist';
    END IF;

    SELECT
        b.booking_id,
        p.property_name,
        b.check_in_date,
        b.check_out_date,
        b.total_amount,
        b.status
    FROM booking b
    JOIN property p ON b.property_id = p.property_id
    WHERE b.customer_id = p_customer_id
    ORDER BY b.check_in_date DESC;
END$$

DELIMITER ;

CALL GetCustomerBookingHistory(5);

DELIMITER $$

CREATE PROCEDURE GetTopRatedProperties (
    IN p_min_rating DECIMAL(2,1),
    IN p_location VARCHAR(200),
    IN p_property_type VARCHAR(50)
)
BEGIN
    DECLARE match_count INT;

    SELECT COUNT(*)
    INTO match_count
    FROM property p
    JOIN review r ON p.property_id = r.property_id
    WHERE r.rating >= p_min_rating
      AND (p_location IS NULL OR p.location = p_location)
      AND (p_property_type IS NULL OR p.property_type = p_property_type);

    IF match_count = 0 THEN
        SIGNAL SQLSTATE '02000'
        SET MESSAGE_TEXT = 'No matching properties found';
    END IF;

    -- Fetch top-rated properties (AVG rating)
    SELECT
        p.property_id,
        p.property_name,
        p.location,
        p.property_type,
        ROUND(AVG(r.rating), 1) AS average_rating,
        COUNT(r.review_id) AS total_reviews
    FROM property p
    JOIN review r ON p.property_id = r.property_id
    WHERE (p_location IS NULL OR p.location = p_location)
      AND (p_property_type IS NULL OR p.property_type = p_property_type)
    GROUP BY
        p.property_id,
        p.property_name,
        p.location,
        p.property_type
    HAVING AVG(r.rating) >= p_min_rating
    ORDER BY average_rating DESC;
END$$

DELIMITER ;

CALL GetTopRatedProperties(4.5, 'Mumbai', 'Apartment');

