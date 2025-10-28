# Task 5: Partitioning Large Tables

## 🎯 Objective
To improve performance for queries on large datasets by implementing **table partitioning** on the `bookings` table, using the `start_date` column as the partition key.

---

## ⚙️ Step 1: Setup
The `bookings` table was restructured as a **range-partitioned table**, split by quarters (`Q1` – `Q4`).  
Each partition stores data within its date range and includes its own index on `start_date`.

---

## 🧪 Step 2: Performance Test
### Query Used:
```sql
SELECT id, user_id, property_id, total_amount
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-04-15' AND '2025-06-30';
