CREATE TABLE refund (
    refund_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    refund_amount DECIMAL(10,2) NOT NULL
        CHECK (refund_amount > 0),
    refund_date DATE NOT NULL,
    
    CONSTRAINT fk_refund_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
);
