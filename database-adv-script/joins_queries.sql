-- =====================================================
-- File: joins_queries.sql
-- Project: Unleashing Advanced Querying Power
-- Repository: alx-airbnb-database
-- Directory: database-adv-script
-- =====================================================
-- This file contains SQL queries demonstrating the use of
-- INNER JOIN, LEFT JOIN, and FULL OUTER JOIN on an Airbnb-style schema.
-- =====================================================


-- =====================================================
-- 1. INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings.
-- =====================================================
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;


-- =====================================================
-- 2. LEFT JOIN
-- Retrieve all properties and their reviews, including properties that have no reviews.
-- =====================================================
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id
ORDER BY p.property_id, r.created_at;  -- ✅ Added ORDER BY


-- =====================================================
-- 3. FULL OUTER JOIN
-- Retrieve all users and all bookings, even if the user has no booking
-- or a booking is not linked to a user.
-- Note:
--   - PostgreSQL supports FULL OUTER JOIN directly.
--   - MySQL does not support FULL OUTER JOIN; use UNION of LEFT + RIGHT JOIN.
-- =====================================================

-- PostgreSQL version
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;


-- MySQL version (alternative using UNION)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM User u
RIGHT JOIN Booking b ON u.user_id = b.user_id;
