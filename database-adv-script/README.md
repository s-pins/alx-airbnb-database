# 🧠 Task 0 – Write Complex Queries with Joins
**Project:** Unleashing Advanced Querying Power  
**Repository:** [alx-airbnb-database](../)  
**Directory:** `database-adv-script`  
**Files:** `joins_queries.sql`, `README.md`  

---

## 🎯 Objective
Master SQL joins by writing complex queries using **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN** to extract meaningful insights from the Airbnb database schema.

---

## 🧩 Task Description
This task focuses on understanding and implementing different types of SQL joins to combine data from related tables efficiently. Each query demonstrates how relationships between entities (Users, Bookings, and Properties) can be leveraged to produce relevant results.

---

## 💾 SQL Queries Overview

### 1. INNER JOIN – Retrieve all bookings and the respective users
Links bookings with their corresponding users, excluding any records without a match.

### 2. LEFT JOIN – Retrieve all properties and their reviews
Ensures all properties are displayed, even if they have no reviews.

### 3. FULL OUTER JOIN – Retrieve all users and all bookings
Displays all users and all bookings, even if one side is missing a relationship.

---

## ⚙️ Testing Instructions
1. Open your SQL terminal or IDE (e.g., pgAdmin, DBeaver).  
2. Load the Airbnb schema with `users`, `bookings`, `properties`, and `reviews` tables.  
3. Run the queries in `joins_queries.sql`.  
4. Use:
   ```sql
   EXPLAIN ANALYZE <your query>;
