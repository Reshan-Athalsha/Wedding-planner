# Component 03 - Booking and Payment Management

**Developer:** Perera M.A.L.A - IT25XXXXXX
**Branch:** Booking-and-Payment-Management-Perera.M.A.L.A
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Handles event bookings between couples and vendors,
and processes payments. A confirmed payment automatically
updates the linked booking status to CONFIRMED.
Data stored in data/bookings.txt and data/payments.txt.

## Routes
| Action | Route |
|---|---|
| All Bookings | GET /bookings |
| New Booking | GET/POST /bookings/new |
| Edit Booking | GET /bookings/edit/{id} |
| Delete Booking | GET /bookings/delete/{id} |
| All Payments | GET /payments |
| New Payment | GET/POST /payments/new |
| Checkout | GET/POST /payments/checkout/{bookingId} |

## My Files
```
src/main/java/com/ttt/component03/
  model/
    Booking.java           (booking entity)
    Payment.java           (payment entity)
  repository/
    BookingRepository.java (reads/writes data/bookings.txt)
    PaymentRepository.java (reads/writes data/payments.txt)
  controller/
    BookingController.java
    PaymentController.java

src/main/webapp/WEB-INF/jsp/component03/
  bookings.jsp, bookingForm.jsp, editBooking.jsp
  payments.jsp, paymentForm.jsp, checkout.jsp
```

## OOP Principles
- **Encapsulation**: All model fields private
- **Information Hiding**: Repository hides file read/write logic
- **Polymorphism**: Controllers handle multiple booking states uniformly

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/bookings
```
