-- =====================================================
-- File: perfomance.sql
-- Project: ALX Airbnb Database Module
-- Purpose: Optimize complex queries for performance
-- =====================================================

-- =====================================================
-- 1. Initial Complex Query (with WHERE and AND)
-- Retrieve all bookings with user, property, and payment details
-- =====================================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
AND b.start_date >= '2025-01-01';

-- =====================================================
-- 2. Performance Analysis
-- Use EXPLAIN ANALYZE to identify inefficiencies
-- =====================================================
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
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
AND b.start_date >= '2025-01-01';

-- =====================================================
-- 3. Optimized Query
-- Reduced columns and used indexed joins for better performance
-- =====================================================
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
    p.name AS property_name,
    pay.payment_id,
    pay.amount AS payment_amount
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
AND b.start_date >= '2025-01-01'
ORDER BY b.start_date DESC;
