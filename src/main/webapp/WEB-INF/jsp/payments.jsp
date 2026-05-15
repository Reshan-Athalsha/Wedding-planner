<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wedding.weddingplanner.model.Payment" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment History - WeddingBliss</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #f8f9fa 0%, #fff0f5 100%); min-height: 100vh; }
        .navbar { background: linear-gradient(135deg, #1a1a2e, #16213e) !important; }
        .navbar-brand, .nav-link { color: #f0c040 !important; }
        .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .card-header { background: linear-gradient(135deg, #27ae60, #1e8449); color: white; border-radius: 15px 15px 0 0 !important; padding: 20px; }
        .table thead { background: linear-gradient(135deg, #27ae60, #1e8449); color: white; }
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
        <div class="card-header">
            <h4 class="mb-0"><i class="fas fa-credit-card me-2"></i>Payment History</h4>
            <small>Booking & Payment Management — Component 03</small>
        </div>
        <div class="card-body p-4">
            <%
            ArrayList<Payment> payments = (ArrayList<Payment>) request.getAttribute("payments");
            if (payments == null || payments.isEmpty()) {
            %>
            <div class="text-center py-5">
                <i class="fas fa-credit-card fa-4x text-muted mb-3"></i>
                <h5 class="text-muted">No payments found</h5>
                <a href="/bookings" class="btn btn-primary mt-2">
                    <i class="fas fa-list me-1"></i>View Bookings
                </a>
            </div>
            <%
            } else {
            %>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Booking ID</th>
                            <th>Amount</th>
                            <th>Method</th>
                            <th>Status</th>
                            <th>Payment Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (Payment p : payments) { %>
                        <tr>
                            <td><strong><%= p.getPaymentId() %></strong></td>
                            <td><%= p.getBookingId() %></td>
                            <td>$<%= p.getAmount() %></td>
                            <td><%= p.getPaymentMethod() %></td>
                            <td><span class="badge bg-success"><%= p.getStatus() %></span></td>
                            <td><small><%= p.getPaymentDate() %></small></td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
                <small class="text-muted">Total Payments: <%= payments.size() %></small>
            </div>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>