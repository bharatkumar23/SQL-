CREATE TEMPORARY TABLE booking_summary AS
SELECT
    property_id,
    COUNT(booking_id) AS `Total Bookings`,
    SUM(total_amount) AS `Total Revenue`
FROM booking
GROUP BY property_id;

CREATE VIEW property_summary AS
SELECT
    property_id,
    COUNT(booking_id) AS `Total Bookings`,
    SUM(total_amount) AS `Total Revenue`
FROM booking
GROUP BY property_id;

SELECT *
FROM property_summary;