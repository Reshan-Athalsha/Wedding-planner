# Component 02 - Vendor Management

**Developer:** Rathnayake R.M.G.C.B.B - IT25103963
**Branch:** Vendor-Management-Rathnayake-R.M.G.C.B.B
**Module:** SE1020 OOP Group Project - Tie The Tech (TTT) - SLIIT

---

## Overview
Wedding vendors across Venue, Catering and Photography categories. Polymorphic hierarchy, ratings and category filtering.

## Key Route
```
http://localhost:8080/vendors
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
src/main/java/com/ttt/component02/
  model/        Domain model hierarchy
  repository/   File-based persistence (java.io)
  controller/   Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component02/
  JSP view templates
```

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/vendors
```
