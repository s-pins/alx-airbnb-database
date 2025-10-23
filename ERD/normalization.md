# Normalization Process – AirBnB Database

## Overview

This document explains the normalization process applied to the **AirBnB Database** design to ensure that it adheres to the **Third Normal Form (3NF)**.  
Normalization minimizes redundancy, enhances data integrity, and ensures efficient data manipulation.  

The normalization process follows three key stages:  
1. **First Normal Form (1NF)** – Eliminating repeating groups and ensuring atomicity.  
2. **Second Normal Form (2NF)** – Removing partial dependencies on composite primary keys.  
3. **Third Normal Form (3NF)** – Removing transitive dependencies and ensuring that non-key attributes depend only on the primary key.

---

## Step 1: First Normal Form (1NF)

**Goal:** Ensure that each column contains only atomic (indivisible) values and that each record is unique.

### Application:
- Each table has a **primary key** that uniquely identifies records.
- All attributes hold **atomic values** — no repeating groups or lists.
- For example:
  - In the `User` table, each user has one email, one name, and one role.
  - In the `Booking` table, `start_date` and `end_date` are distinct, non-repeating attributes.

✅ **Result:**  
All tables meet **1NF** because each field holds a single value, and each row is uniquely identifiable.

---

## Step 2: Second Normal Form (2NF)

**Goal:** Ensure that all non-key attributes are fully dependent on the entire primary key (no partial dependency).

### Application:
- Each table has a **single-attribute primary key** (UUID), so partial dependency does not exist.  
- Foreign keys (`host_id`, `user_id`, `property_id`, etc.) depend entirely on their respective primary keys.
- Example:
  - In the `Booking` table, `total_price`, `status`, and `created_at` depend solely on `booking_id`.
  - In the `Payment` table, `amount` and `payment_method` depend solely on `payment_id`.

✅ **Result:**  
No table contains attributes that depend only on part of a composite key — therefore, the schema is in **2NF**.

---

## Step 3: Third Normal Form (3NF)

**Goal:** Remove transitive dependencies — non-key attributes must depend only on the primary key.

### Application:
- All non-key attributes depend **only on their table’s primary key**.
- There are **no derived or calculated fields** stored (e.g., `total_price` in `Booking` is derived at runtime from property price × nights).
- Example validations:
  - In the `Property` table, attributes like `name`, `location`, and `price_per_night` depend only on `property_id`.
  - In the `User` table, `email` and `password_hash` depend only on `user_id` and not on each other.
  - In the `Review` table, `rating` and `comment` depend directly on `review_id`.

✅ **Result:**  
All transitive dependencies are eliminated, ensuring the schema fully conforms to **3NF**.

---

## Additional Notes

- **Referential Integrity:**  
  Foreign keys ensure valid relationships between tables — for example:
  - `Property.host_id → User.user_id`
  - `Booking.property_id → Property.property_id`
  - `Payment.booking_id → Booking.booking_id`

- **Data Consistency:**  
  Cascading rules can be applied (e.g., when deleting a user, associated properties or bookings are handled appropriately).

- **Performance Considerations:**  
  While normalization improves consistency, indexed fields (`email`, `property_id`, etc.) maintain performance for frequent queries.

---

## Conclusion

The **AirBnB Database Design** meets all normalization requirements up to **Third Normal Form (3NF)**:

| Normal Form | Requirement Met | Description |
|--------------|----------------|--------------|
| **1NF** | ✅ | Atomic attributes and unique rows |
| **2NF** | ✅ | Full functional dependency on primary keys |
| **3NF** | ✅ | No transitive dependencies |

The schema is optimized for **data integrity, scalability, and maintainability**, ensuring reliable performance in production environments.