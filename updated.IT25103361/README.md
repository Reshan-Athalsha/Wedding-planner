# Component 06 - Admin & System Dashboard

**Developer:** Bandara P.M.D.C - IT25103361
**Branch:** IT25103361-Admin-DashboardAnalytic
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Serves as the central administrative hub for the entire wedding planning system. It acts as an orchestrator that pulls together high-level metrics across all modules while staying structurally decoupled.

  **System-Wide Analytics:** Reads raw data files across components dynamically to present global       system statistics (Users, Vendors, Bookings, Payments, Reviews, and Tasks).

  **Admin Account Management:** Full administrative CRUD operations enabling the system to scale         with layered operational responsibilities.

  **Global Announcements Board:** Allows administrators to post and broadcast real-time system           notices, which are written directly to file-based storage

## Routes
**Dashboard & Announcements**
| Action | Route |
|---|---|
| View Dashboard | GET /admin/admins |
| Post Announcement | POST /admin/announcements/new |
| Delete Announcement| GET /admin/announcements/delete/{id} |

**Administrator Management**
| Action | Route |
|---|---|
| List All Admins | GET /admin/admins |
| Add Admin | POST /admin/admins/new |
| Remove Admin| GET /admin/admins/delete/{id} |

## My Files
```
src/main/java/com/ttt/component06/
  model/
    Admin.java                (Abstract Base Class utilizing shared FileOperations)
    SuperAdmin.java           (Concrete Class – Extends Admin with top-tier access)
    ModeratorAdmin.java       (Concrete Class – Extends Admin with targeted access)
    Announcement.java         (Concrete Class – Handles announcement properties)
  repository/
    AdminRepository.java      (Performs CRUD file ops on data/admins.txt)
    AnnouncementRepository.java (Performs CRUD file ops on data/announcements.txt)
  controller/
    AdminController.java      (Spring MVC Controller parsing stats & handling views)

src/main/webapp/WEB-INF/jsp/component06/
  adminDashboard.jsp, admins.jsp, oop.jsp
```

## OOP Principles
- **Abstraction**: The Admin class is explicitly declared as abstract. It mandates core architectural behaviors like getRoleName() and getPermissions() without dictating their functional code directly
- **Inheritance**: SuperAdmin and ModeratorAdmin inherit fields and underlying state routines directly from Admin, promoting code reusability while streamlining clean specialized behavior. 
- **Encapsulation**:All state fields within Admin and Announcement (such as adminId, username, password, and email) are restricted using private visibility modifiers. Access states are controlled entirely through explicit getter and setter methods.
- **Polymorphism**: The AdminController dynamically assigns object references during administrative instantiation based on selection roles, processing polymorphic objects seamlessly via the base type. Furthermore, runtime polymorphism overrides getRoleName() and getPermissions() cleanly across sub-classes
- **Interface Implementation**:The abstract Admin class incorporates the shared contract interface FileOperations to declare consistent flat-file compilation methodologies via toFileString().

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/admin

```
