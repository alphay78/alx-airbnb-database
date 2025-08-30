Entities and Attributes

Users

Represents all users of the platform, including guests, hosts, and admins.

Attributes: user_id (PK), first_name, last_name, email (unique), password_hash, phone_number, role (guest, host, admin), created_at.

Properties

Represents properties listed by hosts.

Attributes: property_id (PK), host_id (FK to Users), name, description, location, pricepernight, created_at, updated_at.

Bookings

Represents bookings made by guests.

Attributes: booking_id (PK), property_id (FK to Properties), user_id (FK to Users), start_date, end_date, total_price, status (pending, confirmed, canceled), created_at.

Payments

Represents payments for bookings.

Attributes: payment_id (PK), booking_id (FK to Bookings), amount, payment_date, payment_method (credit_card, paypal, stripe).

Reviews

Represents reviews left by users for properties.

Attributes: review_id (PK), property_id (FK to Properties), user_id (FK to Users), rating (1-5), comment, created_at.

Messages

Represents messages exchanged between users.

Attributes: message_id (PK), sender_id (FK to Users), recipient_id (FK to Users), message_body, sent_at.

Relationships

User – Property: One host can list many properties (1-to-many).

User – Booking: One user can have many bookings (1-to-many).

Property – Booking: One property can have many bookings (1-to-many).

Booking – Payment: One booking can have one or more payments (1-to-many).

User – Review: One user can write many reviews (1-to-many).

Property – Review: One property can have many reviews (1-to-many).

User – Message: One user can send and receive many messages (1-to-many).

Notes

Primary keys (PK) are uniquely identifying each record in the entity.

Foreign keys (FK) represent relationships between tables.

Enums and constraints are applied to ensure data integrity.

The ER diagram was created using dbdiagram.io
