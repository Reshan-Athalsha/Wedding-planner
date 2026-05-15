<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wedding.weddingplanner.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Bookings - WeddingBliss</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #f8f9fa 0%, #fff0f5 100%); min-height: 100vh; }
        .navbar { background: linear-gradient(135deg, #1a1a2e, #16213e) !important; }
        .navbar-brand, .nav-link { color: #f0c040 !important; }
        .nav-link:hover { color: white !important; }
        .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .card-header { background: linear-gradient(135deg, #1a1a2e, #16213e); color: #f0c040; border-radius: 15px 15px 0 0 !important; padding: 20px; }
        .table thead { background: linear-gradient(135deg, #1a1a2e, #16213e); color: #f0c040; }
        .table-hover tbody tr:hover { background-color: #fff0f5; }
        .btn-gold { background: linear-gradient(135deg, #f0c040, #d4a017); border: none; color: #1a1a2e; font-weight: bold; }
        .btn-gold:hover { background: linear-gradient(135deg, #d4a017, #f0c040); color: #1a1a2e; }
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
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <div>
                <h4 class="mb-0"><i class="fas fa-list me-2"></i>My Booking History</h4>
                <small>Booking & Payment Management — Component 03</small>
            </div>
            <a href="/bookings/new" class="btn btn-gold btn-sm">
                <i class="fas fa-plus me-1"></i>New Booking
            </a>
        </div>
        <div class="card-body p-4">
            <%
            ArrayList<Booking> bookings = (ArrayList<Booking>) request.getAttribute("bookings");
            if (bookings == null || bookings.isEmpty()) {
            %>
            <div class="text-center py-5">
                <i class="fas fa-calendar-times fa-4x text-muted mb-3"></i>
                <h5 class="text-muted">No bookings found</h5>
                <a href="/bookings/new" class="btn btn-gold mt-2">
                    <i class="fas fa-plus me-1"></i>Create First Booking
                </a>
            </div>
            <%
            } else {
            %>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Client Name</th>
                            <th>Vendor Name</th>
                            <th>Event Date</th>
                            <th>Status</th>
                            <th>Created Date</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (Booking b : bookings) { %>
                        <tr>
                            <td><strong><%= b.getBookingId() %></strong></td>
                            <td><%= b.getClientName() %></td>
                            <td><%= b.getVendorName() %></td>
                            <td><%= b.getEventDate() %></td>
                            <td>
                                <span class="badge <%=
                                    "PENDING".equals(b.getStatus()) ? "bg-warning text-dark" :
                                    "CONFIRMED".equals(b.getStatus()) ? "bg-success" :
                                    "CANCELLED".equals(b.getStatus()) ? "bg-danger" : "bg-primary"
                                %>"><%= b.getStatus() %></span>
                            </td>
                            <td><small><%= b.getCreatedDate() %></small></td>
                            <td class="text-center">
                                <% if ("PENDING".equals(b.getStatus())) { %>
                                <a href="/payments/checkout/<%= b.getBookingId() %>"
                                   class="btn btn-success btn-sm me-1">
                                    <i class="fas fa-credit-card"></i>
                                </a>
                                <% } %>
                                <a href="/bookings/edit/<%= b.getBookingId() %>"
                                   class="btn btn-warning btn-sm me-1">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <% if ("PENDING".equals(b.getStatus())) { %>
                                <a href="/bookings/cancel/<%= b.getBookingId() %>"
                                   class="btn btn-secondary btn-sm me-1"
                                   onclick="return confirm('Cancel this booking?')">
                                    <i class="fas fa-ban"></i>
                                </a>
                                <% } %>
                                <a href="/bookings/delete/<%= b.getBookingId() %>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete permanently?')">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
                <small class="text-muted">Total Bookings: <%= bookings.size() %></small>
            </div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>