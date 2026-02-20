CREATE TABLE promotion (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_title VARCHAR(100) NOT NULL,
    discount_percentage DECIMAL(5,2)
        CHECK (discount_percentage BETWEEN 0 AND 100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    property_id INT REFERENCES property(property_id)
);

