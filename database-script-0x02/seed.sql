-- Seed Users
INSERT INTO users (name, email, password_hash)
VALUES 
('Alice Johnson', 'alice@example.com', 'hashedpass1'),
('Bob Smith', 'bob@example.com', 'hashedpass2'),
('Clara Davis', 'clara@example.com', 'hashedpass3');

-- Seed Properties
INSERT INTO properties (owner_id, title, description, location, price_per_night)
VALUES 
(1, 'Cozy Cottage', 'A small, charming cottage near the lake.', 'Toronto, ON', 120.00),
(2, 'Downtown Loft', 'Modern loft in the heart of the city.', 'Vancouver, BC', 180.00),
(1, 'Mountain Retreat', 'Quiet getaway in the mountains.', 'Banff, AB', 200.00);

-- Seed Bookings
INSERT INTO bookings (user_id, property_id, check_in, check_out, status)
VALUES
(2, 1, '2025-06-01', '2025-06-05', 'confirmed'),
(3, 2, '2025-07-10', '2025-07-15', 'pending'),
(2, 3, '2025-08-01', '2025-08-04', 'confirmed');

-- Seed Payments
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
(1, 480.00, 'Credit Card'),
(3, 600.00, 'PayPal');

-- Seed Reviews
INSERT INTO reviews (user_id, property_id, rating, comment)
VALUES
(2, 1, 5, 'Loved the lake view and peaceful vibes.'),
(3, 2, 4, 'Great location but a bit noisy at night.'),
(2, 3, 5, 'Perfect retreat, very clean and comfortable.');
