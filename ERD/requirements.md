
# Database Specification – AirBnB

## Entities and Attributes

### **User**
- `user_id`: **UUID**, Primary Key, Indexed  
- `first_name`: **VARCHAR**, NOT NULL  
- `last_name`: **VARCHAR**, NOT NULL  
- `email`: **VARCHAR**, UNIQUE, NOT NULL  
- `password_hash`: **VARCHAR**, NOT NULL  
- `phone_number`: **VARCHAR**, NULL  
- `role`: **ENUM**('guest', 'host', 'admin'), NOT NULL  
- `created_at`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  

---

### **Property**
- `property_id`: **UUID**, Primary Key, Indexed  
- `host_id`: **UUID**, Foreign Key → `User(user_id)`  
- `name`: **VARCHAR**, NOT NULL  
- `description`: **TEXT**, NOT NULL  
- `location`: **VARCHAR**, NOT NULL  
- `price_per_night`: **DECIMAL**, NOT NULL  
- `created_at`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  
- `updated_at`: **TIMESTAMP**, ON UPDATE CURRENT_TIMESTAMP  

---

### **Booking**
- `booking_id`: **UUID**, Primary Key, Indexed  
- `property_id`: **UUID**, Foreign Key → `Property(property_id)`  
- `user_id`: **UUID**, Foreign Key → `User(user_id)`  
- `start_date`: **DATE**, NOT NULL  
- `end_date`: **DATE**, NOT NULL  
- `total_price`: **DECIMAL**, NOT NULL  
- `status`: **ENUM**('pending', 'confirmed', 'canceled'), NOT NULL  
- `created_at`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  

---

### **Payment**
- `payment_id`: **UUID**, Primary Key, Indexed  
- `booking_id`: **UUID**, Foreign Key → `Booking(booking_id)`  
- `amount`: **DECIMAL**, NOT NULL  
- `payment_date`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  
- `payment_method`: **ENUM**('credit_card', 'paypal', 'stripe'), NOT NULL  

---

### **Review**
- `review_id`: **UUID**, Primary Key, Indexed  
- `property_id`: **UUID**, Foreign Key → `Property(property_id)`  
- `user_id`: **UUID**, Foreign Key → `User(user_id)`  
- `rating`: **INTEGER**, CHECK (rating BETWEEN 1 AND 5), NOT NULL  
- `comment`: **TEXT**, NOT NULL  
- `created_at`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  

---

### **Message**
- `message_id`: **UUID**, Primary Key, Indexed  
- `sender_id`: **UUID**, Foreign Key → `User(user_id)`  
- `recipient_id`: **UUID**, Foreign Key → `User(user_id)`  
- `message_body`: **TEXT**, NOT NULL  
- `sent_at`: **TIMESTAMP**, DEFAULT CURRENT_TIMESTAMP  

---

## Constraints

### **User**
- Unique constraint on `email`  
- Non-null constraints on required fields  

### **Property**
- Foreign Key on `host_id`  
- Non-null constraints on key attributes  

### **Booking**
- Foreign Keys on `property_id` and `user_id`  
- `status` limited to: `pending`, `confirmed`, `canceled`  

### **Payment**
- Foreign Key on `booking_id` ensuring linkage to valid bookings  

### **Review**
- Foreign Keys on `property_id` and `user_id`  
- Rating constraint: value must be between 1–5  

### **Message**
- Foreign Keys on `sender_id` and `recipient_id`  

---

## Indexing

- **Primary Keys**: Automatically Indexed  
- **Additional Indexes:**
  - `email` in **User**  
  - `property_id` in **Property** and **Booking**  
  - `booking_id` in **Booking** and **Payment**  

---
