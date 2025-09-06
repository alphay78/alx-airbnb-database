# Query Optimization Report – ALX Airbnb Database

## Objective
Refactor complex queries to improve performance when retrieving bookings with user, property, and payment details.

---

## Initial Query
- Retrieved all columns from Booking, User, Property, and Payment.
- Joins:
  - INNER JOIN User on booking.user_id
  - INNER JOIN Property on booking.property_id
  - LEFT JOIN Payment on booking_id
- Performance analysis (`EXPLAIN ANALYZE`) showed:
  - Full table scans
  - High cost for sorting and joining
  - Slow execution on large datasets

---

## Optimization Steps
1. Reduced selected columns to only those required.
2. Used indexed columns (`user_id`, `property_id`, `booking_id`) for joins.
3. Kept LEFT JOIN only for optional table (Payment).
4. Added `ORDER BY b.start_date DESC` using indexed column to improve sorting speed.

---

## Refactored Query
- Fetches only necessary columns
- Uses indexes efficiently
- Reduced execution time significantly
- Maintains all required information for analysis

---

## Conclusion
- Optimized query reduces memory usage and execution time.
- Proper indexing and column selection is key for performance in complex joins.
