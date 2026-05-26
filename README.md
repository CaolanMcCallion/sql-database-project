# Ticketmaster-Inspired Event Ticketing System

## Overview

A normalized relational database system inspired by modern ticketing platforms such as Ticketmaster.

This project was designed to simulate the backend architecture of a scalable event booking platform, supporting user accounts, venue management, ticket purchasing, seat allocation, payment processing, and order tracking.

Developed as part of the CSC7052 Databases module during the MSc Software Development programme at Queen’s University Belfast.

---

## Features

- User registration and account management
- Event and venue management
- Performer and event category support
- Seat allocation and ticket selection
- Multiple ticket types (VIP, Standard, etc.)
- Order and multi-ticket purchase tracking
- Payment and billing data structure
- Event and venue policy management
- Fully normalized relational schema (3NF)

---

## Technologies & Concepts

- MySQL / PostgreSQL
- Relational Database Design
- SQL
- Database Normalization
- Entity Relationship Diagrams (ERDs)
- Data Integrity & Referential Constraints
- Security Concepts (hashing, salting, separated payment data)

---

## Database Structure

### Core Entities

- `customer_account`
- `profile`
- `event`
- `venue`
- `seat`
- `ticket`
- `ticket_type`
- `order`
- `order_item`
- `payment`
- `card_details`
- `policy`
- `performer`

---

## Security Considerations

- Passwords designed to be hashed and salted before storage
- Sensitive payment data separated into dedicated tables
- Structured to support future role-based access systems

---

## Normalization

The database schema was designed and refined through a full normalization process:

### First Normal Form (1NF)
- Atomic attributes
- No repeating groups

### Second Normal Form (2NF)
- Removed partial dependencies

### Third Normal Form (3NF)
- Removed transitive dependencies
- Refactored ticket pricing into `ticket_type`

---

## Scalability & Future Improvements

Potential future enhancements include:

- Temporary seat reservation system
- Dynamic pricing models
- Loyalty and rewards system
- External authentication/security integrations
- Cloud-hosted deployment
- Real-time ticket availability handling

---

## Design Goals

This project focused heavily on:

- Scalability
- Maintainability
- Data integrity
- Efficient querying
- Reduced redundancy
- Real-world ticketing workflows

---

## Setup

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/ticketmaster-ticketing-system.git
```

Import the SQL schema:

```bash
mysql -u your_user -p your_database < Ticketmaster.sql
```

---

## ERD Diagrams

The repository includes:
- Initial ERD planning diagrams
- Final normalized ERD structure

---

## Author

Caolan McCallion  
MSc Software Development — Queen’s University Belfast
