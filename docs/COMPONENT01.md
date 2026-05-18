# Component 01 - User Management

**Developer:** Athalsha R.R - IT25101874
**Branch:** User-Management---Athalsha-R-R
**Module:** SE1020 OOP Group Project - Tie The Tech (TTT) - SLIIT

---

## Overview
Couple registration, login, profile management and session-based authentication. Full CRUD via data/users.txt.

## Key Route
```
http://localhost:8080/register
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
src/main/java/com/ttt/component01/
  model/        Domain model hierarchy
  repository/   File-based persistence (java.io)
  controller/   Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component01/
  JSP view templates
```

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/register
```
