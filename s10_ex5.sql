SELECT doc
FROM customer_support_ticket;

SELECT doc
FROM customer_support_ticket
WHERE JSON_EXTRACT(doc, '$.status') = 'Open';

SELECT doc
FROM customer_support_ticket
WHERE JSON_EXTRACT(doc, '$.status') = 'Open'
ORDER BY JSON_EXTRACT(doc, '$.created_at') ASC;

SELECT doc
FROM customer_support_ticket
WHERE JSON_EXTRACT(doc, '$.customer_name') = 'Priya Gupta';

SELECT doc
FROM customer_support_ticket
WHERE JSON_EXTRACT(doc, '$.issue_type') = 'Refund';

SELECT doc
FROM customer_support_ticket
WHERE JSON_EXTRACT(doc, '$.resolved_at') BETWEEN
      '2025-01-05T00:00:00Z' AND '2025-01-06T23:59:59Z';

SELECT doc
FROM customer_support_ticket
WHERE YEAR(JSON_EXTRACT(doc, '$.created_at')) = 2025
ORDER BY JSON_EXTRACT(doc, '$.customer_name') DESC
LIMIT 2;