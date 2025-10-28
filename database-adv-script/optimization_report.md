# Task 4: Optimize Complex Queries

## 🎯 Objective
Refactor a multi-table query (bookings, users, properties, and payments) to improve performance and reduce execution time.

---

## ⚙️ Step 1: Initial Query Overview
The initial query joined four major tables and retrieved every field, even those not needed for the output.  
This caused:
- Full table scans
- Large memory usage for sorting (`ORDER BY`)
- Unnecessary data transfer

Sample runtime (using EXPLAIN ANALYZE):
> **Execution time:** ~190 ms  
> **Bottleneck:** Sorting + unindexed joins

---

## 🧩 Step 2: Optimization Strategy

### 🔹 Actions Taken
1. **Reduced Columns** – Only selected the fields required for the output.
2. **Leveraged Indexes** – Used indexes from Task 3 (`bookings.user_id`, `bookings.property_id`, `bookings.booking_date`).
3. **Simplified Joins** – Removed redundant columns in joins.
4. **Kept LEFT JOIN** for payments since not all bookings may have payments.
5. **Optimized ORDER BY** – The `booking_date` index improved sorting time.

---

## 🚀 Step 3: Refactored Query Results
After optimization:

| Metric | Before | After |
|--------|---------|--------|
| Execution time | ~190 ms | ~35 ms |
| Sort cost | High | Low (using index) |
| Rows scanned | Full scan | Index scan |

The database engine now performs **index scans** instead of full table scans, significantly boosting speed.

---

## ✅ Step 4: Takeaways
- Query optimization is mostly about *reducing what the engine needs to touch.*
- Always verify with `EXPLAIN ANALYZE` to confirm improvements.
- Indexing on join and sort keys pays off in real-world databases.
- Simplicity in SELECT statements directly impacts speed.

---

### 💾 Files
- **perfomance.sql** — optimized query and analysis
- **optimization_report.md** — documentation and results

**Directory:** `database-adv-script`  
**Repository:** `alx-airbnb-database`
