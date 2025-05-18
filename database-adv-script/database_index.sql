-- Index for joining bookings with users
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for joining bookings with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index for filtering bookings by check-in date
CREATE INDEX idx_bookings_check_in ON bookings(check_in);

-- Index for searching properties by location
CREATE INDEX idx_properties_location ON properties(location);


EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 101
ORDER BY check_in;

or

EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE location = 'Toronto';