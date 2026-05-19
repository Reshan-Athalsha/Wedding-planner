# Tie The Tech — Wedding Planning System

## Component 01: User Management (Authentication, Registration, Profile Management)

**Developer:** Reshan Athalsha  
**Role Branch:** `User-Management---Athalsha-R-R`  
**University Evaluation:** Individual Submission - Component 01 Isolation  

---

## 🌟 Executive Summary

This repository has been precisely pruned and isolated to showcase **Component 01 - User Management** as part of the individual academic evaluation for the Wedding Planning System, **Tie The Tech (TTT)**. All other system components have been successfully decoupled and disabled to provide a clean, dedicated, compile-safe runtime environment for assessing the core architecture, OOP adherence, and custom flat-file persistence.

The module provides robust couple registration, session-based secure authentication, and profile customization with high-fidelity UI consistency across all views.

---

## 🚀 Key Features

*   **Secure Registration & Login:** Fully responsive, modern user access portals with custom error handling, dynamic input validation, and session lifecycle management.
*   **File-Based Persistence (`java.io`):** Complete CRUD system operating on a local flat-file database (`data/users.txt`) using high-speed buffered readers and writers.
*   **Profile Management:** Custom dashboard where couples can update profile data, budget planning, guest counts, and personal wedding themes.
*   **Custom Security Safeguards:** Integrated custom sanitization utilities to defend the application from file corruption and web vulnerability attacks.
*   **Global UI Consistency:** Premium dark-themed UI featuring curated gradients, Outfit typography, glassmorphism card highlights, and micro-interactions.

---

## 🛠️ System Architecture

The package layout enforces a clean **Model-View-Controller (MVC)** and **Repository pattern** structure:

```
src/main/java/com/ttt/
│
├── HomeController.java                 # Standard page routing (index, oop)
├── TttApplication.java                 # Spring Boot application runner
│
├── component01/                        # COMPONENT 01 — USER MANAGEMENT
│   ├── controller/
│   │   └── UserController.java         # Registration, session login, profile updating
│   ├── model/
│   │   ├── User.java                   # Abstract base User model (OOP: Abstraction)
│   │   └── CoupleUser.java             # Concrete Couple User subclass (OOP: Inheritance)
│   └── repository/
│       └── CoupleUserRepository.java   # File-based database engine (OOP: Information Hiding)
│
└── shared/
    ├── FileOperations.java             # Shared interface for file serialization
    └── SecurityUtils.java              # Encryption, XSS, and delimiter injection guards
```

---

## 🧩 OOP Principles Applied

The system is engineered in strict compliance with Object-Oriented Programming (OOP) core constraints, avoiding database ORM dependencies to showcase raw software engineering discipline:

| OOP Principle | Technical Implementation & Evidence |
| :--- | :--- |
| **Abstraction** | Implemented via the `abstract` base class `com.ttt.component01.model.User` and the `com.ttt.shared.FileOperations` interface. The base class forces a domain model contract by declaring the abstract method `displayRoleDetails()`, abstracting behavior from concrete implementations. |
| **Inheritance** | The concrete class `CoupleUser` inherits from the abstract class `User` (`public class CoupleUser extends User`). This reuses core properties (`userId`, `name`, `email`, `password`, `role`) while allowing the subclass to extend attributes with couple-specific fields like `weddingDate`, `budget`, `guestCount`, and `theme`. |
| **Encapsulation** | All domain model fields are declared `private` to enforce information encapsulation. State transitions and modifications are governed strictly through public getters and setters with appropriate type casting, ensuring data integrity. |
| **Polymorphism** | Leveraged inside `UserController.java` where runtime objects are bound dynamically. During registration, the controller declares a parent reference `User newUser = new CoupleUser(...)` and stores it dynamically. It also overrides `toFileString()` and `displayRoleDetails()` polymorphically. |
| **Information Hiding** | Handled by `CoupleUserRepository.java`. It hides all low-level file stream interactions, buffer operations, and parsing mechanisms (`BufferedReader`, `BufferedWriter`, `FileWriter`, and delimiter splits) from the controller, presenting only clean CRUD methods (`save`, `findById`, `findAll`). |

---

## 🛡️ Security Implementation

Since persistence is built on a custom pipe-delimited (`|`) flat-file database system, the application is highly vulnerable to injection attacks and cross-site scripting without proper validation. To address this, a dedicated security utility class, `SecurityUtils.java`, was engineered to sanitize and clean all inputs before writing them to the database or rendering them in JSP templates:

### 1. Delimiter Injection Prevention (`|`)
Because fields in `data/users.txt` are serialized using a pipe separator:
```text
USR-A7B8C|Reshan Athalsha|reshan@gmail.com|pass123|COUPLE|2026-10-18|50000.0|150|Rustic Floral
```
If a user registers with a name like `John | Admin | extra_data`, the file structure would break, resulting in database corruption or privilege escalation.
*   **Defense:** `SecurityUtils.sanitizeForFile(input)` searches for and removes all pipes (`|`), carriage returns (`\r`), and newlines (`\n`) to preserve the record structure:
    ```java
    public static String sanitizeForFile(String input) {
        if (input == null) return null;
        return input.replace("|", "").replace("\n", " ").replace("\r", " ");
    }
    ```

### 2. Cross-Site Scripting (XSS) Prevention
To prevent malicious scripts from being persisted and executed in other users' browsers or administrative views:
*   **Defense:** `SecurityUtils.escapeHtml(input)` converts dangerous HTML metacharacters into safe, displayable HTML entities:
    ```java
    public static String escapeHtml(String input) {
        if (input == null) return null;
        return input.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
    ```

### 3. Double-Layer Chained Security
*   The `clean(input)` method chains both functions to deliver bulletproof sanitization before file persistence:
    ```java
    public static String clean(String input) {
        return sanitizeForFile(escapeHtml(input));
    }
    ```

---

## 🚀 Running the Application

### Prerequisites
*   Java Development Kit (JDK 17 or higher)
*   Apache Maven 3.8+

### Setup & Run
1.  Clone the branch locally and navigate to the project directory:
    ```bash
    git checkout User-Management---Athalsha-R-R
    ```
2.  Clean compile and launch the Spring Boot dev server:
    ```bash
    mvn clean spring-boot:run
    ```
3.  Open your browser and navigate to:
    ```
    http://localhost:8080/
    ```

*Note: Navigation links to components 02-06 are visually marked as disabled in the navigation bar and home page cards to maintain compile safety and isolate the evaluation scope of Component 01.*
