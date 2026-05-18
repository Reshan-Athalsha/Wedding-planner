# Component 01 - User Management

**Developer:** Athalsha R.R - IT25101874
**Branch:** User-Management---Athalsha-R-R
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Manages couple/user accounts for the wedding planning system.
Handles registration, login, profile updates, and logout with session tracking.
All data stored in data/users.txt (pipe-delimited, no database).

## Routes
| Action | Route |
|---|---|
| Register | GET/POST /register |
| Login | GET/POST /login |
| View Profile | GET /profile |
| Update Profile | POST /profile/update |
| Delete Account | POST /profile/delete |
| Logout | GET /logout |

## My Files
```
src/main/java/com/ttt/component01/
  model/
    User.java              (abstract base class)
    CoupleUser.java        (concrete - extends User)
  repository/
    CoupleUserRepository.java  (reads/writes data/users.txt)
  controller/
    UserController.java    (Spring MVC controller)

src/main/webapp/WEB-INF/jsp/component01/
  login.jsp, register.jsp, profile.jsp
```

## OOP Principles
- **Abstraction**: User is abstract with abstract validate()
- **Inheritance**: CoupleUser extends User  
- **Encapsulation**: All fields private, accessed via getters/setters
- **Polymorphism**: Controller stores via User reference, retrieves CoupleUser
- **Information Hiding**: Password hashing hidden in CoupleUser

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/register
```
