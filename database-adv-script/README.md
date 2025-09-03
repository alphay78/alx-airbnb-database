# SQL Joins Queries

This directory contains SQL scripts demonstrating the use of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN on an Airbnb-style database schema.

## Queries

### 1. INNER JOIN
Retrieves all bookings and the respective users who made those bookings.

### 2. LEFT JOIN
Retrieves all properties and their reviews, including properties that have no reviews.

### 3. FULL OUTER JOIN
Retrieves all users and all bookings, even if the user has no booking or a booking is not linked to a user.
- PostgreSQL: Uses FULL OUTER JOIN directly.
- MySQL: Uses a UNION of LEFT JOIN and RIGHT JOIN to simulate FULL OUTER JOIN.
