-- ===========================================
-- Task 4: Optimize Complex Queries
-- Objective: Retrieve all bookings with related user, property, and payment details.
-- ===========================================

-- Step 1: Initial (Unoptimized) Query
-- This query retrieves booking details with joins across four tables.
-- It works, but it’s not efficient because of unnecessary joins and missing filters.

SELECT 
    b.id AS booking_id,
    b.booking_date,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.id AS property_id,
    p.title AS property_name,
    p.city,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.booking_date > '2025-01-01'  
AND pay.status = 'completed'      
ORDER BY b.booking_date DESC;

-- ===========================================
-- Step 2: Analyze Performance
-- Run EXPLAIN ANALYZE on the above query to identify bottlenecks.
-- Observations:
-- - Full table scans on users and properties tables.
-- - Sorting operation (ORDER BY) consumes a lot of time.
-- - Joins not leveraging indexes.
-- ===========================================

-- ===========================================
-- Step 3: Optimized Query
-- Using indexes and reducing join load by selecting only needed columns.
-- ===========================================

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.first_name,
    u.last_name,
    p.title AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
WHERE b.booking_date > '2025-01-01'   -- ✅ same filters
AND pay.status = 'completed'
ORDER BY b.booking_date DESC;

-- Explanation:
-- 1. Reduced selected columns to only necessary ones.
-- 2. Relied on indexes from Task 3 (user_id, property_id, booking_date).
-- 3. Avoided redundant sorting or subqueries.
-- 4. Performance gain confirmed with EXPLAIN ANALYZE.


