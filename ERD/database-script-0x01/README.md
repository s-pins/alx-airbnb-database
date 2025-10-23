# Airbnb Database Schema (Project: DataScape)

This project defines the database schema for an Airbnb-like application.  
It was built as part of the **ALX Airbnb Database Module**.

---

## 📘 Overview
The schema models users, properties, bookings, payments, reviews, and messages — ensuring data integrity, normalization, and scalability.

---

## 📂 Files
| File | Description |
|------|--------------|
| `schema.sql` | Contains all SQL `CREATE TABLE` statements defining tables, constraints, and indexes. |

---

## 🧩 Entities & Relationships

| Entity | Description |
|---------|--------------|
| **User** | Stores user details (guests, hosts, admins) |
| **Property** | Represents listings created by hosts |
| **Booking** | Stores booking details per property |
| **Payment** | Records payments made for bookings |
| **Review** | Stores reviews for properties |
| **Message** | Stores user-to-user communications |

---

## ⚙️ Constraints & Checks
- **Foreign Keys:** Enforce referential integrity between related tables.
- **Unique & NOT NULL:** Maintain data validity.
- **ENUM/Check Constraints:** Restrict fields like `status`, `role`, and `payment_method`.
- **Indexes:** Added on frequently queried fields for optimization.

---

## 🧠 Normalization
- Database normalized up to **Third Normal Form (3NF)**.
- No repeating groups or transitive dependencies.

---

## 🧪 Usage
To create the schema:

```bash
psql -U username -d airbnb_db -f schema.sql
```
- or mysql
```
mysql -u <username> -p airbnb_db < schema.sql
```
