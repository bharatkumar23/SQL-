START TRANSACTION;

INSERT INTO booking (
    customer_id,
    property_id,
    total_amount,
    check_in_date,
    check_out_date
)
VALUES (
    3,
    3,
    75000,
    '2026-02-01',
    '2026-02-05'
);

SAVEPOINT booking_created;

UPDATE booking
SET
    check_in_date  = '2026-02-03',
    check_out_date = '2026-02-07'
WHERE customer_id = 3;

ROLLBACK TO booking_created;

COMMIT;
