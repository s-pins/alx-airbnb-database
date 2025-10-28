# Task 3: Implement Indexes for Optimization

## 🎯 Objective
Improve database performance by creating indexes on frequently used columns in the **User**, **Booking**, and **Property** tables.

Indexes help the database find rows faster, especially in large tables that rely heavily on `WHERE`, `JOIN`, and `ORDER BY` operations.

---

## 🧩 Step 1: Identify High-Usage Columns

### 🔹 Users Table
- `email`: often used for login and lookups.
- `id`: used in joins with the `bookings` table.

### 🔹 Bookings Table
- `user_id`: used in joins with `users`.
- `property_id`: used in joins with `properties`.
- `booking_date`: commonly used for sorting and filtering recent activity.

### 🔹 Properties Table
- `city`: used in location-based searches.
- `id`: used in joins with `bookings`.

---

## ⚙️ Step 2: Create Indexes

Below are the SQL commands to create indexes that optimize common queries.

```sql
-- Users table indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Properties table indexes
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_properties_id ON properties(id);
