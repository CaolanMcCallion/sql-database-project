# Ticketmaster-Inspired Event Ticketing System

## Overview
This project is a fully functional, normalized relational database designed to simulate the backend of a modern event ticketing platform, inspired by Ticketmaster. It handles user registration, event and venue management, seat selection, secure payments, and more. Developed as part of the CSC7052 Databases module, it adheres to best practices in database design, normalization, and scalability planning.

## Key Features
- Secure user registration and login with password hashing and salting  
- Event and venue management, including performers and categories  
- Seat selection per venue with different ticket types (e.g., VIP, Standard)  
- Robust ticketing system with order tracking and multi-ticket purchases  
- Payment processing with associated billing details and card information  
- Policy management for event-specific and venue-wide rules  
- Fully normalized to Third Normal Form (3NF)  

## Technologies
- **DBMS:** MySQL / PostgreSQL (conceptually DBMS-agnostic)  
- **Design Tool:** ERD design via draw.io / Lucidchart  
- **Security Concepts:** Password hashing, salting, and data protection  

## Database Structure

**Key Entities:**
- `customer_account`
- `profile`
- `event`
- `venue`
- `seat`
- `ticket`
- `ticket_type`
- `order` / `order_item`
- `payment`
- `card_details`
- `policy`
- `performer`

## ERD Snapshots
- **Initial ERD:** Broad planning view with all possible entities  
- **Final ERD:** Streamlined schema with added ticket types and normalized order structure  

## Security Measures
- Passwords are hashed and salted before storage  
- Sensitive card information is stored in a separate `card_details` table  
- Schema allows for role-based expansion and access level management  

## Normalization Process
- **1NF:** Atomic attributes, no repeating groups  
- **2NF:** No partial dependencies on composite keys  
- **3NF:** Removed transitive dependencies (e.g., moved `ticket_price` to `ticket_type`)  

## Scalability & Future Improvements
- Temporary seat reservations during checkout  
- Demand-based dynamic pricing  
- Loyalty and rewards program  
- Integration with external security tools (e.g., AWS Secrets Manager)  

## Design Philosophy
- Emphasis on data integrity, readability, and extensibility  
- Structured for efficient querying and minimal redundancy  
- Built with future enhancements and real-world use cases in mind  

## How to Use
1. Clone the repository  
2. Import the SQL schema into your local MySQL or PostgreSQL instance  
```bash
mysql -u your_user -p your_database < Ticketmaster.sql
```

## Author
Caolan McCallion — Created as part of the MSc Software Development course at Queen’s University Belfast
