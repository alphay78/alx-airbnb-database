# Airbnb Database Normalization

## Objective
The objective of this document is to explain how the Airbnb database design has been normalized to ensure data integrity and reduce redundancy, achieving **Third Normal Form (3NF)**.

---

## Normalization Steps

### 1. First Normal Form (1NF)
- All tables have **atomic attributes**; each column holds a single value.
- No repeating groups or arrays are stored in a single column.

**Example:**
- `users.email` stores one email per user.
- `bookings.start_date` and `bookings.end_date` store single dates per booking.

---

### 2. Second Normal Form (2NF)
- Database is already in **1NF**.
- All non-key attributes are **fully functionally dependent** on the primary key.

**Example:**
- In `properties`, attributes like `name`, `description`, `location`, and `price_per_night` depend entirely on `property_id`.
- In `bookings`, attributes like `start_date`, `end_date`, `total_price`, and `status` depend entirely on `booking_id`.

---

### 3. Third Normal Form (3NF)
- Database is already in **2NF**.
- All non-key attributes depend **only on the primary key** (no transitive dependencies).

**Example:**
- `users.role` depends only on `user_id`, not indirectly through another attribute.
- `payments.amount` depends only on `payment_id`.
- No redundant storage exists:
  - Host details are stored only in `users`, not repeated in `properties`.
  - `booking.total_price` could be derived from `price_per_night * number_of_nights`, but storing it ensures query efficiency without violating 3NF.

---

## Entity-by-Entity Overview

| Table      | Normalization Notes |
|------------|-------------------|
| Users      | Attributes depend solely on `user_id`. |
| Properties | Attributes depend solely on `property_id`. Foreign key `host_id` links to Users. |
| Bookings   | Attributes depend solely on `booking_id`. FKs `property_id` and `user_id` link to related entities. |
| Payments   | Attributes depend solely on `payment_id`. FK `booking_id` ensures link to Booking. |
| Reviews    | Attributes depend solely on `review_id`. FKs `property_id` and `user_id` ensure proper relationships. |
| Messages   | Attributes depend solely on `message_id`. FKs `sender_id` and `recipient_id` link to Users. |

---

## Conclusion
- The database design is normalized to **3NF**, ensuring minimal redundancy and maintaining data integrity.
- Relationships between entities are handled using **foreign keys**, ensuring consistency and proper linkage.
- This normalized schema supports **efficient querying** and maintains flexibility for future expansion.
