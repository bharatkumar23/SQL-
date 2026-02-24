SELECT
    property_id,
    property_name,
    JSON_EXTRACT(property_details, '$."Room Types"') AS room_types
FROM property;

SELECT
    property_id,
    property_name,
    JSON_EXTRACT(property_details, '$."Year Built"') AS year_built
FROM property
WHERE JSON_EXTRACT(property_details, '$."Year Built"') IS NOT NULL;

SELECT
    property_id,
    property_name
FROM property
WHERE JSON_CONTAINS(
    JSON_EXTRACT(property_details, '$."Room Types"'),
    '"Deluxe"'
);

SELECT
    property_id,
    property_name,
    JSON_EXTRACT(property_details, '$."Year Built"') AS year_built
FROM property
WHERE JSON_EXTRACT(property_details, '$."Year Built"') > 2020;

SELECT
    property_id,
    property_name
FROM property
WHERE JSON_EXTRACT(property_details, '$."Year Built"') IS NULL;
