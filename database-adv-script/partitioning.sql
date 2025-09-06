-- =====================================================
-- File: partitioning.sql
-- Project: ALX Airbnb Database Module
-- Purpose: Implement table partitioning for Booking table
-- =====================================================

-- 1. Create a new partitioned table for Booking
CREATE TABLE BookingPartitioned (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    total_price NUMERIC(10,2)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions by year
CREATE TABLE Booking_2025 PARTITION OF BookingPartitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_2026 PARTITION OF BookingPartitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

CREATE TABLE Booking_2027 PARTITION OF BookingPartitioned
    FOR VALUES FROM ('2027-01-01') TO ('2028-01-01');

-- 3. Optional: create indexes on each partition for faster queries
CREATE INDEX idx_booking_2025_user ON Booking_2025(user_id);
CREATE INDEX idx_booking_2026_user ON Booking_2026(user_id);
CREATE INDEX idx_booking_2027_user ON Booking_2027(user_id);

-- 4. Test queries on partitioned table
-- Example: Fetch bookings in 2025
EXPLAIN ANALYZE
SELECT *
FROM BookingPartitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Example: Fetch bookings for a specific user in 2026
EXPLAIN ANALYZE
SELECT *
FROM BookingPartitioned
WHERE start_date BETWEEN '2026-01-01' AND '2026-12-31'
AND user_id = 123;
