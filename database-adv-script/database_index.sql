-- =====================================================
-- File: database_index.sql
-- Project: ALX Airbnb Database Module
-- Purpose: Implement indexes to improve query performance
-- =====================================================

-- =====================================================
-- 1. Index Creation
-- Identify high-usage columns in User, Booking, and Property
-- =====================================================

-- User table indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Property table indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- =====================================================
-- 2. Performance Measurement
-- Run EXPLAIN / ANALYZE before and after indexes
-- =====================================================

-- Example: Query joining users and bookings
EXPLAIN ANALYZE
SELECT 
    b.booking_id, 
    b.property_id, 
    b.start_date, 
    b.end_date, 
    u.user_id, 
    u.first_name, 
    u.last_name
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
WHERE b.status = 'confirmed';

-- Example: Query retrieving properties and reviews
EXPLAIN ANALYZE
SELECT 
    p.property_id, 
    p.name, 
    p.location, 
    r.rating
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.property_id, r.created_at;

-- Example: Query filtering bookings by date
EXPLAIN ANALYZE
SELECT booking_id, property_id, user_id
FROM Booking
WHERE start_date >= '2025-01-01' AND status = 'confirmed';
