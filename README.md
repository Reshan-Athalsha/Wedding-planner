# Component 06 - Admin Dashboard and Analytics

**Developer:** Bandara P.M.D.C - IT25XXXXXX
**Branch:** Admin-Dashboard-and-Analytics-Bandara.P.M.D.C
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Provides a system-wide admin dashboard that reads data from
all 6 component repositories to display live analytics:
total users, vendors, bookings, payments, reviews, guests,
confirmed booking count, total revenue, and average ratings.

## Routes
| Action | Route |
|---|---|
| Admin Dashboard | GET /admin |
| OOP Overview | GET /oop |

## My Files
```
src/main/java/com/ttt/component06/
  controller/
    AdminController.java   (aggregates all repositories)

src/main/webapp/WEB-INF/jsp/component06/
  adminDashboard.jsp
```

## OOP Principles
- **Abstraction**: Uses repository abstractions from all components
- **Encapsulation**: Each component's data accessed only via its repository
- **Information Hiding**: AdminController never reads files directly
- **Polymorphism**: Renders heterogeneous lists (vendors, reviews) via parent types

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/admin
```
