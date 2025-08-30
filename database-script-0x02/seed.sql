-- Airbnb Sample Data (Ethiopian Context)
-- File: seed.sql

-- Users (10 sample users)
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Abebe', 'Bekele', 'abebe@example.com', 'hash1', '0912345678', 'guest'),
(UUID(), 'Selam', 'Tesfaye', 'selam@example.com', 'hash2', '0923456789', 'host'),
(UUID(), 'Mekdes', 'Kebede', 'mekdes@example.com', 'hash3', '0934567890', 'guest'),
(UUID(), 'Tadesse', 'Alemu', 'tadesse@example.com', 'hash4', '0945678901', 'admin'),
(UUID(), 'Fikirte', 'Haile', 'fikirte@example.com', 'hash5', '0956789012', 'guest'),
(UUID(), 'Yared', 'Mekonnen', 'yared@example.com', 'hash6', '0967890123', 'host'),
(UUID(), 'Genet', 'Abdisa', 'genet@example.com', 'hash7', '0978901234', 'guest'),
(UUID(), 'Daniel', 'Hailu', 'daniel@example.com', 'hash8', '0989012345', 'host'),
(UUID(), 'Lily', 'Amanuel', 'lily@example.com', 'hash9', '0910123456', 'guest'),
(UUID(), 'Kebede', 'Tesfahun', 'kebede@example.com', 'hash10', '0921234567', 'guest');

-- Properties (5 properties hosted by hosts)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM users WHERE first_name='Selam'), 'Cozy Apartment', 'A comfortable apartment in city center', 'Addis Ababa', 50.00),
(UUID(), (SELECT user_id FROM users WHERE first_name='Selam'), 'Lakeview Villa', 'Spacious villa overlooking Lake Tana', 'Bahir Dar', 150.00),
(UUID(), (SELECT user_id FROM users WHERE first_name='Yared'), 'Modern Studio', 'Bright studio apartment', 'Addis Ababa', 40.00),
(UUID(), (SELECT user_id FROM users WHERE first_name='Daniel'), 'Historic House', 'Traditional house in Gonder old town', 'Gonder', 80.00),
(UUID(), (SELECT user_id FROM users WHERE first_name='Daniel'), 'Mountain Cabin', 'Cozy cabin in Lalibela', 'Lalibela', 120.00);

-- Bookings (7 bookings)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM properties WHERE name='Cozy Apartment'), (SELECT user_id FROM users WHERE first_name='Abebe'), '2025-09-01', '2025-09-05', 200.00, 'confirmed'),
(UUID(), (SELECT property_id FROM properties WHERE name='Lakeview Villa'), (SELECT user_id FROM users WHERE first_name='Mekdes'), '2025-10-10', '2025-10-15', 750.00, 'pending'),
(UUID(), (SELECT property_id FROM properties WHERE name='Modern Studio'), (SELECT user_id FROM users WHERE first_name='Fikirte'), '2025-09-20', '2025-09-22', 80.00, 'confirmed'),
(UUID(), (SELECT property_id FROM properties WHERE name='Historic House'), (SELECT user_id FROM users WHERE first_name='Genet'), '2025-11-01', '2025-11-03', 160.00, 'confirmed'),
(UUID(), (SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE first_name='Lily'), '2025-12-05', '2025-12-10', 600.00, 'pending'),
(UUID(), (SELECT property_id FROM properties WHERE name='Lakeview Villa'), (SELECT user_id FROM users WHERE first_name='Abebe'), '2025-11-15', '2025-11-20', 750.00, 'confirmed'),
(UUID(), (SELECT property_id FROM properties WHERE name='Modern Studio'), (SELECT user_id FROM users WHERE first_name='Kebede'), '2025-09-25', '2025-09-28', 120.00, 'pending');

-- Payments (7 payments)
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=200.00), 200.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=750.00 AND status='pending'), 750.00, 'paypal'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=80.00), 80.00, 'stripe'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=160.00), 160.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=600.00), 600.00, 'paypal'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=750.00 AND status='confirmed'), 750.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM bookings WHERE total_price=120.00), 120.00, 'stripe');

-- Reviews (5 reviews)
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM properties WHERE name='Cozy Apartment'), (SELECT user_id FROM users WHERE first_name='Abebe'), 5, 'Very comfortable stay!'),
(UUID(), (SELECT property_id FROM properties WHERE name='Lakeview Villa'), (SELECT user_id FROM users WHERE first_name='Mekdes'), 4, 'Amazing view and nice service.'),
(UUID(), (SELECT property_id FROM properties WHERE name='Modern Studio'), (SELECT user_id FROM users WHERE first_name='Fikirte'), 5, 'Clean and cozy studio.'),
(UUID(), (SELECT property_id FROM properties WHERE name='Historic House'), (SELECT user_id FROM users WHERE first_name='Genet'), 4, 'Loved the traditional design.'),
(UUID(), (SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE first_name='Lily'), 5, 'Perfect for a weekend getaway.');

-- Messages (6 messages)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM users WHERE first_name='Abebe'), (SELECT user_id FROM users WHERE first_name='Selam'), 'Hi Selam, is the Cozy Apartment available in September?'),
(UUID(), (SELECT user_id FROM users WHERE first_name='Selam'), (SELECT user_id FROM users WHERE first_name='Abebe'), 'Yes, it is available!'),
(UUID(), (SELECT user_id FROM users WHERE first_name='Mekdes'), (SELECT user_id FROM users WHERE first_name='Selam'), 'I am interested in the Lakeview Villa in October.'),
(UUID(), (SELECT user_id FROM users WHERE first_name='Abebe'), (SELECT user_id FROM users WHERE first_name='Daniel'), 'Hi Daniel, can I book the Mountain Cabin for December?'),
(UUID(), (SELECT user_id FROM users WHERE first_name='Daniel'), (SELECT user_id FROM users WHERE first_name='Abebe'), 'Sure! The cabin is available.'),
(UUID(), (SELECT user_id FROM users WHERE first_name='Fikirte'), (SELECT user_id FROM users WHERE first_name='Yared'), 'Is the Modern Studio still available?');
