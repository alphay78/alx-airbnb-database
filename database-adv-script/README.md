# Advanced SQL Joins – Airbnb Database

This project is part of the **ALX Airbnb Database Module**, focusing on mastering complex SQL queries and performance optimization.  
In this task, we implement different types of SQL joins on an Airbnb-style schema to demonstrate practical data retrieval techniques.

---

## 📖 Overview
Relational databases often require combining data across multiple tables.  
In real-world applications like Airbnb, queries must efficiently connect **users, bookings, properties, and reviews** to extract meaningful insights.  

This script demonstrates:
- `INNER JOIN` → retrieving only matching records.  
- `LEFT JOIN` → ensuring all records from one table appear, even if unmatched.  
- `FULL OUTER JOIN` → retrieving all records from both sides, regardless of matches.  

---

## 📂 Files
- **joins_queries.sql** – SQL script containing the join queries.  
- **README.md** – Documentation of the task and explanations of each query.  

---

## 🗄️ Database Schema (Simplified)
Key entities and their relationships:
- **User** (`user_id`, `first_name`, `last_name`, `email`, …)  
- **Property** (`property_id`, `host_id`, `name`, `location`, …)  
- **Booking** (`booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, …)  
- **Review** (`review_id`, `property_id`, `user_id`, `rating`, `comment`, …)  

---

## 📝 Queries Implemented

### 1. INNER JOIN
Retrieve all bookings and the respective users who made those bookings.  
```sql
SELECT b.booking_id, b.property_id, b.start_date, b.end_date, u.user_id, u.first_name, u.last_name, u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
