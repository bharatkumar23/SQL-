-- Exercise 2
use accommodation;

-- Task 1 Lock the property’s availability
START TRANSACTION;

SELECT property_id, availability_status
FROM property
WHERE property_id = 5
FOR UPDATE;
-- This locks the selected property row so no other transaction can modify it until the transaction ends.

-- Task 2 Simulate two transactions booking the same property
-- Transaction A (Customer 1)
START TRANSACTION;

SELECT property_id
FROM property
WHERE property_id = 5
FOR UPDATE;

INSERT INTO booking
(customer_id, property_id, check_in_date, check_out_date, total_amount, status)
VALUES
(10, 5, '2026-03-01', '2026-03-05', 8000, 'CONFIRMED');
-- Transaction A holds the lock.

-- Transaction B (Customer 2 – waits)
START TRANSACTION;

SELECT property_id
FROM property
WHERE property_id = 5
FOR UPDATE;
-- Transaction B waits until Transaction A releases the lock.

-- Task 3 Release the lock after booking confirmation
COMMIT;
-- Committing the transaction releases the lock, allowing the waiting transaction to proceed.