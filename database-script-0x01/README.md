# Airbnb Database Schema

This folder contains the SQL DDL for the Airbnb database, defining all tables, constraints, and indexes.

## Tables

### Users
Stores user information including guests, hosts, and admins.  
- Primary Key: `user_id` (UUID)  
- Unique constraint on `email`  
- Role can be `guest`, `host`, or `admin`

### Properties
Stores details of properties listed by hosts.  
- Primary Key: `property_id` (UUID)  
- Foreign Key: `host_id` references `users(user_id)`  

### Bookings
Stores booking information made by users.  
- Primary Key: `booking_id` (UUID)  
- Foreign Keys: `property_id` references `properties(property_id)`, `user_id` references `users(user_id)`  
- Status can be `pending`, `confirmed`, or `canceled`

### Payments
Stores payment transactions.  
- Primary Key: `payment_id` (UUID)  
- Foreign Key: `booking_id` references `bookings(booking_id)`  
- Payment method can be `credit_card`, `paypal`, or `stripe`

### Reviews
Stores reviews by users for properties.  
- Primary Key: `review_id` (UUID)  
- Foreign Keys: `property_id` and `user_id`  

### Messages
Stores messages sent between users.  
- Primary Key: `message_id` (UUID)  
- Foreign Keys: `sender_id` and `recipient_id`  

## Indexes
Indexes are created on frequently queried fields to improve performance, such as:
- `email` in `users`
- `property_id` in `properties` and `bookings`
- `booking_id` in `bookings` and `payments`
- Foreign key columns in other tables
