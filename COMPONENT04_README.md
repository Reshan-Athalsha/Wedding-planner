# Component 04 — Wedding Planning Tools
### Contributor: Ediriweera V.S | SE1020 OOP Project — Tie The Tech (TTT)

---

## Overview
This component implements three integrated **Wedding Planning Tools** within the TTT system:
1. **Interactive Checklist** — Task management with progress tracking
2. **Budget Tracker** — Estimated vs actual expense comparison
3. **Guest List Manager** — RSVP tracking and table assignment

## OOP Principles Applied
| Principle | How Applied |
|---|---|
| **Encapsulation** | `Task`, `Guest`, `BudgetItem` all have `private` fields with controlled getters/setters |
| **Abstraction** | All three models implement the `FileOperations` interface, enforcing `toFileString()` |
| **Composition (Association)** | `PlanningController` owns and coordinates `TaskRepository`, `GuestRepository`, and `BudgetItemRepository` |
| **Information Hiding** | All file I/O is hidden inside repositories — the controller only calls clean public methods |

## CRUD Operations

### Tasks / Checklist
| Operation | Route |
|---|---|
| Add Task | POST `/planning/tasks/add` |
| View All | GET `/planning/checklist` |
| Toggle Complete | GET `/planning/tasks/complete/{id}` |
| Delete | GET `/planning/tasks/delete/{id}` |

### Budget Items
| Operation | Route |
|---|---|
| Add Item | POST `/planning/budget/add` |
| View All + Totals | GET `/planning/budget` |
| Delete | GET `/planning/budget/delete/{id}` |

### Guest List
| Operation | Route |
|---|---|
| Add Guest | POST `/planning/guests/add` |
| View All | GET `/planning/guests` |
| Update RSVP | GET `/planning/guests/rsvp/{id}/{status}` |
| Delete | GET `/planning/guests/delete/{id}` |

## File Storage
```
data/tasks.txt        → TSK-A1B2C|Book Venue|VENUE|2026-04-01|false|BOOKING
data/budget_items.txt → BDG-D4E5F|Catering|Food for 200 guests|150000.0|145000.0
data/guests.txt       → GST-G7H8I|Nimal Perera|nimal@mail.com|CONFIRMED|5|true
```

## Files in This Component
```
src/main/java/com/ttt/component04/
├── model/
│   ├── Task.java               (checklist item)
│   ├── BudgetItem.java         (budget entry)
│   └── Guest.java              (guest with RSVP)
├── repository/
│   ├── TaskRepository.java     (file I/O)
│   ├── BudgetItemRepository.java (file I/O)
│   └── GuestRepository.java   (file I/O)
└── controller/
    └── PlanningController.java (full CRUD for all 3 entities)

src/main/webapp/WEB-INF/jsp/component04/
├── checklist.jsp    (task list + progress bar)
├── budget.jsp       (budget tracker + totals)
└── guestList.jsp    (guest list + RSVP)
```

## How to Run
```bash
mvn spring-boot:run
```
Navigate to: `http://localhost:8080/planning/checklist`
