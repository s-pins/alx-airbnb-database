-- Task 3: Implement Indexes for Optimization
-- Objective: Create indexes to improve query performance

-- 🧩 Step 1: Create Indexes

-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Properties table
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_properties_id ON properties(id);

-- 🧪 Step 2: Measure performance before and after using EXPLAIN

-- Example: Query without index (before optimization)
EXPLAIN SELECT * FROM bookings WHERE booking_date > '2025-01-01';

-- Example: Query after index (after optimization)
EXPLAIN ANALYZE SELECT * FROM bookings WHERE booking_date > '2025-01-01';
