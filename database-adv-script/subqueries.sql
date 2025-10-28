-- ===========================================================
-- Project: Unleashing Advanced Querying Power
-- Task 1: Practice Subqueries
-- Repository: alx-airbnb-database
-- File: subqueries.sql
-- ===========================================================

-- 1️⃣ Non-Correlated Subquery:
-- Find all properties where the average rating is greater than 4.0
SELECT 
    p.property_id,
    p.title AS property_title,
    p.location,
    p.price_per_night
FROM properties AS p
WHERE p.property_id IN (
    SELECT 
        r.property_id
    FROM reviews AS r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


-- 2️⃣ Correlated Subquery:
-- Find users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.name AS user_name,
    u.email
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3;
