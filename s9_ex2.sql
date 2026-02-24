DELIMITER $$

CREATE TRIGGER trg_prevent_overbooking
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
    DECLARE prop_status VARCHAR(20);

    SELECT availability_status
    INTO prop_status
    FROM property
    WHERE property_id = NEW.property_id;

    IF prop_status = 'unavailable' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking failed: Property is unavailable';
    END IF;
END$$

DELIMITER ;

INSERT INTO booking (customer_id, property_id, total_amount, check_in_date, check_out_date)
VALUES (4, 2, 55000, '2026-04-01', '2026-04-05');

DELIMITER $$

CREATE TRIGGER trg_update_availability
AFTER INSERT ON booking
FOR EACH ROW
BEGIN
    UPDATE property
    SET availability_status = 'unavailable'
    WHERE property_id = NEW.property_id;
END$$

DELIMITER ;

INSERT INTO booking (customer_id, property_id, total_amount, check_in_date, check_out_date)
VALUES (5, 3, 65000, '2026-05-10', '2026-05-15');

CREATE TABLE property_price_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_log_price_change
AFTER UPDATE ON property
FOR EACH ROW
BEGIN
    IF OLD.price_per_night <> NEW.price_per_night THEN
        INSERT INTO property_price_log (
            property_id,
            old_price,
            new_price
        )
        VALUES (
            OLD.property_id,
            OLD.price_per_night,
            NEW.price_per_night
        );
    END IF;
END$$

DELIMITER ;

UPDATE property
SET price_per_night = 72000
WHERE property_id = 3;



