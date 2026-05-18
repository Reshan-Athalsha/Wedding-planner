# Component 06 - Admin Dashboard and Analytics

**Developer:** Bandara P.M.D.C - IT25XXXXXX
**Branch:** Admin-Dashboard-and-Analytics-Bandara.P.M.D.C
**Module:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## Overview
System-wide dashboard providing analytics across all 6 components. Shows total users, vendors, bookings, payments, reviews and planning tasks. Aggregates data from all repositories.

## Key Routes
- Admin Dashboard: http://localhost:8080/admin
- OOP Overview: http://localhost:8080/oop

## OOP Principles
| Principle | How Applied |
|---|---|
| Abstraction | AdminController aggregates via repository abstractions |
| Encapsulation | All component data hidden behind repository interfaces |
| Polymorphism | Dashboard renders any Review/Vendor/Booking subtype |
| Information Hiding | Controller never reads files directly |

## My Files
```
com/ttt/component06/
  controller/  AdminController.java

src/main/webapp/WEB-INF/jsp/component06/
  adminDashboard.jsp
```

## Run
```bash
mvn spring-boot:run
# Open: http://localhost:8080/admin
```
