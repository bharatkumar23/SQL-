CREATE ROLE data_analyst;
GRANT SELECT ON accommodation.* TO data_analyst;
GRANT data_analyst TO analyst_user;
REVOKE DELETE ON accommodation.* FROM analyst_user;