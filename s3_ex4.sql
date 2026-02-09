SELECT customer_id, SUM(total_amount) AS total_spent FROM booking
GROUP BY customer_id HAVING total_spent > 20000;

SELECT property.property_name, AVG(review.rating) AS average_rating
FROM property JOIN review ON property.property_id = review.property_id
GROUP BY property.property_name;

