INSERT INTO property (
    property_id,
    owner_id,
    property_name,
    location,
    price_per_night,
    property_details
)
VALUES
(
    101,
    1,
    'Coral Reef Resort',
    'Goa',
    5000,
    JSON_OBJECT(
        'Year Built', 2018,
        'Room Types', JSON_ARRAY('Standard', 'Deluxe', 'Family Suite'),
        'Accessibility', JSON_OBJECT(
            'Wheelchair Accessible', TRUE,
            'Elevator', TRUE
        )
    )
),
(
    102,
    2,
    'Hilltop Retreat',
    'Mussoorie',
    4000,
    JSON_OBJECT(
        'Room Types', JSON_ARRAY('Single', 'Double', 'Penthouse'),
        'Accessibility', JSON_OBJECT(
            'Wheelchair Accessible', FALSE,
            'Elevator', TRUE
        )
    )
),
(
    103,
    3,
    'Riverside Lodge',
    'Kerala',
    7000,
    JSON_OBJECT(
        'Year Built', 2021,
        'Room Types', JSON_ARRAY('Studio', 'Cottage')
    )
);