# Component 02 — Vendor Management
### Contributor: Rathnayake R.M.G.C.B.B | SE1020 OOP Project — Tie The Tech (TTT)

---

## Overview
This component implements the **Vendor Management** module of the TTT Wedding Planning System.  
It demonstrates full CRUD operations backed by file-based I/O (no database).

## OOP Principles Applied
| Principle | How Applied |
|---|---|
| **Abstraction** | `Vendor` is an abstract class with abstract `calculatePricing(int)` and `getCategory()` methods |
| **Inheritance** | `VenueVendor`, `PhotographyVendor`, `CateringVendor` all `extend Vendor` |
| **Polymorphism** | `VendorController` creates `Vendor vendor = new VenueVendor(...)` — runtime polymorphism; each subclass overrides `calculatePricing()` differently |
| **Encapsulation** | All `Vendor` fields are `private` with `get/set` accessors |
| **Information Hiding** | `VendorRepository` hides all file I/O — controllers only call `findAll()`, `save()`, `deleteById()` |

## Class Hierarchy
```
Vendor (abstract)
├── VenueVendor       — per-hour × 0.8 (venue discount)
├── PhotographyVendor — per-hour × 1.2 (premium rate)
└── CateringVendor    — per-guest flat rate
```

## CRUD Operations
| Operation | Route | HTTP |
|---|---|---|
| **Create** | `/vendors/new` | POST |
| **Read (list)** | `/vendors` | GET |
| **Read (detail)** | `/vendors/{id}` | GET |
| **Update** | `/vendors/edit` | POST |
| **Delete** | `/vendors/delete/{id}` | GET |
| **Filter by category** | `/vendors?category=VENUE` | GET |

## File Storage
Data is persisted to `data/vendors.txt` in pipe-delimited format:
```
VND-A1B2C|Grand Ballroom|Colombo|VENUE|15000|4.8|Luxury venue...
VND-D3E4F|Lens Studio|Kandy|PHOTOGRAPHY|8000|4.5|Professional photography...
```

## Files in This Component
```
src/main/java/com/ttt/component02/
├── model/
│   ├── Vendor.java              (abstract base class)
│   ├── VenueVendor.java         (inherits Vendor)
│   ├── PhotographyVendor.java   (inherits Vendor)
│   └── CateringVendor.java      (inherits Vendor)
├── repository/
│   └── VendorRepository.java    (file I/O — java.io)
└── controller/
    └── VendorController.java    (Spring MVC — full CRUD)

src/main/webapp/WEB-INF/jsp/component02/
├── vendors.jsp        (list + filter)
├── vendorForm.jsp     (create form)
├── vendorDetail.jsp   (detail view)
└── editVendor.jsp     (update form)
```

## How to Run
```bash
mvn spring-boot:run
```
Then navigate to: `http://localhost:8080/vendors`
