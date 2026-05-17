# Component 05 — Reviews & Rating System
### Contributor: Rupasinghe S.L.S | SE1020 OOP Project — Tie The Tech (TTT)

---

## Overview
This component implements the **Reviews & Rating System** for the TTT Wedding Planning System.  
It enables couples to submit, view, and manage reviews for vendors, with an automatic star-rating calculation.

---

## OOP Concepts Demonstrated

| Principle | Implementation |
|---|---|
| **Abstraction** | `Review` is an abstract class — cannot be instantiated directly |
| **Inheritance** | `VerifiedReview` and `PublicReview` both extend `Review` |
| **Polymorphism** | `toFileString()` overridden in each subclass |
| **Encapsulation** | All fields are `private` with public getters/setters |
| **Information Hiding** | File I/O logic is private inside `ReviewRepository` |

---

## Files

```
component05/
├── model/
│   ├── Review.java          ← Abstract base class (Abstraction)
│   ├── VerifiedReview.java  ← Subclass for verified purchasers (Inheritance)
│   └── PublicReview.java    ← Subclass for public reviewers (Inheritance)
├── repository/
│   └── ReviewRepository.java ← File-based CRUD using java.io
└── controller/
    └── ReviewController.java ← Spring MVC controller (full CRUD)
```

---

## CRUD Operations

| Operation | Endpoint | Description |
|---|---|---|
| **Create** | `POST /reviews/submit` | Submit a new vendor review |
| **Read** | `GET /reviews` | View all reviews |
| **Read** | `GET /reviews/vendor/{vendorId}` | View reviews for specific vendor |
| **Update** | `POST /reviews/update/{id}` | Edit an existing review |
| **Delete** | `POST /reviews/delete/{id}` | Remove a review |

---

## Data Persistence
- Reviews are stored in `data/reviews.txt` using pipe-delimited format
- No database used — pure `java.io` file operations
- Format: `reviewId|vendorId|userName|rating|comment|reviewType|date`

---

## How to Run
```bash
cd Wedding-planner
mvn spring-boot:run
# Navigate to http://localhost:8080/reviews
```
