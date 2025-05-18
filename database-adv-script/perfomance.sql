-- Query with WHERE and AND clause
SELECT
  b.id AS booking_id,
  b.check_in,
  b.check_out,
  u.name AS user_name,
  p.title AS property_title,
  pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.check_in >= CURRENT_DATE
  AND pay.amount IS NOT NULL
ORDER BY b.check_in;


-- Performance analysis using EXPLAIN
EXPLAIN
SELECT
  b.id AS booking_id,
  b.check_in,
  b.check_out,
  u.name AS user_name,
  p.title AS property_title,
  pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.check_in >= CURRENT_DATE
  AND pay.amount IS NOT NULL
ORDER BY b.check_in;
