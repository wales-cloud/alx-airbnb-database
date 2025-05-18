-- Step 1: Create the main bookings table with partitioning
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (check_in);

-- Step 2: Create child partitions (example: quarterly)
CREATE TABLE bookings_2024_q1 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE bookings_2024_q2 PARTITION OF bookings
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE bookings_2024_q3 PARTITION OF bookings
FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE bookings_2024_q4 PARTITION OF bookings
FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');


EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE check_in BETWEEN '2024-04-01' AND '2024-04-15';
