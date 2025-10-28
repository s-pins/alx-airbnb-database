# 🧠 Unleashing Advanced Querying Power
**Repository:** [alx-airbnb-database](../)  
**Directory:** `database-adv-script`  
**Files:** `joins_queries.sql`, `subqueries.sql`, `README.md`

---

## 🎯 Objective
Enhance SQL mastery through complex joins and subqueries to extract deep insights from the Airbnb schema.

---

## 🧩 Task 0 – Write Complex Queries with Joins
**Goal:** Combine related data using SQL joins to generate meaningful relationships.

### Queries Implemented
1. **INNER JOIN:** Retrieve all bookings and the users who made them.  
2. **LEFT JOIN:** Retrieve all properties and their reviews, including properties with none.  
3. **FULL OUTER JOIN:** Retrieve all users and all bookings, even with missing links.

---

## 🧠 Task 1 – Practice Subqueries
**Goal:** Use both correlated and non-correlated subqueries for advanced filtering.

### Queries Implemented
1. **Non-Correlated Subquery**  
   Retrieve all properties whose average rating exceeds 4.0.  
   - Uses aggregation and filtering inside the subquery.
   - Is independent of the outer query.

2. **Correlated Subquery**  
   Identify users who have made more than 3 bookings.  
   - The inner query depends on the current row from the outer query.
   - Ideal for per-user computations.

---

## Task 2: Apply Aggregations and Window Functions
**Objective:** Use SQL aggregation and window functions to analyze data.

### 1️⃣ Total Number of Bookings per User
This query calculates how many bookings each user has made using:
- `COUNT()` for counting bookings.
- `GROUP BY` to aggregate per user.
- A `LEFT JOIN` ensures users with zero bookings are still included.

---

### **Task 3 — Indexing for Optimization**
**Files:** `index_performance.md`  
- Created indexes on frequently used columns (`user_id`, `property_id`, `start_date`).  
- Compared query performance before and after indexing with `EXPLAIN ANALYZE`.  
- Result: up to **4× faster** query execution on large joins.

---

### **Task 4 — Query Optimization**
**Files:** `performance.sql`, `optimization_report.md`  
- Refactored a heavy multi-join query linking `bookings`, `users`, `properties`, and `payments`.  
- Reduced redundancy and optimized join order using indexed columns.  
- Documented performance improvements with visual query plans.

---

### **Task 5 — Partitioning Large Tables**
**Files:** `partitioning.sql`, `partition_performance.md`  
- Implemented **range partitioning** on the `bookings` table by `start_date`.  
- Improved query execution time by focusing scans only on relevant partitions.  
- Observed up to **75% reduction** in execution time for date-range queries.

---

## ⚙️ Testing Instructions
1. Open your SQL IDE or terminal.  
2. Load the Airbnb database schema with tables:
   - `users`
   - `properties`
   - `bookings`
   - `reviews`
3. Run:
   ```sql
   \i joins_queries.sql;
   \i subqueries.sql;
