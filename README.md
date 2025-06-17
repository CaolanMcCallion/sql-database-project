Ticketmaster-Inspired Event Ticketing System (Database Project)

Overview
This project is a fully functional, normalized relational database designed to simulate the backend of a modern event ticketing platform, inspired by Ticketmaster. It handles user registration, event and venue management, seat selection, secure payments, and more. Developed as part of the CSC7052 Databases module, it adheres to best practices in database design, normalization, and scalability planning.

Key Features
Secure user registration and login with password hashing & salting

Event and venue management, including performers and categories

Seat selection per venue with different ticket types (e.g., VIP, Standard)

Robust ticketing system with order tracking and multi-ticket purchases

Payment processing with associated billing details and card info

Policy management for event-specific and venue-wide rules

Fully normalized to Third Normal Form (3NF)

Technologies
DBMS: MySQL / PostgreSQL (conceptually DBMS-agnostic)

Design Tool: ERD design via draw.io / Lucidchart

Security Concepts: Password hashing, salting, and data protection

Database Structure
Key Entities:
customer_account

profile

event

venue

seat

ticket

ticket_type

order / order_item

payment

card_details

policy

performer

ERD Snapshots:
Initial ERD: Broad planning view with all possible entities

Final ERD: Streamlined schema with added ticket types and normalized order structure

Security Measures
Passwords are hashed and salted before storage

Sensitive card information is stored in a separate card_details table

Role-based expansion potential for different access levels

Normalization Process
1NF: Atomic attributes and no repeating groups

2NF: No partial dependencies on composite keys

3NF: Removed transitive dependencies (e.g., ticket_price moved to ticket_type)

Scalability & Future Improvements
Temporary seat reservations during checkout

Dynamic pricing models (e.g., demand-based)

Loyalty & rewards program

Integration with external services like AWS Secrets Manager for real-world security

Design Philosophy
Emphasis on data integrity, readability, and extensibility

Structured for query efficiency and low redundancy

Built with future enhancements and scalability in mind

How to Use
Clone the repo

Import the SQL schema to your local MySQL/PostgreSQL instance

mysql -u your_user -p your_database < Ticketmaster.sql


Run test queries or integrate into a mock backend

Let me know if you'd like a SQL schema.sql file or ER diagram version prepared for uploading too.













Research


