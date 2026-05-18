# Component 02 - Vendor Management

**Developer:** Rathnayake R.M.G.C.B.B - IT25103963
**Branch:** Vendor-Management-Rathnayake-R.M.G.C.B.B
**Course:** SE1020 OOP Group Project | Tie The Tech (TTT) | SLIIT

---

## What This Component Does
Manages wedding service vendors across three specialised categories:
Venue, Catering, and Photography.
Vendors can be searched and filtered. All data in data/vendors.txt.

## Routes
| Action | Route |
|---|---|
| All Vendors | GET /vendors |
| Filter by Category | GET /vendors?category=VENUE |
| Add Vendor | GET/POST /vendors/new |
| View Detail | GET /vendors/{id} |
| Edit Vendor | GET /vendors/edit/{id} |
| Delete Vendor | GET /vendors/delete/{id} |

## My Files
```
src/main/java/com/ttt/component02/
  model/
    Vendor.java               (abstract base class)
    VenueVendor.java          (extends Vendor)
    CateringVendor.java       (extends Vendor)
    PhotographyVendor.java    (extends Vendor)
  repository/
    VendorRepository.java     (reads/writes data/vendors.txt)
  controller/
    VendorController.java     (Spring MVC controller)

src/main/webapp/WEB-INF/jsp/component02/
  vendors.jsp, vendorForm.jsp, vendorDetail.jsp, editVendor.jsp
```

## OOP Principles
- **Abstraction**: Vendor is abstract with getCategory()
- **Inheritance**: 3 subclasses extend Vendor
- **Polymorphism**: Switch expression creates correct subtype at runtime
- **Encapsulation**: All fields private with getters/setters
- **Information Hiding**: File format hidden in VendorRepository

## Run
```bash
mvn spring-boot:run
# Visit: http://localhost:8080/vendors
```
