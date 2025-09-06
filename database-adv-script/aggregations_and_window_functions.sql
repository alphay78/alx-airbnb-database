-- =====================================================
-- File: aggregations_and_window_functions.sql
-- Project: ALX Airbnb Database Module
-- Purpose: Demonstrate SQL aggregations and window functions
-- =====================================================

-- =====================================================
-- 1. Total Number of Bookings Per User
-- Objective: Count all bookings made by each user
-- =====================================================
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- =====================================================
-- 2. Rank Properties Based on Total Bookings
-- Objective: Rank properties by how many bookings they have received
-- =====================================================
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
