# Booking Table Partitioning Report – ALX Airbnb Database

## Objective
Optimize query performance on the Booking table by implementing **range partitioning** on `start_date`.

---

## Partitioning Approach
- Created a **partitioned table `BookingPartitioned`**.
- Partitioned by **year** (`start_date`) to reduce scan size.
- Added indexes on `user_id` for each partition.

---

## Test Queries
1. Fetch all bookings in 2025  
2. Fetch bookings for a specific user in 2026  

- Used `EXPLAIN ANALYZE` to measure performance.

---

## Observations / Improvements
- Queries now **scan only relevant partitions**, not the entire table.
- Execution time for date range queries reduced significantly.
- Indexes on partitions further improved filtering by user.
- Overall: Partitioning + indexing reduced I/O and optimized query performance.

---

## Conclusion
Partitioning large tables by a high-cardinality column like `start_date` is highly effective for:
- Faster range queries
- Better scalability for large datasets
- Reduced query execution cost
