# AirBnB Database Seeding

## Overview

This directory (`database-script-0x02`) contains the `seed.sql` file, which populates the AirBnB-like database with sample data. This script should be run after creating the schema from `database-script-0x01`.

## Sample Data Details

The seed data includes realistic examples for all entities:

- **Users**: 5 users (2 guests, 2 hosts, 1 admin) with varied details.
- **Properties**: 3 properties linked to hosts, with descriptions, locations, and prices.
- **Bookings**: 3 bookings (confirmed, pending, canceled) linked to properties and guests.
- **Payments**: 2 payments linked to confirmed/pending bookings.
- **Reviews**: 2 reviews from guests on properties they booked.
- **Messages**: 2 messages between a guest and a host for communication.

All data adheres to constraints (e.g., foreign keys, enums, rating checks) and represents common use cases like booking a property, making payments, leaving reviews, and messaging.

## Running the Seed Script

1. **Prerequisites**:
   - The database schema from `database-script-0x01/schema.sql` must be created first.
   - A database connection (e.g., MySQL, PostgreSQL).

2. **Execution**:
   - Run the script: `source seed.sql` (MySQL) or equivalent in your DBMS.
   - If using PostgreSQL, ensure UUIDs are handled correctly (e.g., cast strings to UUID if needed).

3. **Verification**:
   - Query tables to confirm data insertion, e.g., `SELECT * FROM User;`.

## Notes

- UUIDs are represented as strings for simplicity; adjust if your DBMS requires specific formatting.
- This is sample data only—expand or modify for production use.
- If errors occur (e.g., due to foreign key violations), ensure the schema is set up correctly.

## Related Files

- Schema: Refer to `../database-script-0x01/schema.sql` for table definitions.
