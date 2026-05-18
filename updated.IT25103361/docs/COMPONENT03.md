# Component 03 - Booking and Payment

**Developer:** Perera M.A.L.A - IT25XXXXXX
**Branch:** Booking-and-Payment-Management-Perera.M.A.L.A
**Module:** SE1020 OOP Group Project - Tie The Tech (TTT) - SLIIT

---

## Overview
Event bookings link vendors to couples. Payment confirms booking status. CRUD via data/bookings.txt and payments.txt.

## Key Route
```
http://localhost:8080/bookings
```

## OOP Principles

| Principle | Implementation |
|---|---|
| Abstraction | Abstract base class defines the domain model contract |
| Inheritance | Concrete subclass extends the abstract base |
| Encapsulation | Private fields with public getters/setters |
| Polymorphism | Controller handles subtypes via parent reference |
| Information Hiding | Repository hides all file I/O from the controller |

## My Files
```
src/main/java/com/ttt/component03/
  model/        Domain model hierarchy
  repository/   File-based persistence (java.io)
  controller/   Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component03/
  JSP view templates
```

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/bookings
```
