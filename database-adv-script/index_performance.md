# Airbnb Clone – Index Optimization Report

## Indexed Columns

- `bookings.user_id`
- `bookings.property_id`
- `bookings.check_in`
- `properties.location`

These columns were selected due to frequent use in JOINs, WHERE filters, and ORDER BY clauses.

---

## Example: Index on bookings.property_id

### Query (before index)
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE property_id = 101;


EXPLAIN ANALYZE
SELECT * FROM bookings WHERE property_id = 101;
