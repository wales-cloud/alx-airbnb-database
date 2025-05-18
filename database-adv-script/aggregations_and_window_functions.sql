Assuming these tables:

users(id, name)

bookings(id, user_id, property_id)

properties(id, title)

✅ 1. Aggregation Query — Total Bookings per User

-- Total number of bookings made by each user
SELECT
  users.id AS user_id,
  users.name,
  COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;
✅ 2. Window Function — Rank Properties by Booking Count

-- Rank properties by total number of bookings using ROW_NUMBER
SELECT
  property_id,
  COUNT(*) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num_rank
FROM bookings
GROUP BY property_id;

