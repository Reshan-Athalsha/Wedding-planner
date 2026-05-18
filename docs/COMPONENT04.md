# Component 04 - Wedding Planning Tools

**Developer:** Ediriweera V.S - IT25XXXXXX
**Branch:** Wedding-Planning-tools-Ediriweera.V.S
**Module:** SE1020 OOP Group Project - Tie The Tech (TTT) - SLIIT

---

## Overview
Task checklist, budget tracker, and guest list. Three repositories, one controller, full CRUD for all planning data.

## Key Route
```
http://localhost:8080/planning
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
src/main/java/com/ttt/component04/
  model/        Domain model hierarchy
  repository/   File-based persistence (java.io)
  controller/   Spring MVC @Controller

src/main/webapp/WEB-INF/jsp/component04/
  JSP view templates
```

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/planning
```
