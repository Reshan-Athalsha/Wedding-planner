# 💍 WeddingBliss Management System
### SE1020 — Year 1 Semester 2 Group Project | University of SLIIT

> A comprehensive, file-based Wedding Planning and Vendor Booking System built with Java and Spring Boot. No databases — pure file I/O with strict OOP principles.

---

## 👥 Team & Components

| # | Component | Developer | Branch |
|---|---|---|---|
| 01 | 👤 User Management | Athalsha R.R — IT25101874 | `User-Management---Athalsha-R-R` |
| 02 | 🏪 Vendor Management | Rathnayake R.M.G.C.B.B — IT25103963 | `Vendor-Management-Rathnayake-R.M.G.C.B.B` |
| 03 | 📅 Booking & Payment | Perera M.A.L.A — IT25XXXXXX | `Booking-and-Payment-Management-Perera.M.A.L.A` |
| 04 | 🗓️ Wedding Planning Tools | Edirilweera V.S — IT25XXXXXX | `Wedding-Planning-tools-Edirilweera.V.S` |
| 05 | ⭐ Reviews & Rating | Rupasinghe S.L.S — IT25XXXXXX | `Reviews-and-Rating-System-Rupasinghe.S.L.S` |
| 06 | 📊 Admin Dashboard | Bandara P.M.D.C — IT25XXXXXX | `Admin-Dashboard-and-Analytics-Bandara.P.M.D.C` |

---

## 🏗️ Architecture & OOP Implementation

This project strictly demonstrates the four pillars of Object-Oriented Programming:

- **Inheritance** — `CoupleUser`, `Vendor` subtypes extend the abstract `User` base class
- **Polymorphism** — Child classes override abstract methods (e.g., `displayRoleDetails()`)
- **Encapsulation** — All models use `private` fields with public getters/setters
- **Abstraction** — Abstract classes and interfaces define contracts for all components

---

## 💾 Data Persistence — No Database Used ✅

- All data stored in `data/` directory as pipe-delimited `.txt` files
- Centralized `FileOperations.java` utility handles all read/write operations
- `ArrayList` used for in-memory manipulation before writing back to files

---

## 💻 Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java 17+, Spring Boot 3.x |
| Frontend | JSP (JavaServer Pages), HTML5, Bootstrap 5 |
| Build | Apache Maven |
| Persistence | File I/O (`java.io`) — NO DATABASE |

---

## 📁 Project Structure

```
src/main/java/com/ttt/
├── TttApplication.java          ← Spring Boot entry point
├── HomeController.java          ← Main dashboard routing
├── shared/
│   └── FileOperations.java      ← Shared file I/O utility
├── component01/                 ← User Management
├── component02/                 ← Vendor Management
├── component03/                 ← Booking & Payment
├── component04/                 ← Wedding Planning Tools
├── component05/                 ← Reviews & Rating
└── component06/                 ← Admin Dashboard & Analytics

src/main/webapp/WEB-INF/jsp/
├── index.jsp                    ← Home dashboard
├── oop.jsp                      ← OOP demonstration page
├── component01/                 ← User Management views
├── component02/                 ← Vendor Management views
├── component03/                 ← Booking views
├── component04/                 ← Planning views
├── component05/                 ← Review views
└── component06/                 ← Admin views
```

---

## 🚀 How to Run

```bash
# 1. Clone the repository
git clone https://github.com/Reshan-Athalsha/Wedding-planner.git

# 2. Navigate into the project
cd Wedding-planner

# 3. Build with Maven
mvn clean compile

# 4. Run the application
mvn spring-boot:run
```

Then open your browser: 👉 **http://localhost:8080/**

---

## 🌿 Branch Strategy

- `main` — Base architecture shared by all (this branch)
- Each member works on their own branch with the base + their component
- All branches are merged into `main` for final submission

---

*SE1020 | Y1S2 | University of SLIIT | 2025*