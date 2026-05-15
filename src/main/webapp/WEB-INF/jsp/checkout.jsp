<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Checkout - WeddingBliss</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #f8f9fa 0%, #fff0f5 100%); min-height: 100vh; }
        .navbar { background: linear-gradient(135deg, #1a1a2e, #16213e) !important; }
        .navbar-brand, .nav-link { color: #f0c040 !important; }
        .card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .card-header { background: linear-gradient(135deg, #27ae60, #1e8449); color: white; border-radius: 15px 15px 0 0 !important; padding: 20px; }
        .btn-pay { background: linear-gradient(135deg, #27ae60, #1e8449); border: none; color: white; }
        .btn-pay:hover { background: linear-gradient(135deg, #1e8449, #27ae60); color: white; }
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
        <div class="col-md-6">
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger alert-dismissible fade show">
                <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% } %>
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0"><i class="fas fa-lock me-2"></i>Secure Payment Checkout</h4>
                    <small>Booking & Payment Management — Component 03</small>
                </div>
                <div class="card-body p-4">
                    <form action="/payments/process" method="post">
                        <div class="mb-4">
                            <label class="form-label text-muted small fw-bold">
                                <i class="fas fa-link me-1"></i>Booking Reference
                            </label>
                            <input type="text" class="form-control bg-light fw-bold"
                                   name="bookingId" value="<%= request.getAttribute("bookingId") %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-dollar-sign me-1"></i>Amount ($)</label>
                            <input type="number" step="0.01" class="form-control"
                                   name="amount" placeholder="e.g. 500.00" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label"><i class="fas fa-credit-card me-1"></i>Payment Method</label>
                            <select class="form-select" name="paymentMethod" required>
                                <option value="" disabled selected>Select method...</option>
                                <option value="CREDIT_CARD">Credit Card</option>
                                <option value="PAYPAL">PayPal</option>
                                <option value="BANK_TRANSFER">Bank Transfer</option>
                            </select>
                        </div>
                        <div class="d-flex justify-content-end gap-2 mt-4 pt-3 border-top">
                            <a href="/bookings" class="btn btn-secondary">
                                <i class="fas fa-arrow-left me-1"></i>Cancel
                            </a>
                            <button type="submit" class="btn btn-pay px-4 fw-bold">
                                <i class="fas fa-check-circle me-2"></i>Confirm Payment
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>