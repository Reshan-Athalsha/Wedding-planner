# Component 03 — Booking & Payment Management
### Contributor: Perera M.A.L.A | SE1020 OOP Project — Tie The Tech (TTT)

---

## Overview
This component implements the **Booking & Payment Management** module of the TTT Wedding Planning System.  
Couples can book vendors, track booking status, and process payments — all persisted via file I/O.

## OOP Principles Applied
| Principle | How Applied |
|---|---|
| **Encapsulation** | `Booking` and `Payment` fields are `private` — accessed only via getters/setters |
| **Abstraction** | Both `Booking` and `Payment` implement `FileOperations` interface (abstract contract) |
| **Composition** | `Payment` contains a `bookingId` — a `Payment` cannot exist without a `Booking` |
| **Information Hiding** | `BookingRepository` and `PaymentRepository` encapsulate all file read/write logic |

## CRUD Operations
### Bookings
| Operation | Route | HTTP |
|---|---|---|
| **Create** | `/bookings/new` | POST |
| **Read** | `/bookings` | GET |
| **Update** | `/bookings/edit` | POST |
| **Cancel** | `/bookings/cancel/{id}` | GET |
| **Delete** | `/bookings/delete/{id}` | GET |

### Payments
| Operation | Route | HTTP |
|---|---|---|
| **Create/Process** | `/payments/process` | POST |
| **Read** | `/payments` | GET |
| **Checkout View** | `/payments/checkout/{bookingId}` | GET |
| **Delete** | `/payments/delete/{id}` | GET |

> 💡 **Business Logic**: Confirming a payment automatically updates the linked Booking status from `PENDING` → `CONFIRMED`

## File Storage
```
data/bookings.txt   → BKG-A1B2C|John Doe|Grand Ballroom|2026-06-15|CONFIRMED|2026-05-01
data/payments.txt   → PAY-D4E5F|BKG-A1B2C|15000.0|CARD|COMPLETED|2026-05-10 14:30:00
```

## Files in This Component
```
src/main/java/com/ttt/component03/
├── model/
│   ├── Booking.java             (encapsulated entity + FileOperations)
│   └── Payment.java             (encapsulated entity + FileOperations)
├── repository/
│   ├── BookingRepository.java   (file I/O — java.io)
│   └── PaymentRepository.java   (file I/O — java.io)
└── controller/
    ├── BookingController.java   (Spring MVC — full CRUD)
    └── PaymentController.java   (Spring MVC — process + view)

src/main/webapp/WEB-INF/jsp/component03/
├── bookings.jsp       (booking list)
├── bookingForm.jsp    (create booking)
├── editBooking.jsp    (update booking)
├── checkout.jsp       (payment form)
└── payments.jsp       (payment list)
```

## How to Run
```bash
mvn spring-boot:run
```
Navigate to: `http://localhost:8080/bookings`
