# Component 05 - Reviews and Rating System

**Developer:** Rupasinghe S.L.S - IT25101214
**Branch:** Reviews-and-Rating-System-Rupasinghe.S.L.S
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Allows couples to leave star-rated reviews for vendors.
Two review types are supported: VerifiedReview (from confirmed bookings)
and PublicReview (open to all). Average ratings calculated per vendor.
All data stored in data/reviews.txt.

## Routes
| Action | Route |
|---|---|
| All Reviews | GET /reviews |
| Sort Reviews | GET /reviews?sort=rating |
| Submit Review | GET /reviews/submit |
| Post Review | POST /reviews/submit |
| Edit Review | GET /reviews/edit/{id} |
| Delete Review | GET /reviews/delete/{id} |

## My Files
```
src/main/java/com/ttt/component05/
  model/
    Review.java           (abstract base class)
    VerifiedReview.java   (extends Review - from confirmed bookings)
    PublicReview.java     (extends Review - open reviews)
  repository/
    ReviewRepository.java (reads/writes data/reviews.txt)
  controller/
    ReviewController.java (Spring MVC controller)

src/main/webapp/WEB-INF/jsp/component05/
  reviews.jsp, reviewForm.jsp, editReview.jsp
```

## OOP Principles
- **Abstraction**: Review is abstract with abstract getReviewType()
- **Inheritance**: VerifiedReview and PublicReview extend Review
- **Polymorphism**: Repository saves/loads any Review subtype uniformly
- **Encapsulation**: All fields private with getters/setters
- **Information Hiding**: Star rating logic in Review, file I/O in repository

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/reviews
```
