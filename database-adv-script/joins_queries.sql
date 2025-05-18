Assuming these tables exist:

users(id, name, email)

bookings(id, user_id, property_id, check_in, check_out)

properties(id, title, location)

reviews(id, property_id, user_id, rating, comment)

Here are the 3 required queries:

1. INNER JOIN — Users with their Bookings

-- Get all bookings and the respective users who made them
SELECT
  bookings.id AS booking_id,
  users.id AS user_id,
  users.name,
  bookings.property_id,
  bookings.check_in,
  bookings.check_out
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;
2. LEFT JOIN — Properties and Their Reviews (even if no reviews)


-- Get all properties and their reviews (if any)
SELECT
  properties.id AS property_id,
  properties.title,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.title ASC;

3. FULL OUTER JOIN — All Users and Bookings (even unmatched)

-- Get all users and all bookings, including unmatched ones
SELECT
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.check_in
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
If your database doesn’t support FULL OUTER JOIN (e.g., MySQL), use this workaround:


-- MySQL-compatible FULL OUTER JOIN using UNION
SELECT
  users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.check_in
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT
  users.id,
  users.name,
  bookings.id,
  bookings.property_id,
  bookings.check_in
FROM bookings
LEFT JOIN users ON bookings.user_id = users.id;