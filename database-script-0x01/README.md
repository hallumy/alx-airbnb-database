#  Database Schema – Booking System

This project defines a relational database schema for a **property booking system**, including **users, properties, bookings, payments, reviews, and messages**.

The schema is designed up to **Third Normal Form (3NF)** to avoid redundancy and ensure data integrity.

---

##  Entity-Relationship Diagram (ERD)

> ERD illustrates the relationships between Users, Properties, Bookings, Payments, Reviews, and Messages.

![Database ERD](/ERD/docs/erd.png)

---

##  Database Tables

### 1. Users
Stores all platform users (guests, hosts, admins).

| Column        | Type      | Constraints                                      |
|---------------|-----------|--------------------------------------------------|
| user_id       | UUID      | **PK**, Indexed                                  |
| first_name    | VARCHAR   | NOT NULL                                         |
| last_name     | VARCHAR   | NOT NULL                                         |
| email         | VARCHAR   | **UNIQUE**, NOT NULL                             |
| password_hash | VARCHAR   | NOT NULL                                         |
| phone_number  | VARCHAR   | NULL                                             |
| role          | ENUM      | NOT NULL, CHECK (guest, host, admin)             |
| created_at    | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                      |

---

### 2. Properties
Represents listings created by hosts.

| Column       | Type      | Constraints                                                |
|--------------|-----------|------------------------------------------------------------|
| property_id  | UUID      | **PK**, Indexed                                            |
| host_id      | UUID      | **FK → Users(user_id)**, ON DELETE CASCADE                 |
| name         | VARCHAR   | NOT NULL                                                   |
| description  | TEXT      | NOT NULL                                                   |
| location     | VARCHAR   | NOT NULL                                                   |
| pricepernight| DECIMAL   | NOT NULL                                                   |
| created_at   | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                                |
| updated_at   | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`, ON UPDATE `CURRENT_TIMESTAMP` |

---

### 3. Bookings
Links users with properties for reservations.

| Column      | Type      | Constraints                                         |
|-------------|-----------|-----------------------------------------------------|
| booking_id  | UUID      | **PK**, Indexed                                     |
| property_id | UUID      | **FK → Properties(property_id)**, ON DELETE CASCADE |
| user_id     | UUID      | **FK → Users(user_id)**, ON DELETE CASCADE          |
| start_date  | DATE      | NOT NULL                                            |
| end_date    | DATE      | NOT NULL, CHECK (end_date > start_date)             |
| total_price | DECIMAL   | NOT NULL (derived from nights × pricepernight)      |
| status      | ENUM      | NOT NULL, CHECK (pending, confirmed, canceled)      |
| created_at  | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                         |

---

### 4. Payments
Tracks booking payments.

| Column        | Type      | Constraints                                      |
|---------------|-----------|--------------------------------------------------|
| payment_id    | UUID      | **PK**, Indexed                                  |
| booking_id    | UUID      | **FK → Bookings(booking_id)**, ON DELETE CASCADE |
| amount        | DECIMAL   | NOT NULL                                         |
| payment_date  | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                      |
| payment_method| ENUM      | NOT NULL, CHECK (credit_card, paypal, stripe)    |

---

### 5. Reviews
Allows guests to review properties.


| Column     | Type      | Constraints                                          |
|------------|-----------|------------------------------------------------------|
| review_id  | UUID      | **PK**, Indexed                                      |
| property_id| UUID      | **FK → Properties(property_id)**, ON DELETE CASCADE  |
| user_id    | UUID      | **FK → Users(user_id)**, ON DELETE CASCADE           |
| rating     | INTEGER   | NOT NULL, CHECK (1 ≤ rating ≤ 5)                     |
| comment    | TEXT      | NOT NULL                                             |
| created_at | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                          |

---

### 6. Messages
Direct communication between users.

| Column       | Type      | Constraints                                                |
|--------------|-----------|------------------------------------------------------------|
| message_id   | UUID      | **PK**, Indexed                                            |
| sender_id    | UUID      | **FK → Users(user_id)**, ON DELETE CASCADE                 |
| recipient_id | UUID      | **FK → Users(user_id)**, ON DELETE CASCADE                 |
| message_body | TEXT      | NOT NULL                                                   |
| sent_at      | TIMESTAMP | DEFAULT `CURRENT_TIMESTAMP`                                |

---

##  Constraints Overview
- **Unique**: `Users.email`
- **Check**: Role, status, payment_method, rating range, booking dates
- **Foreign Keys**: All relationships enforce referential integrity with `ON DELETE CASCADE`

---

## Indexing
- Primary keys are indexed automatically.
- Additional indexes:
  - `Users.email`
  - `Properties.host_id`
  - `Bookings.property_id`, `Bookings.user_id`
  - `Payments.booking_id`

---

## Normalization
- **1NF**: No repeating groups (all values atomic).  
- **2NF**: All non-key attributes depend on the whole key (no partial dependencies).  
- **3NF**: No transitive dependencies .  

---

## Getting Started
1. Clone the repo
2. Run the SQL schema 

---
