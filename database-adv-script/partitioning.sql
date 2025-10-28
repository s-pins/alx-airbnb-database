-- ===========================================
-- Task 5: Partitioning Large Tables
-- Objective: Optimize query performance by partitioning the bookings table
-- ===========================================

-- Step 1: Preparation
-- Drop existing partitions if re-running this script
DROP TABLE IF EXISTS bookings_partitioned CASCADE;

-- Step 2: Create a Partitioned Bookings Table
-- We'll partition by RANGE on the start_date column.
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Step 3: Define Partitions
-- Example partitions for quarterly ranges.
CREATE TABLE bookings_q1 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_q2 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_q3 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_q4 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Step 4: Indexes for Each Partition
CREATE INDEX idx_q1_start_date ON bookings_q1(start_date);
CREATE INDEX idx_q2_start_date ON bookings_q2(start_date);
CREATE INDEX idx_q3_start_date ON bookings_q3(start_date);
CREATE INDEX idx_q4_start_date ON bookings_q4(start_date);

-- Step 5: Test Query on Partitioned Table
-- Query bookings between a date range to see how partitioning improves scan time.
EXPLAIN ANALYZE
SELECT id, user_id, property_id, total_amount
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-04-15' AND '2025-06-30';

-- Expected outcome:
-- The planner should only scan the relevant partition (bookings_q2),
-- reducing I/O and improving speed compared to a full-table scan.
