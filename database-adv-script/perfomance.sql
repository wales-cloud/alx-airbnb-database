-- Initial complex query: get all bookings with user, property, and payment details
SELECT
  b.id AS booking_id,
  b.check_in,
  b.check_out,
  u.name AS user_name,
  u.email AS user_email,
  p.title AS property_title,
  p.location,
  pay.amount,
  pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.check_in;
