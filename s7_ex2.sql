ALTER TABLE customer
ADD CONSTRAINT UNIQUE (email);

ALTER TABLE customer
ADD CONSTRAINT chk_customer_phone
CHECK (LENGTH(phone_number) = 10);

ALTER TABLE customer
MODIFY username VARCHAR(100) NOT NULL;