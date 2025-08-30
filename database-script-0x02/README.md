# Airbnb Sample Data (Ethiopian Context)

This folder contains SQL scripts to populate the Airbnb database with realistic Ethiopian sample data.

## Seed Data

### Users
- 10 users including guests, hosts, and an admin with Ethiopian names.
- Emails are unique, and UUIDs are used as primary keys.

### Properties
- 5 properties hosted by Ethiopian hosts.
- Cities include Addis Ababa, Bahir Dar, Gonder, and Lalibela.

### Bookings
- 7 bookings covering different properties and users.
- Status can be `confirmed` or `pending`.
- Total price calculated based on nights * price per night.

### Payments
- Payments linked to bookings.
- Payment methods include `credit_card`, `paypal`, and `stripe`.

### Reviews
- 5 reviews with ratings 1-5 and comments.

### Messages
- Messages exchanged between users for inquiries.
