SELECT
    a.amenity_name,
    p.property_name
FROM amenity a
LEFT OUTER JOIN property_amenity pa
    ON a.amenity_id = pa.amenity_id
LEFT OUTER JOIN property p
    ON p.property_id = pa.property_id;