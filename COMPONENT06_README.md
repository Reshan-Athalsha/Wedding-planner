# Component 06 — Admin Dashboard & Analytics
### Contributor: Bandara P.M.D.C | SE1020 OOP Project — Tie The Tech (TTT)

---

## Overview
This component implements the **Admin Dashboard & Analytics** module of the TTT Wedding Planning System.  
It provides administrators with a centralised view of all system data — users, vendors, bookings, payments, and reviews — with live statistics and reporting.

---

## OOP Concepts Demonstrated

| Principle | Implementation |
|---|---|
| **Encapsulation** | Dashboard stats are computed and exposed through private methods |
| **Polymorphism** | Admin accesses all component repositories through uniform `findAll()` calls |
| **Abstraction** | `AdminController` aggregates cross-component data without exposing internal file logic |
| **Information Hiding** | Each repository hides its file I/O behind its own class interface |
| **Composition** | `AdminController` is composed of 5 separate repository instances |

---

## Files

```
component06/
└── controller/
    └── AdminController.java  ← Cross-component dashboard controller
```

---

## Dashboard Features

| Section | Description |
|---|---|
| **System Overview** | Total users, vendors, bookings, payments, reviews |
| **Recent Users** | Latest 5 registered couple accounts |
| **Recent Bookings** | Latest 5 bookings in the system |
| **Vendor Breakdown** | All vendors with category and location |
| **Payment Summary** | All payments with amounts and status |
| **Review Feed** | Latest reviews with star ratings |

---

## Endpoints

| Method | Endpoint | Description |
|---|---|---|
| **GET** | `/admin` | Main admin dashboard |
| **GET** | `/admin/users` | Full user list management |
| **GET** | `/admin/vendors` | Full vendor list |
| **GET** | `/admin/bookings` | All bookings |
| **GET** | `/admin/reviews` | All reviews |

---

## Data Sources
Admin reads live data from all component repositories:
- `data/users.txt` — Component 01
- `data/vendors.txt` — Component 02
- `data/bookings.txt` — Component 03
- `data/payments.txt` — Component 03
- `data/reviews.txt` — Component 05

No database — pure file-based reads.

---

## How to Run
```bash
cd Wedding-planner
mvn spring-boot:run
# Navigate to http://localhost:8080/admin
```
