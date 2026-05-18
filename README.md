# Component 06 â€” Admin Dashboard and Analytics

**Developer:** Bandara P.M.D.C â€” IT25XXXXXX
**Branch:** `Admin-Dashboard-and-Analytics-Bandara.P.M.D.C`
**Module:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## Overview

System-wide dashboard showing counts across all components. Admin analytics: total revenue, confirmed bookings, review averages.

## Key Route

`http://localhost:8080/admin`

## OOP Principles

| Principle | How Applied |
|---|---|
| Abstraction | Abstract base class defines the model contract |
| Inheritance | Concrete class(es) extend the abstract base |
| Encapsulation | All fields private with public getters/setters |
| Polymorphism | Controller handles subtypes through parent reference |
| Information Hiding | Repository hides file I/O details from controller |

## My Files

```
src/main/java/com/ttt/component06/
  model/        Domain model classes
  repository/   File-based persistence (java.io, no database)
  controller/   Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component06/
  JSP view templates for this component
```

## Run the App

```bash
mvn spring-boot:run
# Open browser: http://localhost:8080/admin
```
