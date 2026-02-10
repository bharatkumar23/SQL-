SELECT
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night
FROM property p
WHERE p.price_per_night >
      (
          SELECT AVG(price_per_night)
          FROM property
          WHERE location = p.location
      );

SELECT
    p.property_id,
    p.property_name,
    p.location,
    p.price_per_night,
    o.first_name,
    o.last_name
FROM property p
JOIN `owner` o
    ON p.owner_id = o.owner_id
WHERE p.price_per_night IN (
    SELECT MIN(price_per_night)
    FROM property
    WHERE location = p.location
);
