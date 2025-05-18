# Airbnb Clone – Partitioning Performance Report

## Objective
Improve query speed on the large `bookings` table by partitioning based on `check_in` date.

---

## Approach
Implemented **range partitioning** on `check_in` column using quarterly partitions.

---

## Before Partitioning (Simulated)
```sql
EXPLAIN ANALYZE SELECT * FROM bookings WHERE check_in BETWEEN '2024-04-01' AND '2024-04-15';
-- Result: Seq Scan on full bookings table
-- Execution Time: ~48ms


EXPLAIN ANALYZE SELECT * FROM bookings WHERE check_in BETWEEN '2024-04-01' AND '2024-04-15';
-- Result: Index or Seq Scan only on bookings_2024_q2
-- Execution Time: ~6ms
