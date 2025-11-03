-- ================================================================
-- Project: Unleashing Advanced Querying Power
-- Task 0: Write Complex Queries with Joins
-- Repository: alx-airbnb-database
-- Directory: database-adv-script
-- File: joins_queries.sql
-- ================================================================

-- Use the Airbnb database
USE airbnb_db;

-- ------------------------------------------------
-- 1. INNER JOIN: Retrieve all bookings and their respective users
-- ------------------------------------------------
SELECT 
    b.booking_id,
    b.property_id,
    b.user_id,
    u.name AS user_name,
    u.email,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id;

-- ------------------------------------------------
-- 2. LEFT JOIN: Retrieve all properties and their reviews
-- ------------------------------------------------
SELECT 
    p.property_id,
    p.title AS property_title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id;

-- ------------------------------------------------
-- 3. FULL OUTER JOIN: Retrieve all users and all bookings
-- ------------------------------------------------
-- MySQL doesn’t support FULL OUTER JOIN directly.
-- Use a UNION of LEFT JOIN and RIGHT JOIN to emulate it.

SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.status
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.status
FROM users AS u
RIGHT JOIN bookings AS b
    ON u.user_id = b.user_id;

-- ================================================================
-- PostgreSQL syntax
-- ================================================================

-- ===========================================================
-- Project: Unleashing Advanced Querying Power
-- Task 0: Write Complex Queries with Joins
-- Repository: alx-airbnb-database
-- File: joins_queries.sql
-- ===========================================================

-- 1️⃣ INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    b.property_id,
    b.user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.check_in_date,
    b.check_out_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id;


-- 2️⃣ LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.title AS property_title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id;
ORDER BY p.property_id;


-- 3️⃣ FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking
-- Note: PostgreSQL syntax; if using MySQL, simulate with UNION of LEFT and RIGHT joins.
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.status
FROM users AS u
FULL OUTER JOIN bookings AS b
    ON u.user_id = b.user_id;

