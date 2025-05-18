Assuming your tables look like:

properties(id, title, location)

reviews(id, property_id, rating)

users(id, name)

bookings(id, user_id, property_id)

✅ 1. Non-Correlated Subquery: Properties with Avg Rating > 4.0
sql
Copy
Edit
-- Properties where the average rating is greater than 4.0
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
✅ 2. Correlated Subquery: Users with More Than 3 Bookings
sql
Copy
Edit
-- Users who have made more than 3 bookings
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
