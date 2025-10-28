-- seed.sql
-- Sample data for AirBnB-like database
-- Ensure the schema from database-script-0x01 is already created before running this.

-- Insert sample Users (mix of guests, hosts, and an admin)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+1234567890', 'guest'),
('550e8400-e29b-41d4-a716-446655440001', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+1234567891', 'host'),
('550e8400-e29b-41d4-a716-446655440002', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '+1234567892', 'guest'),
('550e8400-e29b-41d4-a716-446655440003', 'Bob', 'Williams', 'bob.williams@example.com', 'hashed_password_4', '+1234567893', 'host'),
('550e8400-e29b-41d4-a716-446655440004', 'Admin', 'User', 'admin@example.com', 'hashed_password_5', '+1234567894', 'admin');

-- Insert sample Properties (linked to hosts)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
('660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Apartment', 'A comfortable apartment in the city center.', 'New York, NY', 100.00),
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 'Beach House', 'Relaxing beach house with ocean views.', 'Miami, FL', 200.00),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Mountain Cabin', 'Secluded cabin in the mountains.', 'Denver, CO', 150.00);

-- Insert sample Bookings (linked to properties and users/guests)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('770e8400-e29b-41d4-a716-446655440000', '660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', '2023-10-01', '2023-10-05', 400.00, 'confirmed'),
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '2023-11-01', '2023-11-03', 400.00, 'pending'),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440000', '2023-12-01', '2023-12-07', 900.00, 'canceled');

-- Insert sample Payments (linked to bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('880e8400-e29b-41d4-a716-446655440000', '770e8400-e29b-41d4-a716-446655440000', 400.00, 'credit_card'),
('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 400.00, 'paypal');

-- Insert sample Reviews (linked to properties and users who booked them)
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('990e8400-e29b-41d4-a716-446655440000', '660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', 5, 'Amazing stay! Highly recommend.'),
('990e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 4, 'Great location, but a bit noisy.');

-- Insert sample Messages (between users, e.g., guest to host)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('aa0e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Hi, is the apartment available for check-in at 3 PM?'),
('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Yes, that works! See you then.');
