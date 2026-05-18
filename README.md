# Component 05 - Reviews and Rating System

**Developer:** Rupasinghe S.L.S - IT25XXXXXX
**Branch:** Reviews-and-Rating-System-Rupasinghe.S.L.S
**Module:** SE1020 OOP Group Project - Tie The Tech (TTT) Wedding Planning System - SLIIT

---

## Overview
Public and verified vendor reviews with 1-5 star ratings. VerifiedReview and PublicReview subclasses show inheritance at runtime.

## Key Route
http://localhost:8080/reviews

## OOP Principles

| Principle | Implementation |
|---|---|
| Abstraction | Abstract base class defines the domain model contract |
| Inheritance | Concrete subclass(es) extend the abstract base class |
| Encapsulation | All fields private with public getters/setters |
| Polymorphism | Controller handles model subtypes via parent reference |
| Information Hiding | Repository hides all file I/O from the controller layer |

## Component Files
```
src/main/java/com/ttt/component05/
  model/         Domain model class hierarchy (OOP)
  repository/    File-based persistence (java.io, no database)
  controller/    Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component05/
  JSP view templates
```

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/reviews
```
