INSERT INTO customer (
    username,
    first_name,
    last_name,
    email,
    phone_number,
    password_hash,
    created_at,
    updated_at
)
VALUES (
    'john_doe',
    'John',
    'Doe',
    'john@example.com',
    9876543210,
    'pass@123',
    NOW(),
    NOW()
);
 
INSERT INTO property (
    property_name,
    location,
    property_type,
    price_per_night,
    owner_id
)
VALUES
    ('Ocean View Apartment', 'Mumbai, India', 'Apartment', 4500, 9),
    ('Mountain Cabin', 'Manali, India', 'Homestay', 3500, 5);


INSERT INTO booking (
    customer_id,
    property_id,
    check_in_date,
    check_out_date,
    total_amount,
    status,
    created_at,
    updated_at
)
SELECT
    customer_id,
    property_id,
    check_in_date,
    check_out_date,
    total_amount * 0.9,
    'Pending',
    NOW(),
    NOW()
FROM booking
WHERE customer_id = 3;
