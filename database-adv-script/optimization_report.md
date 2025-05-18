# Airbnb Clone – Query Optimization Report

## Initial Query
Joined tables: `bookings`, `users`, `properties`, and `payments`  
Included all columns and used `ORDER BY` on `check_in`.

### Performance Notes
- Used `EXPLAIN ANALYZE` and found sequential scans on `bookings` and `users`
- Total execution time: ~X.XX ms
- Full rows scanned: X,XXX

---

## Optimizations Applied
- Added indexes on `user_id`, `property_id`, and `check_in`
- Reduced selected columns to only those needed
- Added `WHERE b.check_in >= CURRENT_DATE` to reduce row scan volume
- Resulted in index scans for bookings and faster lookups

---

## Result
- Execution time reduced to ~X.XX ms
- Switched from sequential scans to index scans
- Lighter result payload and improved responsiveness

## Recommendation
- Avoid SELECT * in production queries
- Always filter early
- Maintain indexes on frequently joined and filtered columns
