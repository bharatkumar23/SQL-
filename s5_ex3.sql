CREATE INDEX idx_booking
ON booking (check_in_date, check_out_date);

CREATE INDEX idx_property
ON property (location);

CREATE INDEX idx_review
ON review (rating, review_text); 
-- CREATE FULLTEXT INDEX idx_review_text ON review (review_text); or review_text(255)

