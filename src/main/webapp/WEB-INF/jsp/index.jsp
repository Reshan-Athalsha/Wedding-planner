<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeddingBliss Management System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light d-flex flex-column min-vh-100">

<!-- Visually Striking Hero Section -->
<header class="bg-dark text-white text-center py-5 mb-5 border-bottom border-warning border-5 shadow">
    <div class="container py-5">
        <i class="bi bi-balloon-heart-fill display-1 text-warning mb-3"></i>
        <h1 class="display-3 fw-bold mb-3">WeddingBliss Management System</h1>
        <p class="lead fw-light text-white-50 mb-4">The ultimate, all-in-one professional platform for planning your perfect day.</p>
        <a href="#modules" class="btn btn-warning btn-lg px-5 rounded-pill shadow-sm fw-bold">Explore Modules</a>
    </div>
</header>

<!-- Navigation Grid Section -->
<div class="container pb-5 flex-grow-1" id="modules">
    <h2 class="text-center fw-bold mb-5 text-secondary">System Modules Hub</h2>
    <div class="row g-4">

        <!-- Component 1: User Portal -->
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm border-top border-4 border-primary">
                <div class="card-body text-center p-4">
                    <i class="bi bi-person-badge fs-1 text-primary mb-3"></i>
                    <h4 class="card-title fw-bold">User Portal</h4>
                    <p class="card-text text-muted mb-4">Register new clients, login securely, and manage user profiles.</p>
                    <a href="/register" class="btn btn-outline-primary w-100 rounded-pill fw-bold">Access Portal</a>
                </div>
            </div>
        </div>

        <!-- Component 3: Booking & Payment -->
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm border-top border-4 border-warning">
                <div class="card-body text-center p-4">
                    <i class="bi bi-calendar-check fs-1 text-warning mb-3"></i>
                    <h4 class="card-title fw-bold">Booking & Payment</h4>
                    <p class="card-text text-muted mb-4">Manage wedding bookings and process payments securely.</p>
                    <a href="/bookings" class="btn btn-outline-warning w-100 rounded-pill fw-bold">Access Portal</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white-50 text-center py-4 mt-auto">
    <div class="container">
        <small>&copy; 2026 WeddingBliss Management System. Crafted for SE1020.</small>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
