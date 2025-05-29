# Banking System Database Project

This project was developed as part of a database course. It models a banking system with core features like customer management, account operations, transactions, loans, and ATM usage.

---

## Contents

- `Final_Project.sql` – Full SQL code with schema creation and data population
- `Project-part1-2495184.pdf` – Formal report including ER diagrams, database schema, and feature descriptions
- `diagrams/` – ER diagrams (Lucidchart and pgAdmin versions)
- `notes/RelationshipDesignNotes.docx` – Early design thinking and planning

---

## Database Overview

The schema includes the following entities:

- **Customers**: personal info, contact details
- **Accounts**: linked to customers and branches
- **Transactions**: deposits and withdrawals
- **Loans**: linked to both customers and branches
- **Branches**: bank locations
- **ATM Usage**: tracks ATM transactions

### Relationships

- One customer can have many accounts and loans
- One account can have many transactions
- Branches are linked to accounts and loans
- Transactions occur via specific ATMs

---

## Functionalities (Sample)

The database supports at least 20 operations, including:

### CRUD Operations
1. Add/view/update/delete a customer  
2. Open or close an account  
3. Record or remove transactions  
4. Manage loans and their interest rates  

### Reports & Queries
5. View all customers in a city  
6. Generate a loan summary per client  
7. Show ATM usage frequency by city  
8. Display net worth per customer  
9. List transactions during a given year  
10. Find customers with highest loan balances  

Full list available in the PDF report.

---

## Tech Stack

- PostgreSQL
- pgAdmin and Lucidchart (for ERDs)
- Manual testing via query scripts

---

## Notes

This is a portfolio project using **fake data**. No real customer or financial information is included.

