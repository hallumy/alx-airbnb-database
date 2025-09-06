# 🗄️ Database Seeding Guide  

This guide explains how to **insert sample data** into the database for testing the system.  

The schema includes the following tables:  
- `User`  
- `Property`  
- `Booking`  
- `Payment`  
- `Review`  
- `Message`  

We’ll use **integer primary keys (1, 2, 3, …)** for simplicity instead of UUIDs.  

---

## 1. Insert Users  

```sql
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 'password', '1234567890', 'guest'),
(2, 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0723456789', 'host'),
(3, 'Clara', 'Williams', 'clara@example.com', 'hashed_pw_3', NULL, 'admin');

In the property table the user id will be 2 since bob is the host
(1, 2, 'Cozy Cottage', 'A quiet cottage near the lake.', 'Nairobi, Kenya', 7500),
(2, 2, 'City Apartment', 'Modern apartment in the city center.', 'Mombasa, Kenya', 12000),
(3, 2, 'Enzi Homes', 'Cozy 3 bedroom modern apartment all ensuited with swimming pool at the rooftop', 'South C, Nairobi', 6000);
