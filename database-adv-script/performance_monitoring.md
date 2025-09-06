# Database Performance Monitoring & Refinement – ALX Airbnb Database

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Queries Monitored
We selected frequently used queries:

### Query 1: Fetch all bookings with user and property details
```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed'
AND b.start_date >= '2025-01-01';
