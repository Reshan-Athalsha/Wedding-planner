<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wedding.weddingplanner.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Booking - WeddingBliss</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #f8f9fa 0%, #fff0f5 100%); min-height: 100vh; }
        .navbar { background: linear-gradient(135deg, #1a1a2e, #16213e) !important; }
        .navbar-brand, .nav-link { color: #f0c040 !important; }
        .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .card-header { background: linear-gradient(135deg, #f39c12, #d68910); color: white; border-radius: 15px 15px 0 0 !important; padding: 20px; }
        .btn-update { background: linear-gradient(135deg, #f39c12, #d68910); border: none; color: white; }
        .btn-update:hover { background: linear-gradient(135deg, #d68910, #f39c12); color: white; }
        .form-label { font-weight: 600; color: #555; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/"><i class="fas fa-heart me-2"></i>WeddingBliss</a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link" href="/bookings/new"><i class="fas fa-plus-circle me-1"></i>New Booking</a>
            <a class="nav-link" href="/bookings"><i class="fas fa-list me-1"></i>My Bookings</a>
            <a class="nav-link" href="/payments"><i class="fas fa-credit-card me-1"></i>Payments</a>
            <a class="nav-link" href="/"><i class="fas fa-home me-1"></i>Home</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <%
            Booking booking = (Booking) request.getAttribute("booking");
            if (booking != null) {
            %>
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0"><i class="fas fa-edit me-2"></i>Edit Booking — <%= booking.getBookingId() %></h4>
                    <small>Booking & Payment Management — Component 03</small>
                </div>
                <div class="card-body p-4">
                    <form action="/bookings/edit" method="post">
                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                        <input type="hidden" name="createdDate" value="<%= booking.getCreatedDate() %>">
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-user me-1"></i>Client Name</label>
                            <input type="text" class="form-control" name="clientName" value="<%= booking.getClientName() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-store me-1"></i>Vendor Name</label>
                            <input type="text" class="form-control" name="vendorName" value="<%= booking.getVendorName() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-calendar me-1"></i>Event Date</label>
                            <input type="date" class="form-control" name="eventDate" value="<%= booking.getEventDate() %>" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label"><i class="fas fa-info-circle me-1"></i>Booking Status</label>
                            <select class="form-select" name="status">
                                <option value="PENDING" <%= "PENDING".equals(booking.getStatus()) ? "selected" : "" %>>Pending</option>
                                <option value="CONFIRMED" <%= "CONFIRMED".equals(booking.getStatus()) ? "selected" : "" %>>Confirmed</option>
                                <option value="CANCELLED" <%= "CANCELLED".equals(booking.getStatus()) ? "selected" : "" %>>Cancelled</option>
                                <option value="COMPLETED" <%= "COMPLETED".equals(booking.getStatus()) ? "selected" : "" %>>Completed</option>
                            </select>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-update btn-lg">
                                <i class="fas fa-save me-2"></i>Update Booking
                            </button>
                            <a href="/bookings" class="btn btn-outline-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Back to Bookings
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>