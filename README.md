# Component 04 - Wedding Planning Tools

**Developer:** Ediriweera V.S - IT25101455
**Branch:** Wedding-Planning-tools-Ediriweera.V.S
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Three integrated planning tools in one component:
1. Task Checklist - track wedding preparation tasks
2. Budget Tracker - monitor estimated vs actual spending
3. Guest List Manager - manage RSVPs and table assignments
Each has its own repository and data file.

## Routes
| Action | Route |
|---|---|
| Planning Overview | GET /planning |
| Task Checklist | GET /planning/checklist |
| Add Task | POST /planning/tasks/add |
| Complete Task | GET /planning/tasks/complete/{id} |
| Budget Tracker | GET /planning/budget |
| Add Budget Item | POST /planning/budget/add |
| Guest List | GET /planning/guests |
| Add Guest | POST /planning/guests/add |

## My Files
```
src/main/java/com/ttt/component04/
  model/
    Task.java, BudgetItem.java, Guest.java
  repository/
    TaskRepository.java        (data/tasks.txt)
    BudgetItemRepository.java  (data/budget.txt)
    GuestRepository.java       (data/guests.txt)
  controller/
    PlanningController.java    (handles all 3 tools)

src/main/webapp/WEB-INF/jsp/component04/
  planning.jsp, checklist.jsp, budget.jsp, guestList.jsp
```

## OOP Principles
- **Abstraction**: Each model represents a real planning domain object
- **Encapsulation**: Private fields, public accessors
- **Information Hiding**: Three separate repositories hide file I/O

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/planning
```
