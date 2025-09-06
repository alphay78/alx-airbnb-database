# Index Performance Report – ALX Airbnb Database

## Objective
To improve query performance by creating indexes on frequently queried columns in User, Booking, and Property tables.

## Indexes Implemented
- User: `email`, `user_id`
- Booking: `user_id`, `property_id`, `start_date`, `status`
- Property: `location`, `price_per_night`, `host_id`

## Performance Testing
- Queries were analyzed using `EXPLAIN ANALYZE` before and after indexing.
- Observations:
  - Queries involving JOINs and WHERE clauses improved from **full table scans to index scans**.
  - ORDER BY queries on properties became faster.

## Conclusion
Indexing significantly reduced query cost and execution time.
